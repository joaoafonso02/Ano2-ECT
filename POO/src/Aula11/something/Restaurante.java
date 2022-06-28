package Aula11.something;

public class Restaurante {
  private String nome;
  private TipoComida tipo;

  public Restaurante(String nome, TipoComida tipo) {
    this.nome = nome;
    this.tipo = tipo;
  }

  public TipoComida getTipo() {return this.tipo;}
  public String getNome() {return this.nome;}

  @Override
  public String toString() {
    return String.format("Restaurante [nome=%s, tipo=%s]", this.nome, this.tipo.toString());
  }
}
