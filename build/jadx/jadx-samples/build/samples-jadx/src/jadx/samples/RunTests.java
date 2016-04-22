package jadx.samples;

import java.io.File;
import java.io.FilenameFilter;
import java.lang.reflect.InvocationTargetException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

public class RunTests {

    private static class TerminateTask extends TimerTask {
        private TerminateTask() {
        }

        public void run() {
            System.err.println("Test timed out");
            System.exit(1);
        }
    }

    private static class TestFilter implements FilenameFilter {
        private TestFilter() {
        }

        public boolean accept(File file, String str) {
            return str.startsWith("Test") && str.endsWith(".class") && !str.contains("$");
        }
    }

    private static List<String> getClasses(ClassLoader classLoader, String str) {
        List<String> arrayList = new ArrayList();
        URL resource = classLoader.getResource(str.replace('.', '/'));
        if (resource != null) {
            File file = new File(resource.getFile());
            if (file.exists() && file.isDirectory()) {
                System.out.println("Test classes path: " + file.getAbsolutePath());
                for (String replace : file.list(new TestFilter())) {
                    arrayList.add(str + '.' + replace.replace(".class", ""));
                }
            }
        }
        return arrayList;
    }

    public static void main(String[] strArr) {
        List<String> classes = getClasses(ClassLoader.getSystemClassLoader(), "jadx.samples");
        if (classes.isEmpty()) {
            System.err.println("No tests found");
            System.exit(1);
        }
        int size = classes.size() * 2;
        System.err.println("Set timeout to " + size + " seconds");
        new Timer().schedule(new TerminateTask(), (long) (size * 1000));
        Collections.sort(classes);
        int i = 0;
        for (String runTest : classes) {
            i = runTest(runTest) ? i + 1 : i;
        }
        size = classes.size() - i;
        System.err.println("---");
        System.err.println("Total " + classes.size() + ", Passed: " + i + ", Failed: " + size);
        System.exit(size);
    }

    private static boolean runTest(String str) {
        try {
            String str2;
            boolean z;
            Throwable th;
            Class cls = Class.forName(str);
            if (cls.getSuperclass() == AbstractTest.class) {
                boolean booleanValue;
                Throwable th2;
                try {
                    booleanValue = ((Boolean) cls.getMethod("testRun", new Class[0]).invoke((AbstractTest) cls.getConstructor(new Class[0]).newInstance(new Object[0]), new Object[0])).booleanValue();
                    th2 = null;
                } catch (InvocationTargetException e) {
                    th2 = e.getCause();
                    booleanValue = false;
                } catch (Throwable th3) {
                    th2 = th3;
                    booleanValue = false;
                }
                str2 = null;
                Throwable th4 = th2;
                z = booleanValue;
                th = th4;
            } else {
                th = null;
                str2 = "not extends AbstractTest";
                z = false;
            }
            System.err.println(">> " + (z ? "PASS" : "FAIL") + "\t" + str + (str2 == null ? "" : "\t - " + str2));
            if (th != null) {
                th.printStackTrace();
            }
            return z;
        } catch (ClassNotFoundException e2) {
            System.err.println("Class '" + str + "' not found");
            return false;
        } catch (Exception e3) {
            e3.printStackTrace();
            return false;
        }
    }
}
