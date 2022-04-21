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

    public int size() {return this.size;}

}
