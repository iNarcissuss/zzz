package jadx.samples;

public class TestStringProcessing extends AbstractTest {
    public boolean testRun() throws Exception {
        testStringEscape();
        testStringConcat();
        return true;
    }

    public void testStringConcat() {
        AbstractTest.assertEquals((Object) "a" + "1", (Object) "a1");
    }

    public void testStringEscape() {
        boolean z = true;
        AbstractTest.assertTrue("test\tstr\n".length() == 9);
        if ("test\bunicodeሴ".charAt(4) != '\b') {
            z = false;
        }
        AbstractTest.assertTrue(z);
    }
}
