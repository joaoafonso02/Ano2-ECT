package something;

public abstract class Atividade implements PontosDeInteresse{
  protected int n = 0;
  protected String nome = "";

  Atividade(int n, String nome) {
    this.n = n;
    this.nome = nome;
  }

  public int getNumero() {return this.n;}
  public String getNome() {return this.nome;}

  @Override
  public String toString() {
    return String.format("Atividade [num=%d, nome=%s]", this.n, this.nome);
  }
}
