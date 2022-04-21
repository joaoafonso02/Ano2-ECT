package Aula5;

public class Utilizador {
    private String nome;
    private int nMec;
    private String curso;
 
    Utilizador(String nome, int nMec, String curso) {
        setUtilizador(nome, nMec, curso);
    }

    public void setUtilizador(String nome, int nMec, String curso) {
        assert nome != null && nMec >= 0 && curso != null : "THERE'S SOMETHING WRONG";
        this.nome = nome;
        this.nMec = nMec;
        this.curso = curso;
    }   

	public Boolean addToLivrosRequesitados(int id) {
		return false;
	}

	public Boolean removeFromLivrosRequesitados(int id) {
		return false;
	}



    public String getNome() {return nome;}
    public int getnMec() { return nMec;}
    public String getCurso() {return curso;}

    public void setNome(String nome) {this.nome = nome;}
	public void setnMec(int nMec) {this.nMec = nMec;}
	public void setCurso(String curso) {this.curso = curso;}
    
    public String toString() {
		return String.format("Aluno: %d; %s; %s", this.nMec, this.nome, this.curso);
	}
}