package Aula6;

public class Pessoa {
    private String nome;
    private int cc;
    private Date dataNasc;

    public Pessoa(String nome, int cc, Date dataNasc) {
        assert nome != null && cc > 0: "Bad inputs";
        this.nome = nome;
        this.cc = cc;
        this.dataNasc = dataNasc;
    }

    public String getName() { return this.nome;}
    public int getCc() { return this.cc;}

    @Override
    public String toString() {
        return String.format("%s, CC: %d, Birth date: %s", this.nome, this.cc, this.dataNasc);
    }

}
