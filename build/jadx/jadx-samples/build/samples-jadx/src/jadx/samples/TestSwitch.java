package jadx.samples;

public class TestSwitch extends AbstractTest {
    public static void main(String[] strArr) {
        new TestSwitch().testRun();
    }

    public static int test1(int i) {
        switch (i * 4) {
            case 1:
                return 0;
            case 10:
                return 1;
            case 100:
                return 2;
            case 1000:
                return 3;
            default:
                return i - 77;
        }
    }

    public static int test2(int i) {
        switch (i) {
            case 1:
                return 0;
            case 2:
                return 1;
            case 3:
                return 2;
            case 5:
                return 3;
            case 7:
                return 4;
            case 9:
                return 5;
            default:
                return -(i / 2);
        }
    }

    public static int test3(int i, int i2) {
        switch (i) {
            case 1:
                return i2 == 0 ? 0 : -1;
            case 2:
                return 1;
            default:
                return -1;
        }
    }

    public static int test4(int i) {
        switch (i) {
            case 1:
                throw new RuntimeException("test4");
            case 2:
                return 1;
            default:
                return -1;
        }
    }

    public static int test5(int i, int i2) {
        switch (i) {
            case 1:
                if (i2 == 0) {
                    return 3;
                }
                break;
            case 2:
                break;
            default:
                return -1;
        }
        return i2 + 1;
    }

    public String escape(String str) {
        int length = str.length();
        StringBuilder stringBuilder = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            char charAt = str.charAt(i);
            switch (charAt) {
                case '.':
                case '/':
                    stringBuilder.append('_');
                    break;
                case '?':
                    break;
                case ']':
                    stringBuilder.append('A');
                    break;
                default:
                    stringBuilder.append(charAt);
                    break;
            }
        }
        return stringBuilder.toString();
    }

    public boolean testRun() {
        boolean z = false;
        AbstractTest.assertTrue(test1(25) == 2);
        AbstractTest.assertTrue(test2(5) == 3);
        AbstractTest.assertTrue(test3(1, 0) == 0);
        if (test4(2) == 1) {
            z = true;
        }
        AbstractTest.assertTrue(z);
        AbstractTest.assertEquals((Object) escape("a.b/c]d?e"), (Object) "a_b_cAde");
        return true;
    }
}
