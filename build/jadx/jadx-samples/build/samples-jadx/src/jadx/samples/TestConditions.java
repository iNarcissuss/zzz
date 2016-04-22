package jadx.samples;

public class TestConditions extends AbstractTest {
    public static void main(String[] strArr) throws Exception {
        new TestConditions().testRun();
    }

    private boolean test6(boolean z, boolean z2, boolean z3) {
        return (z && z2) || z3;
    }

    public boolean accept(String str) {
        return str.startsWith("Test") && str.endsWith(".class") && !str.contains("$");
    }

    public int test1(int i) {
        Object obj = (i < 59 || i > 66) ? null : 1;
        return obj != null ? i + 1 : i;
    }

    public int test1a(int i) {
        Object obj = (i < 59 || i > 66) ? 1 : null;
        return obj != null ? i - 1 : i;
    }

    public int test1b(int i) {
        Object obj = (i < 59 || i > 66 || i == 62) ? null : 1;
        return obj != null ? i + 1 : i;
    }

    public boolean test1c(int i) {
        return i == 4 || i == 6;
    }

    public boolean test2(int i) {
        return (i == 4 || i == 6) ? String.valueOf(i).equals("4") : i == 5 ? true : toString().equals("a");
    }

    public void test3(boolean z, boolean z2) {
        if (z || z2) {
            throw new RuntimeException();
        }
        test1(0);
    }

    public void test4(int i) {
        if (i == 4 || i == 6 || i == 8 || i == 10) {
            accept("a");
        }
    }

    public boolean test5(int i) {
        return i > 5 && (i < 10 || i == 7);
    }

    public boolean testRun() throws Exception {
        AbstractTest.assertEquals(test1(50), 50);
        AbstractTest.assertEquals(test1(60), 61);
        AbstractTest.assertEquals(test1a(50), 49);
        AbstractTest.assertEquals(test1a(60), 60);
        AbstractTest.assertEquals(test1b(60), 61);
        AbstractTest.assertEquals(test1b(62), 62);
        AbstractTest.assertTrue(test1c(4));
        AbstractTest.assertFalse(test1c(5));
        AbstractTest.assertTrue(accept("Test.class"));
        test3(false, false);
        AbstractTest.assertFalse(test5(4));
        AbstractTest.assertFalse(test5(11));
        AbstractTest.assertTrue(test5(6));
        AbstractTest.assertTrue(test5(7));
        AbstractTest.assertTrue(test5(8));
        AbstractTest.assertTrue(test6(true, true, false));
        AbstractTest.assertTrue(test6(false, false, true));
        AbstractTest.assertFalse(test6(true, false, false));
        return true;
    }
}
