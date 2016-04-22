package jadx.samples;

import jadx.samples.otherpkg.A;

public class TestImports extends AbstractTest {

    public class C extends A {
        public B getB() {
            return null;
        }
    }

    public static void main(String[] strArr) {
        new TestImports().testRun();
    }

    public boolean testRun() {
        return true;
    }
}
