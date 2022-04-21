package Aula6;

public class Aluno extends Pessoa{
    private static int it = 100;
    private int nMec;
    private Date inscDate;

    public Aluno(String nome, int cc, Date dataNasc) {
        super(nome, cc, dataNasc);
        this.nMec = it++;
        this.inscDate = new Date(1, 1, 1); // ?????????
    }

    public Aluno(String nome, int cc, Date dataNasc, Date inscDate) {
        super(nome, cc, dataNasc);
        this.nMec = it++;
        this.inscDate = inscDate;
    }

    public int getNMec() { return this.nMec; }

    @Override
    public String toString() {
        return String.format("%s; nMec: %d; Enrollment Date : %s", super.toString(), this.nMec, this.inscDate);
    }
}
