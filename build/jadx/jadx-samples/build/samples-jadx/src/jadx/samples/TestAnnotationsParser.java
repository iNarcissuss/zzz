package jadx.samples;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

public class TestAnnotationsParser extends AbstractTest {

    @Target({ElementType.TYPE})
    @Retention(RetentionPolicy.RUNTIME)
    public @interface A {
        float f();

        int i();
    }

    @A(f = 3.14f, i = -1)
    public static class C1 {
        public static final float FLOAT_CONST = 3.14f;
    }

    @A(f = 1.671168E7f, i = -1025)
    public static class C2 {
        public static final float FLOAT_CONST = 1.671168E7f;
    }

    public static void main(String[] strArr) throws Exception {
        new TestAnnotationsParser().testRun();
    }

    public boolean testRun() {
        A a = (A) C1.class.getAnnotation(A.class);
        AbstractTest.assertEquals(a.i(), -1);
        AbstractTest.assertEquals(a.f(), (float) C1.FLOAT_CONST);
        a = (A) C2.class.getAnnotation(A.class);
        AbstractTest.assertEquals(a.i(), -1025);
        AbstractTest.assertEquals(a.f(), (float) C2.FLOAT_CONST);
        return true;
    }
}
