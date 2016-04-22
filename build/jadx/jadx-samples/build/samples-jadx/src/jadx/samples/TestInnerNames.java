package jadx.samples;

import jadx.samples.TestInner.MyThread;

public class TestInnerNames extends AbstractTest {
    public int D;

    public class A extends MyThread {
        public A(String str) {
            super(str);
        }
    }

    public class B extends A {

        public class C extends jadx.samples.TestInner2.B {
        }

        public B(String str) {
            super(str);
        }
    }

    public class C extends jadx.samples.TestInner2.B {
    }

    public class D extends jadx.samples.TestInner2.D {
    }

    public static void main(String[] strArr) throws Exception {
        new TestInnerNames().testRun();
    }

    public boolean testRun() throws Exception {
        return true;
    }
}
