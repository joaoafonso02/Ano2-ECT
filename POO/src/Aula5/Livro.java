package Aula5;

public class Livro {
    private int id;
    private String titulo;
    private String tipoEmprestimo;
    private boolean disponivel;
    private static int nextID = 100; 

    Livro(String titulo) {
        this(titulo, "NORMAL");
        this.id = nextID++;
    }

    Livro(String titulo, String tipoEmprestimo) {
        this.id = nextID++;
        setTitulo(titulo);
        setTipoEmprestimo(tipoEmprestimo);
        setDisponivel(true);
    }
    public void setTitulo(String titulo) {
        assert titulo.length() > 0 : "NULL TITLE";
        this.titulo = titulo;
    }

    public void setTipoEmprestimo(String tipoEmprestimo) {
        assert tipoEmprestimo.equals("NORMAL") || tipoEmprestimo.equals("CONDICIONAL");
        this.tipoEmprestimo = tipoEmprestimo;
    }
    public void setDisponivel(boolean disponivel) {
        this.disponivel = disponivel;
    }

    public String toString() {
        return String.format("Livro %d; %s; %s", this.id, this.titulo, this.tipoEmprestimo);
    }

    public int getId() {return this.id;}
    public String getTitulo() {return this.titulo;}
    public String getTipoEmprestimo() {return this.tipoEmprestimo;}
    public boolean getDisponivel() {return this.disponivel;}
}
