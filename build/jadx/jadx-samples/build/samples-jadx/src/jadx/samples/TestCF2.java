package jadx.samples;

public class TestCF2 extends AbstractTest {
    private boolean ready = false;
    private final Object ready_mutex = new Object();

    private void func() {
        this.ready = true;
    }

    public static void main(String[] strArr) throws Exception {
        System.out.println("TestCF2: " + new TestCF2().testRun());
    }

    public void do_while() throws InterruptedException {
        int i = 3;
        do {
            func();
            i++;
        } while (i < 5);
    }

    public void do_while_2(long j) throws InterruptedException {
        if (j > 5) {
            long j2 = 3;
            do {
                func();
                j2++;
            } while (j2 < 5);
        }
    }

    public void do_while_3(int i) throws InterruptedException {
        int i2 = 3;
        do {
            if (i > 9) {
                func();
            }
            i2++;
        } while (i2 < 5);
    }

    public int do_while_break(int i) throws InterruptedException {
        int i2 = 3;
        while (i <= 9) {
            i2++;
            if (i2 >= 5) {
                return i2;
            }
        }
        return 0;
    }

    public int do_while_continue(int i) throws InterruptedException {
        int i2 = 0;
        do {
            if (i > 9) {
                i2 = i + 1;
                continue;
            } else {
                i2++;
                continue;
            }
        } while (i2 < i);
        return i2;
    }

    public void do_while_return2(boolean z) throws InterruptedException {
        int i = 3;
        while (!z) {
            i++;
            if (i >= 5) {
                return;
            }
        }
    }

    public void run() throws InterruptedException {
        while (true) {
            if (!this.ready) {
                this.ready_mutex.wait();
            }
            this.ready = false;
            func();
        }
    }

    public int simple_loops() throws InterruptedException {
        int i = 0;
        int[] iArr = new int[]{1, 2, 4, 6, 8};
        int i2 = 0;
        while (i < iArr.length) {
            i2 += iArr[i];
            i++;
        }
        int i3 = i2;
        for (long j = (long) i2; j > 0; j--) {
            i3 = (int) (((long) i3) + j);
        }
        return i3;
    }

    public boolean testRun() throws Exception {
        AbstractTest.assertEquals(simple_loops(), 252);
        return true;
    }

    public void while_iterator(String[] strArr, int i) throws InterruptedException {
        for (String length : strArr) {
            if (length.length() > 9) {
                func();
            }
        }
    }
}
