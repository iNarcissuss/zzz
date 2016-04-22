package jadx.samples;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TestGenerics extends AbstractTest {
    public static Box<Integer> integerBox = new Box();
    public Class<?>[] classes;
    OrderedPair<String, Box<Integer>> p = new OrderedPair("primes", new Box());
    Pair<String, Integer> p1 = new OrderedPair("8", Integer.valueOf(8));
    public List<String> strings;

    class A {
        A() {
        }
    }

    interface B {
    }

    public static class Box<T> {
        private T t;

        public T get() {
            return this.t;
        }

        public void set(T t) {
            this.t = t;
        }
    }

    interface C {
    }

    class D<T extends A & B & C> {
        D() {
        }
    }

    public interface MyComparable<T> {
        int compareTo(T t);
    }

    public static class GenericClass implements MyComparable<String> {
        public int compareTo(String str) {
            return 0;
        }
    }

    public class NaturalNumber<T extends Integer> {
        private final T n;

        public NaturalNumber(T t) {
            this.n = t;
        }

        public boolean isEven() {
            return this.n.intValue() % 2 == 0;
        }
    }

    public class Node<T extends Comparable<T>> {
        private final T data;
        private final Node<T> next;

        public Node(T t, Node<T> node) {
            this.data = t;
            this.next = node;
        }

        public T getData() {
            return this.data;
        }
    }

    public interface Pair<K, LongGenericType> {
        K getKey();

        LongGenericType getValue();
    }

    public static class OrderedPair<K, V> implements Pair<K, V> {
        private final K key;
        private final V value;

        public OrderedPair(K k, V v) {
            this.key = k;
            this.value = v;
        }

        public K getKey() {
            return this.key;
        }

        public V getValue() {
            return this.value;
        }
    }

    private class TestConstructor implements Enumeration<String> {
        private final TestGenerics a;

        TestConstructor(TestGenerics testGenerics) {
            this.a = testGenerics;
        }

        public boolean hasMoreElements() {
            return false;
        }

        public String nextElement() {
            return null;
        }
    }

    public static class Util {
        public static <K, V> boolean compare(Pair<K, V> pair, Pair<K, V> pair2) {
            return pair.getKey().equals(pair2.getKey()) && pair.getValue().equals(pair2.getValue());
        }
    }

    public static void addNumbers(List<? super Integer> list) {
        for (int i = 1; i <= 10; i++) {
            list.add(Integer.valueOf(i));
        }
    }

    public static <T extends Comparable<T>> int countGreaterThan(T[] tArr, T t) {
        int i = 0;
        for (Comparable compareTo : tArr) {
            if (compareTo.compareTo(t) > 0) {
                i++;
            }
        }
        return i;
    }

    public static void main(String[] strArr) throws Exception {
        new TestGenerics().testRun();
    }

    public static void printList(List<?> list) {
        for (Object obj : list) {
            System.out.print(obj + " ");
        }
        System.out.println();
    }

    public static void process(List<? extends A> list) {
    }

    private List<String> test1(Map<String, String> map) {
        List<String> arrayList = new ArrayList();
        arrayList.add((String) map.get("key"));
        return arrayList;
    }

    public static boolean use() {
        return Util.compare(new OrderedPair(Integer.valueOf(1), "str1"), new OrderedPair(Integer.valueOf(2), "str2"));
    }

    public void test2(Map<String, String> map, List<Object> list) {
        list.add((String) map.get("key"));
    }

    public void test3(List<Object> list, int i, float[] fArr, String[] strArr, String[][][] strArr2) {
    }

    public boolean testRun() throws Exception {
        AbstractTest.assertTrue(test1(new HashMap()) != null);
        return true;
    }

    public Enumeration<String> testThis() {
        return new TestConstructor(this);
    }
}
