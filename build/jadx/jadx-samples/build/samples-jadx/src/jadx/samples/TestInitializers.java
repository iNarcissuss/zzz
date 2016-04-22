package jadx.samples;

public class TestInitializers extends AbstractTest {
    private static String a = "a0";
    private static int counter = 0;
    private A c_a = new A();

    public class B {
        private int b;
        private int bbb = 123;

        public B() {
            if (TestInitializers.this.c_a.z()) {
                this.b = -1;
            } else {
                this.b = 1;
            }
        }

        public B(int i) {
            this.b = i;
        }

        public int getB() {
            return this.b;
        }

        public int getBBB() {
            return this.bbb;
        }

        public void setB(int i) {
            this.b = i;
        }
    }

    public static class A {
        public static String a = "a1";

        public boolean z() {
            return true;
        }
    }

    static /* synthetic */ int access$108() {
        int i = counter;
        counter = i + 1;
        return i;
    }

    public static void main(String[] strArr) throws Exception {
        new TestInitializers().testRun();
    }

    public boolean testRun() throws Exception {
        boolean z = false;
        AbstractTest.assertTrue(counter == 0);
        AbstractTest.assertTrue(a.equals("a0"));
        AbstractTest.assertTrue(A.a.equals("a1"));
        AbstractTest.assertTrue(new B() {
            {
                TestInitializers.access$108();
                setB(TestInitializers.counter);
            }
        }.getB() == 1);
        AbstractTest.assertTrue(new B() {
            private int bb = 100;

            public int getB() {
                return super.getB();
            }
        }.getB() == -1);
        AbstractTest.assertTrue(new B().getB() == -1);
        AbstractTest.assertTrue(counter == 1);
        B b = new B(3);
        if (b.getB() == 3 && b.getBBB() == 123) {
            z = true;
        }
        AbstractTest.assertTrue(z);
        return true;
    }
}
