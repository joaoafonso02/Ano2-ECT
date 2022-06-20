package Aula6;

public class Bolseiro extends Aluno{
    private int montlhyAmount;

    public Bolseiro(String nome, int cc, Date dataNasc, int montlhyAmount) {
        super(nome, cc, dataNasc);
        this.montlhyAmount = montlhyAmount;
    }

    public void setBolsa (int montlhyAmount) {
        this.montlhyAmount = montlhyAmount;
    }

    public int getmonthlyAmount() {return this.montlhyAmount;}

    @Override
    public String toString() {
        return String.format("%s; Monthly Amount: %d", super.toString(), this.montlhyAmount);
    }
}