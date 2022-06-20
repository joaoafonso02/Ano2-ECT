package something;

import java.util.Collection;
import java.util.LinkedList;
import java.util.List;
import java.util.TreeSet;

public class AgenciaTuristica {
  private String nome = "";
  private String endereco = "";
  private LinkedList<Atividade> atividades;

  public AgenciaTuristica(String nome, String endereco){
    this.nome = nome;
    this.endereco = endereco;
    this.atividades = new LinkedList<>();
  }

  public LinkedList<Atividade> atividades() { return this.atividades; }

  public TreeSet<String> getAllItems() {
    TreeSet<String> newSet = new TreeSet<>();
    for(Atividade at : atividades) {
      Collection<String> locais = at.locais();
      System.out.println(locais);
      for(String local : locais) {
        newSet.add(local);
        System.out.println(local);
      }
    }
    return newSet;
  }

  public void add(Atividade exp1) {
    atividades.add(exp1);
  }

  public int totalItems() {
    int total = 0;
    for(Atividade a : atividades) {
      total += a.locais().size();
    }
    return total; 
  }

  @Override
  public String toString() {
    return String.format("Agencia Turistica %s\n\tAtividades: %s", this.nome, atividades.toString());
  }
}
