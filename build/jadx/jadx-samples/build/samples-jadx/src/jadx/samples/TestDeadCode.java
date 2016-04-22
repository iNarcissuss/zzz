package jadx.samples;

public class TestDeadCode extends AbstractTest {
    private void test1(int i) {
        if (i != 0) {
        }
    }

    public boolean testRun() throws Exception {
        return true;
    }
}
