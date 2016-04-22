package jadx.samples;

public class TestInner extends AbstractTest {
    public static int count = -2;

    public static class MyException extends Exception {
        public MyException(String str, Exception exception) {
            super("msg:" + str, exception);
        }
    }

    public static class MyThread extends Thread {
        public MyThread(String str) {
            super(str);
        }

        public void run() {
            TestInner.count++;
            super.run();
        }
    }

    public static class MyInceptionThread extends MyThread {

        public static class MyThread2 extends Thread {
            public void run() {
                TestInner.count += 2;
            }
        }

        public MyInceptionThread() {
            super("MyInceptionThread");
        }

        public void run() {
            MyThread2 myThread2 = new MyThread2();
            myThread2.start();
            try {
                myThread2.join();
            } catch (InterruptedException e) {
                AbstractTest.assertTrue(false);
            }
        }
    }

    public void func() {
        new Runnable() {
            public void run() {
                TestInner.count += 4;
            }
        }.run();
    }

    public void func2() {
        new Runnable() {
            {
                TestInner.count += 5;
            }

            public void run() {
                TestInner.count += 6;
            }
        }.run();
    }

    public String func3() {
        return new Object() {
            {
                TestInner.count += 7;
            }

            public String toString() {
                TestInner.count += 8;
                return Integer.toString(TestInner.count);
            }
        }.toString();
    }

    public boolean testRun() throws Exception {
        TestInner testInner = new TestInner();
        count = 0;
        testInner.func();
        testInner.func2();
        new Runnable() {
            public void run() {
                TestInner.count += 8;
            }
        }.run();
        MyThread myThread = new MyThread("my thread");
        myThread.start();
        MyInceptionThread myInceptionThread = new MyInceptionThread();
        myInceptionThread.start();
        myThread.join();
        myInceptionThread.join();
        AbstractTest.assertEquals((Object) func3(), (Object) "41");
        return count == 41;
    }
}
