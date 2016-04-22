package jadx.samples;

public class TestTypeResolver2 extends AbstractTest {
    private static String result = "";

    private static void doPrint(Integer num) {
        AbstractTest.fail();
    }

    private static void doPrint(Object obj) {
        result += obj + " ";
    }

    private static void doPrint(String str) {
        AbstractTest.fail();
    }

    public static void main(String[] strArr) throws Exception {
        new TestTypeResolver2().testRun();
    }

    public void testOverloadedMethods() {
        Object obj = "The";
        Object obj2 = "answer";
        doPrint((Object) "You should know:");
        for (int i = 0; i < 2; i++) {
            doPrint(obj);
            doPrint(obj2);
            obj = "is";
            obj2 = new Integer(42);
        }
    }

    public boolean testRun() throws Exception {
        testOverloadedMethods();
        AbstractTest.assertEquals((Object) result, (Object) "You should know: The answer is 42 ");
        return true;
    }
}
