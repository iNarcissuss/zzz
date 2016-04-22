package jadx.samples;

public abstract class AbstractTest {
    public static void assertEquals(float f, float f2) {
        if (Float.compare(f, f2) != 0) {
            throw new AssertionError(f + " != " + f2);
        }
    }

    public static void assertEquals(int i, int i2) {
        if (i != i2) {
            throw new AssertionError(i + " != " + i2);
        }
    }

    public static void assertEquals(Object obj, Object obj2) {
        if (obj == null) {
            if (obj2 != null) {
                throw new AssertionError(obj + " != " + obj2);
            }
        } else if (!obj.equals(obj2)) {
            throw new AssertionError(obj + " != " + obj2);
        }
    }

    public static void assertFalse(boolean z) {
        if (z) {
            throw new AssertionError();
        }
    }

    public static void assertTrue(boolean z) {
        if (!z) {
            throw new AssertionError();
        }
    }

    public static void assertTrue(boolean z, String str) {
        if (!z) {
            throw new AssertionError(str);
        }
    }

    public static void fail() {
        throw new AssertionError();
    }

    public abstract boolean testRun() throws Exception;
}
