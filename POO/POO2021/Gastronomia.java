import java.util.*;

public class Gastronomia extends Atividade {
	private List<Restaurante> lista = new ArrayList<>();

	public Gastronomia(int id, String nome) {
		super(id, nome);
	}

	public Gastronomia(int id, String nome, List<Restaurante> list) {
		this(id, nome);
		this.lista = list;
	}

	public List<Restaurante> getLista() {
		return lista;
	}

	public void setLista(List<Restaurante> lista) {
		this.lista = lista;
	}

	public void add(Restaurante restaurante) {
		this.lista.add(restaurante);
	}

	public int totalRestaurantes() {
		return lista.size();
	}

	public Collection<String> locais() {
		Collection<String> locais = new ArrayList<>();
		for (Restaurante restaurante : lista) {
			locais.add(restaurante.toString());
		}
		return locais;
	}

}
