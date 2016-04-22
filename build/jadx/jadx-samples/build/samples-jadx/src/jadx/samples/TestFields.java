package jadx.samples;

import java.util.Arrays;

public class TestFields extends AbstractTest {
    private static final boolean fb = true;
    private static final boolean fbz = false;
    private static final double fd = 3.14d;
    private static final double[] fda = new double[]{3.14d, 2.7d};
    private static final int fi = 5;
    private static final int fiz = 0;
    private static final String fstr = "final string";
    private static int si = fi;

    public static class ConstFields {
        public static final boolean BOOL = false;
        public static final int CONST_INT = 56789;
        public static final double PI = 3.14d;
        public static final String STR = "string";
        public static final int ZERO = 0;
    }

    public static void main(String[] strArr) throws Exception {
        new TestFields().testRun();
    }

    public void testConstsFields() {
        AbstractTest.assertEquals((int) (((long) (ConstFields.CONST_INT + (ConstFields.STR.length() + ConstFields.STR.indexOf(105)))) + Math.round(3.14d)), 56801);
    }

    public boolean testRun() throws Exception {
        testConstsFields();
        return ("false0true5final string3.14" + Arrays.toString(fda) + si).equals("false0true5final string3.14[3.14, 2.7]5");
    }
}
