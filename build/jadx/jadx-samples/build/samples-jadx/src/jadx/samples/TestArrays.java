package jadx.samples;

import java.lang.reflect.Array;

public class TestArrays extends AbstractTest {
    public static void main(String[] strArr) throws Exception {
        new TestArrays().testRun();
    }

    private static Object test4(int i) {
        return i == 1 ? new int[]{1, 2} : i == 2 ? new float[]{1.0f, 2.0f} : i == 3 ? new short[]{(short) 1, (short) 2} : i == 4 ? new byte[]{(byte) 1, (byte) 2} : null;
    }

    public int test1(int i) {
        return new int[]{1, 2, 3, 5}[i];
    }

    public int test2(int i) {
        return ((int[][]) Array.newInstance(Integer.TYPE, new int[]{i, i + 1})).length;
    }

    public int test3(int i) {
        return ((boolean[][][][][][][][]) Array.newInstance(Boolean.TYPE, new int[]{i, i, i, i, i, i, i, i})).length;
    }

    public boolean testRun() throws Exception {
        AbstractTest.assertEquals(test1(2), 3);
        AbstractTest.assertEquals(test2(2), 2);
        AbstractTest.assertEquals(test3(2), 2);
        AbstractTest.assertTrue(test4(4) instanceof byte[]);
        return true;
    }
}
