package jadx.samples;

import java.lang.reflect.Method;

public class TestInner2 extends AbstractTest {
    static final int SYNTHETIC = 4096;
    private static String b;
    private static String d;
    private String a;
    private String c;

    public class A {
        public A() {
            TestInner2.this.a = "a";
        }

        public String a() {
            return TestInner2.this.a;
        }
    }

    public static class B {
        public B() {
            TestInner2.b = "b";
        }

        public String b() {
            return TestInner2.b;
        }
    }

    public class C {
        public String c() {
            TestInner2.this.setC("c");
            return TestInner2.this.c;
        }
    }

    public static class D {
        public String d() {
            TestInner2.setD("d");
            return TestInner2.d;
        }
    }

    public static void main(String[] strArr) throws Exception {
        new TestInner2().testRun();
    }

    private void setC(String str) {
        this.c = str;
    }

    private static void setD(String str) {
        d = str;
    }

    public boolean testRun() throws Exception {
        AbstractTest.assertTrue(new A().a().equals("a"));
        AbstractTest.assertTrue(this.a.equals("a"));
        AbstractTest.assertTrue(new B().b().equals("b"));
        AbstractTest.assertTrue(b.equals("b"));
        AbstractTest.assertTrue(new C().c().equals("c"));
        AbstractTest.assertTrue(this.c.equals("c"));
        AbstractTest.assertTrue(new D().d().equals("d"));
        AbstractTest.assertTrue(d.equals("d"));
        for (Method method : TestInner2.class.getDeclaredMethods()) {
            if (method.getName().startsWith("access$")) {
                AbstractTest.assertTrue((method.getModifiers() & SYNTHETIC) != 0, "Synthetic methods must be removed");
            }
        }
        return true;
    }
}
