package jadx.samples;

import java.io.IOException;

public class TestTryCatch extends AbstractTest {
    public boolean mDiscovering = true;
    public Object mObject = new Object();

    private static boolean exc(Object obj) throws Exception {
        if (obj != null) {
            return obj instanceof Object;
        }
        throw new Exception("test");
    }

    private static boolean exc2(Object obj) throws IOException {
        if (obj != null) {
            return true;
        }
        throw new IOException();
    }

    public static void main(String[] strArr) throws Exception {
        new TestTryCatch().testRun();
    }

    private static boolean test0(Object obj) {
        try {
            synchronized (obj) {
                obj.wait(5);
            }
            return true;
        } catch (InterruptedException e) {
            return false;
        }
    }

    private static boolean test1(Object obj) {
        try {
            return exc(obj);
        } catch (Exception e) {
            return false;
        }
    }

    private static boolean test2(Object obj) {
        try {
            return exc(obj);
        } catch (Exception e) {
            return obj != null;
        }
    }

    private static boolean test3(Object obj) {
        boolean exc;
        try {
            exc = exc(obj);
        } catch (Exception e) {
            exc = false;
        } finally {
            test0(obj);
        }
        return exc;
    }

    private static String test4(Object obj) {
        try {
            String str = "good" + exc(obj);
            exc2("a");
            return str;
        } catch (IOException e) {
            return "io exc";
        } catch (Exception e2) {
            return "exc";
        }
    }

    private static String test5(Object obj) {
        String str = "good";
        try {
            return !exc2("a") ? "f == false" : "" + exc(obj);
        } catch (Exception e) {
            return "exc";
        }
    }

    private static boolean test6(Object obj) {
        Object obj2 = obj;
        while (true) {
            try {
                return exc2(obj2);
            } catch (IOException e) {
            } catch (Throwable th) {
                if (obj2 == null) {
                    obj2 = new Object();
                }
            }
        }
    }

    private static boolean test7() {
        Object obj = null;
        while (true) {
            try {
                return exc2(obj);
            } catch (IOException e) {
                obj = new Object();
            } catch (Throwable th) {
                if (obj == null) {
                }
            }
        }
    }

    private boolean test8(Object obj) {
        this.mDiscovering = false;
        try {
            exc(obj);
        } catch (Exception e) {
            e.toString();
        } finally {
            this.mDiscovering = true;
        }
        return this.mDiscovering;
    }

    private boolean test8a(Object obj) {
        this.mDiscovering = false;
        try {
            exc(obj);
            if (!this.mDiscovering) {
                this.mDiscovering = true;
            }
        } catch (Exception e) {
            e.toString();
            if (!this.mDiscovering) {
                this.mDiscovering = true;
            }
        } catch (Throwable th) {
            if (!this.mDiscovering) {
                this.mDiscovering = true;
            }
        }
        return this.mDiscovering;
    }

    private static boolean testSynchronize(Object obj) throws InterruptedException {
        synchronized (obj) {
            if (obj instanceof String) {
                return false;
            }
            obj.wait(5);
            return true;
        }
    }

    private static synchronized boolean testSynchronize2(Object obj) throws InterruptedException {
        boolean z;
        synchronized (TestTryCatch.class) {
            z = obj.toString() != null;
        }
        return z;
    }

    private boolean testSynchronize3() {
        boolean z;
        synchronized (this.mObject) {
            z = this.mDiscovering;
        }
        return z;
    }

    public int catchInLoop(int i, int i2) {
        while (i < i2) {
            int i3 = i2 + 1;
            try {
                i = i2 / i;
                i2 = i3;
            } catch (RuntimeException e) {
                i = 10;
                i2 = i3;
            }
        }
        return i2;
    }

    public boolean testRun() throws Exception {
        Object obj = new Object();
        AbstractTest.assertTrue(test0(obj));
        AbstractTest.assertTrue(test1(obj));
        AbstractTest.assertTrue(test2(obj));
        AbstractTest.assertTrue(test3(obj));
        AbstractTest.assertTrue(test4(obj) != null);
        AbstractTest.assertTrue(test5(null) != null);
        AbstractTest.assertTrue(test6(obj));
        AbstractTest.assertTrue(test7());
        AbstractTest.assertTrue(testSynchronize(obj));
        AbstractTest.assertFalse(testSynchronize("str"));
        AbstractTest.assertTrue(testSynchronize2("str"));
        AbstractTest.assertTrue(testSynchronize3());
        AbstractTest.assertTrue(test8("a"));
        AbstractTest.assertTrue(test8(null));
        AbstractTest.assertTrue(test8a("a"));
        AbstractTest.assertTrue(test8a(null));
        AbstractTest.assertEquals(catchInLoop(1, 0), 0);
        AbstractTest.assertEquals(catchInLoop(0, 1), 2);
        AbstractTest.assertEquals(catchInLoop(788, 100), 100);
        return true;
    }
}
