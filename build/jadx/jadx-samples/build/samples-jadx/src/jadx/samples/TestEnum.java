package jadx.samples;

import java.util.ArrayList;
import java.util.EnumSet;
import java.util.List;
import java.util.Set;

public class TestEnum extends AbstractTest {
    public static final String DOG = "DOG";
    private static int three = 3;

    public enum Animal {
        CAT,
        DOG
    }

    public enum Direction {
        NORTH,
        SOUTH,
        EAST,
        WEST
    }

    public interface IOps {
        double apply(double d, double d2);
    }

    public enum DoubleOperations implements IOps {
        TIMES("*") {
            public double apply(double d, double d2) {
                return d * d2;
            }
        },
        DIVIDE("/") {
            public double apply(double d, double d2) {
                return d / d2;
            }
        };
        
        private final String op;

        private DoubleOperations(String str) {
            this.op = str;
        }

        public String getOp() {
            return this.op;
        }
    }

    public enum EmptyEnum {
        ;

        public static String getOp() {
            return "op";
        }
    }

    public enum Numbers {
        ONE(1),
        TWO(2),
        THREE(TestEnum.three),
        FOUR(TestEnum.three + 1);
        
        private final int num;

        private Numbers(int i) {
            this.num = i;
        }

        public int getNum() {
            return this.num;
        }
    }

    public enum Operation {
        PLUS {
            int apply(int i, int i2) {
                return i + i2;
            }
        },
        MINUS {
            int apply(int i, int i2) {
                return i - i2;
            }
        };

        abstract int apply(int i, int i2);
    }

    public enum Singleton {
        INSTANCE;

        public String test(String str) {
            return str.concat("test");
        }
    }

    public enum Types {
        INT,
        FLOAT,
        LONG,
        DOUBLE,
        OBJECT,
        ARRAY;
        
        private static Set<Types> primitives;
        public static List<Types> references;

        static {
            primitives = EnumSet.of(INT, FLOAT, LONG, DOUBLE);
            references = new ArrayList();
            references.add(OBJECT);
            references.add(ARRAY);
        }

        public static Set<Types> getPrimitives() {
            return primitives;
        }
    }

    public static void main(String[] strArr) throws Exception {
        new TestEnum().testRun();
    }

    public String testEnumSwitch(Direction direction) {
        switch (direction) {
            case NORTH:
                return "N";
            case SOUTH:
                return "S";
            default:
                return "<>";
        }
    }

    public boolean testRun() throws Exception {
        boolean z = false;
        Direction direction = Direction.EAST;
        AbstractTest.assertTrue(direction.toString().equals("EAST"));
        AbstractTest.assertTrue(direction.ordinal() == 2);
        AbstractTest.assertTrue(Numbers.THREE.getNum() == 3);
        AbstractTest.assertTrue(Operation.PLUS.apply(2, 2) == 4);
        AbstractTest.assertTrue(DoubleOperations.TIMES.apply(1.0d, 1.0d) == 1.0d);
        AbstractTest.assertTrue(Types.getPrimitives().contains(Types.INT));
        AbstractTest.assertTrue(Types.references.size() == 2);
        if (EmptyEnum.values().length == 0) {
            z = true;
        }
        AbstractTest.assertTrue(z);
        AbstractTest.assertTrue(EmptyEnum.getOp().equals("op"));
        AbstractTest.assertTrue(Singleton.INSTANCE.test("a").equals("atest"));
        return true;
    }
}
