package jadx.samples;

import java.lang.Thread.State;
import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.lang.reflect.Method;
import java.util.Arrays;

public class TestAnnotations extends AbstractTest {
    @Deprecated
    public int a;

    public @interface ClassesAnnotation {
        Class<?>[] value();
    }

    @Target({ElementType.METHOD})
    @Retention(RetentionPolicy.RUNTIME)
    @Documented
    public @interface MyAnnotation {
        Class<?> cls();

        double[] doubles();

        String name() default "a";

        int num();

        SimpleAnnotation simple();

        State state() default State.TERMINATED;

        String str() default "str";

        float value();
    }

    public @interface SimpleAnnotation {
        boolean value();
    }

    @Deprecated
    public static Object depr(String[] strArr) {
        return Arrays.asList(strArr);
    }

    public static void main(String[] strArr) throws Exception {
        new TestAnnotations().testRun();
    }

    @MyAnnotation(cls = Exception.class, doubles = {0.0d, 1.1d}, name = "b", num = 7, simple = @SimpleAnnotation(false), value = 9.87f)
    public static Object test(String[] strArr) {
        return Arrays.asList(strArr);
    }

    public static Object test2(@Deprecated String str, @SimpleAnnotation(false) Object obj) {
        return str;
    }

    @ClassesAnnotation({int.class, int[].class, int[][][].class, String.class, String[].class, String[][].class})
    public static Object test3(Object obj) {
        return obj.toString();
    }

    public void error() throws Exception {
        throw new Exception("error");
    }

    public boolean testRun() throws Exception {
        boolean z = false;
        Class cls = TestAnnotations.class;
        Thread thread = new Thread();
        Method method = cls.getMethod("error", new Class[0]);
        AbstractTest.assertTrue(method.getExceptionTypes().length > 0);
        AbstractTest.assertTrue(method.getExceptionTypes()[0] == Exception.class);
        method = cls.getMethod("depr", new Class[]{String[].class});
        AbstractTest.assertTrue(method.getAnnotations().length > 0);
        AbstractTest.assertTrue(method.getAnnotations()[0].annotationType() == Deprecated.class);
        Method method2 = cls.getMethod("test", new Class[]{String[].class});
        AbstractTest.assertTrue(method2.getAnnotations().length > 0);
        MyAnnotation myAnnotation = (MyAnnotation) method2.getAnnotations()[0];
        AbstractTest.assertTrue(myAnnotation.num() == 7);
        if (myAnnotation.state() == State.TERMINATED) {
            z = true;
        }
        AbstractTest.assertTrue(z);
        return true;
    }
}
