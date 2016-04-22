package jadx.samples;

import jadx.samples.otherpkg.C.E;
import jadx.samples.otherpkg.D;

public class TestImports2 extends AbstractTest {

    public static class X1 extends E {
    }

    public static class X2 extends D.E {
    }

    public static void main(String[] strArr) {
        new TestImports2().testRun();
    }

    public Object f1() {
        return new E() {
            public String toString() {
                return "C.E";
            }
        };
    }

    public Object f2() {
        return new D.E() {
            public String toString() {
                return "D.E";
            }
        };
    }

    public boolean testRun() {
        return true;
    }
}
