package jadx.samples;

public class TestTypeResolver extends AbstractTest {
    private final int f1;

    public static class TestTernaryInSuper extends TestTypeResolver {
        public TestTernaryInSuper(int i) {
        }
    }

    public TestTypeResolver() {
        this.f1 = 2;
    }

    public TestTypeResolver(int i, int i2) {
        this(i, i2, 0, 0, 0);
    }

    public TestTypeResolver(int i, int i2, int i3, int i4, int i5) {
        this.f1 = i;
    }

    public static void main(String[] strArr) throws Exception {
        new TestTypeResolver().testRun();
    }

    public boolean testRun() throws Exception {
        return true;
    }
}
