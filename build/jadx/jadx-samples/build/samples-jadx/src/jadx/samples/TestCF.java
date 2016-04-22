package jadx.samples;

public class TestCF extends AbstractTest {
    public static void main(String[] strArr) throws Exception {
        System.out.println("TestCF: " + new TestCF().testRun());
    }

    public static void test_hello(String[] strArr) {
        System.out.println("Hello world!");
    }

    public static void test_print(String[] strArr) {
        for (String println : strArr) {
            System.out.println(println);
        }
    }

    public int test1(int i) {
        return i > 0 ? 1 : (i + 2) * 3;
    }

    public int test1a(int i) {
        if (i > 0) {
            i++;
        }
        return (i * 2) + 3;
    }

    public int test1b(int i) {
        if (i > 0) {
            i = i < 5 ? i + 1 : i - 2;
        }
        return (i * 2) + 3;
    }

    public int test1c(int i, int i2) {
        return (i > 0 ? (int) (5 + ((long) i)) : (int) (7.7d * ((double) i))) + i2;
    }

    public int test2(int i, int i2) {
        int i3 = i + i2;
        while (i < i2) {
            i3 *= 2;
            i++;
        }
        return i3 - 1;
    }

    public int test2a(int i, int i2) {
        int i3 = i + i2;
        while (i < i2) {
            i3 = i == 7 ? i3 + 2 : i3 * 2;
            i++;
        }
        return i3 - 1;
    }

    public int test3(int i, int i2) {
        int i3 = 0;
        int i4 = i;
        while (i4 < i2) {
            int i5 = (i * i4) + 5;
            i3 = i4 == 7 ? i3 + (i5 + i) : i3 * (i5 + i2);
            i4++;
        }
        return i3;
    }

    public int test4(int i, int i2) {
        int i3 = i;
        int i4 = 0;
        while (i3 < i2) {
            int i5 = i3 == 7 ? i : i2;
            i4 *= i5 + i2;
            i5 = i3 == 7 ? (i5 + i) + i4 : (i5 + i2) * i4;
            i3++;
            i4 = i5;
        }
        return i4;
    }

    public int test5(int i, int i2) {
        while (true) {
            int i3 = i2 + i;
            if (i3 >= 7) {
                return i2;
            }
            i2 = i3;
        }
    }

    public int test6(int i, int i2) {
        while (true) {
            int i3 = i2 + i;
            if (i3 < 7) {
                return i2;
            }
            i2 = i3;
        }
    }

    public int test7(int i, int i2) {
        int i3 = i2;
        while (true) {
            i2 = i3 + i;
            if (i2 >= 7) {
                break;
            }
            i3 = i2;
        }
        while (true) {
            int i4 = i3 + i;
            if (i4 < 7) {
                return i3;
            }
            i3 = i4;
        }
    }

    public int testIfElse(String str) {
        int i = str.equals("a") ? 1 : str.equals("b") ? 2 : str.equals("3") ? 3 : str.equals("$") ? 4 : -1;
        return Math.abs(i * 10);
    }

    public int testIfElse2(String str) {
        String str2;
        if (str.length() == 5) {
            str2 = new String("1");
            str2.trim();
            str2.length();
        }
        str2 = new String("22");
        str2.toLowerCase();
        return str2.length();
    }

    public void testInfiniteLoop() {
        while (true) {
            System.out.println("test");
        }
    }

    public boolean testRun() throws Exception {
        TestCF testCF = new TestCF();
        AbstractTest.assertEquals(testCF.test1(1), 1);
        AbstractTest.assertEquals(testCF.test1(-1), 3);
        AbstractTest.assertEquals(testCF.test1a(12), 29);
        AbstractTest.assertEquals(testCF.test1b(-1), 1);
        AbstractTest.assertEquals(testCF.test1b(3), 11);
        AbstractTest.assertEquals(testCF.test1b(12), 23);
        AbstractTest.assertEquals(testCF.test1c(-1, 1), -6);
        AbstractTest.assertEquals(testCF.test1c(3, 2), 10);
        AbstractTest.assertEquals(testCF.test2(2, 4), 23);
        AbstractTest.assertEquals(testCF.test2(6, 4), 9);
        AbstractTest.assertEquals(testCF.test2a(5, 9), 115);
        AbstractTest.assertEquals(testCF.test2a(8, 23), 1015807);
        AbstractTest.assertEquals(testCF.test3(5, 9), 2430);
        AbstractTest.assertEquals(testCF.test3(8, 23), 0);
        AbstractTest.assertEquals(testCF.test4(5, 9), 3240);
        AbstractTest.assertEquals(testCF.test4(8, 15), 0);
        AbstractTest.assertEquals(testCF.testIfElse("b"), 20);
        AbstractTest.assertEquals(testCF.testIfElse("c"), 10);
        AbstractTest.assertEquals(testCF.testIfElse2("12345"), 2);
        return true;
    }
}
