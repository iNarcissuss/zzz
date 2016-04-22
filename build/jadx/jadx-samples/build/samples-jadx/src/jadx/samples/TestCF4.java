package jadx.samples;

public class TestCF4 extends AbstractTest {
    int c;
    String d;
    String f;

    public static void main(String[] strArr) throws Exception {
        new TestCF4().testRun();
    }

    public void checkComplexIf() {
        this.d = null;
        this.f = null;
        this.c = 2;
        testComplexIf("abcdef", 0);
        AbstractTest.assertEquals(this.c, 99);
        this.d = "";
        this.f = null;
        this.c = 0;
        testComplexIf("abcdef", 0);
        AbstractTest.assertEquals(this.c, 97);
        this.d = "";
        this.f = "1";
        this.c = 777;
        testComplexIf("ab", -1);
        AbstractTest.assertEquals(this.c, 777);
    }

    public void testComplexIf(String str, int i) {
        if (this.d == null || (this.c == 0 && i != -1 && this.d.length() == 0)) {
            this.c = str.codePointAt(this.c);
        } else if (str.length() != 2) {
            this.c = this.f.compareTo(str);
        }
    }

    public boolean testRun() throws Exception {
        checkComplexIf();
        return true;
    }
}
