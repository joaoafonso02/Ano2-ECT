package something;
import java.util.LinkedList;
import java.util.List;

public class Gastronomia extends Atividade {
  private List<Restaurante> lista;

  public Gastronomia(int n, String nome) {
    super(n, nome);
    this.lista = new LinkedList<>();
  }

  public Gastronomia(int n, String nome, List<Restaurante> lista) {
    super(n, nome);
    this.lista = lista;
  }

  public void add(Restaurante restaurante) {
    lista.add(restaurante);
  }

  public String getNome() {return nome;}

  public List<Restaurante> getLista() {return lista;}

  public int totalRestaurantes() {return this.lista.size();}

  @Override
  public List<String> locais() {
    List<String> newList = new LinkedList<>();
    for( Restaurante res : this.lista) {
      newList.add(res.getNome());
    }
    return newList;
  }
}
