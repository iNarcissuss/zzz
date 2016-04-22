package jadx.samples;

import java.util.Arrays;

public class TestInvoke extends AbstractTest {
    private int f;

    public TestInvoke() {
        this(-1);
    }

    public TestInvoke(int i) {
        this.f = i;
    }

    public static void main(String[] strArr) throws Exception {
        new TestInvoke().testRun();
    }

    private void parse(String[] strArr) {
        if (strArr.length > 0) {
            this.f = Integer.parseInt(strArr[0]);
        } else {
            this.f = 20;
        }
    }

    private String testSameArgTypes(String str, String str2) {
        return str.equals(str2) ? null : str;
    }

    private boolean testVarArgs(String str, String... strArr) {
        return Arrays.toString(strArr).length() + str.length() > 0;
    }

    private String testVarArgs2(char[]... cArr) {
        String str = "";
        for (char[] str2 : cArr) {
            str = str + new String(str2);
        }
        return str;
    }

    public int getF() {
        return this.f;
    }

    public boolean testRun() throws Exception {
        TestInvoke testInvoke = new TestInvoke();
        testInvoke.parse(new String[]{"12", "35"});
        AbstractTest.assertTrue(testInvoke.getF() == 12);
        testInvoke.parse(new String[0]);
        AbstractTest.assertTrue(testInvoke.getF() == 20);
        AbstractTest.assertTrue(testInvoke.testVarArgs("a", "2", "III"));
        AbstractTest.assertTrue(testInvoke.testVarArgs2("a".toCharArray(), new char[]{'1', '2'}).equals("a12"));
        AbstractTest.assertEquals((Object) testSameArgTypes("a", "b"), (Object) "a");
        return true;
    }
}
