package Aula6;

public class Conjunto {
    private int[] arr;
    private int size;

    public Conjunto() {
        this.size = 0;
        this.arr = new int[1];
    }

    public void insert(int n) {
        if(!contains(n)) {
            this.arr[this.size++] = n;
        }
    }

    public boolean contains(int n) {
        int i = 0;
        for (i = 0; i < this.size; i++) {
            if(this.arr[i] == n) return true;
        }
        return false;
    }

    public void remove(int n) {
        int i = 0;
        for (i = 0; i < this.size; i++) {
            if(this.arr[i] == n) {
                this.size--;
            }
        }
    }

    public void empty() {
        for (int i = 0; i < this.size; i++) {
            this.arr[i] = 0;
        }
    }

    public int elementAt(int i) {
        assert this.size > i;
        return this.arr[i];
    }

    public Conjunto join(Conjunto add) {
        Conjunto c = new Conjunto();
        for (int i = 0; i < this.size; i++) {
            c.insert(this.arr[i]);
        }
        for (int i = 0; i < add.size(); i++) {
            c.insert(add.elementAt(i));
        }
        return c;
    }

    public Conjunto subtract(Conjunto dif) {
        Conjunto c = new Conjunto();
        for (int i = 0; i < this.size; i++) {
            c.insert(this.arr[i]);
        }
        for (int i = 0; i < dif.size(); i++) {
            c.remove(dif.elementAt(i));
        }
        return c;
    }

    public Conjunto intersect(Conjunto inter) {
        Conjunto c = new Conjunto();
        return c;
    }

    public int size() {return this.size;}

}
