package jadx.samples;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class TestCF3 extends AbstractTest {
    private boolean enabled;
    public String f = "str//ing";
    private int f2 = 1;

    private int exc() throws Exception {
        return 1;
    }

    private void f() {
        try {
            Thread.sleep(50);
        } catch (InterruptedException e) {
        }
    }

    public static void main(String[] strArr) throws Exception {
        new TestCF3().testRun();
    }

    private int next() {
        return 1;
    }

    private void setEnabled(boolean z) {
        this.enabled = z;
    }

    private void testIfInLoop() {
        int i = 0;
        for (int i2 = 0; i2 < this.f.length(); i2++) {
            if (this.f.charAt(i2) == '/') {
                i++;
                if (i == 2) {
                    setEnabled(true);
                    return;
                }
            }
        }
        setEnabled(false);
    }

    public static boolean testLabeledBreakContinue() {
        String str = "Look for a substring in me";
        str = "sub";
        return false;
    }

    private int testLoops(int[] iArr, int i) {
        int i2 = 0;
        int i3 = 0;
        while (i3 < iArr.length && i3 < i) {
            iArr[i3] = iArr[i3] + 1;
            i3++;
        }
        while (i3 < iArr.length) {
            iArr[i3] = iArr[i3] - 1;
            i3++;
        }
        i3 = 0;
        while (i2 < iArr.length) {
            i3 += iArr[i2];
            i2++;
        }
        return i3;
    }

    public void func() {
        this.f2++;
    }

    public int testComplexIfInLoop(boolean z) {
        int i = 0;
        while (z && i < 10) {
            i++;
        }
        return i;
    }

    public int testComplexIfInLoop2(int i) {
        while (i > 5 && i < 10) {
            i++;
        }
        return i;
    }

    public int testComplexIfInLoop3(int i) {
        int i2 = i;
        while (i2 > 5 && i2 < i * 3 && i == 8) {
            i2++;
        }
        return i2;
    }

    public long testInline() {
        long nanoTime = System.nanoTime();
        f();
        return System.nanoTime() - nanoTime;
    }

    public boolean testInline2() {
        int i = this.f2;
        func();
        return i != this.f2;
    }

    public boolean testNestedLoops(List<String> list, List<String> list2) {
        for (String str : list) {
            for (String str2 : list2) {
                if (str.equals(str2)) {
                    if (str.length() == 5) {
                        list2.add(str);
                    } else {
                        list.remove(str2);
                    }
                }
            }
        }
        if (list2.size() > 0) {
            list.clear();
        }
        return list.size() == 0;
    }

    public boolean testNestedLoops2(List<String> list) {
        int i = 0;
        for (int i2 = 0; i2 < list.size(); i2++) {
            while (i < ((String) list.get(i2)).length()) {
                i++;
            }
        }
        return i > 10;
    }

    public String testReturnInLoop(List<String> list) {
        for (String str : list) {
            if (str != null) {
                return str;
            }
        }
        return "error";
    }

    public String testReturnInLoop2(List<String> list) {
        try {
            for (String str : list) {
                exc();
                if (str != null) {
                    return str;
                }
            }
        } catch (Exception e) {
            setEnabled(false);
        }
        return "error";
    }

    public boolean testRun() throws Exception {
        boolean z = false;
        setEnabled(false);
        testSwitchInLoop();
        AbstractTest.assertTrue(this.enabled);
        setEnabled(false);
        testIfInLoop();
        AbstractTest.assertTrue(this.enabled);
        AbstractTest.assertTrue(testNestedLoops(new ArrayList(Arrays.asList(new String[]{"a1", "a2"})), new ArrayList(Arrays.asList(new String[]{"a1", "b2"}))));
        List asList = Arrays.asList(new String[]{null, "a", "b"});
        AbstractTest.assertEquals((Object) testReturnInLoop(asList), (Object) "a");
        AbstractTest.assertEquals((Object) testReturnInLoop2(asList), (Object) "a");
        AbstractTest.assertEquals(testComplexIfInLoop(false), 0);
        AbstractTest.assertEquals(testComplexIfInLoop(true), 10);
        AbstractTest.assertEquals(testComplexIfInLoop2(2), 2);
        AbstractTest.assertEquals(testComplexIfInLoop2(6), 10);
        AbstractTest.assertEquals(testComplexIfInLoop3(2), 2);
        AbstractTest.assertEquals(testComplexIfInLoop3(6), 6);
        AbstractTest.assertEquals(testComplexIfInLoop3(8), 24);
        AbstractTest.assertEquals(testLoops(new int[]{1, 2, 3, 4, 5, 6}, 2), 19);
        if (testInline() > 20) {
            z = true;
        }
        AbstractTest.assertTrue(z);
        AbstractTest.assertTrue(testInline2());
        return true;
    }

    public void testSwitchInLoop() throws Exception {
        while (true) {
            switch (next()) {
                case 0:
                    setEnabled(false);
                    break;
                case 1:
                    setEnabled(true);
                    return;
                default:
                    break;
            }
        }
    }
}
