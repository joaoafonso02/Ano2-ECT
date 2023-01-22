import java.util.*;

public class PasseioBicicleta extends Atividade {
	private Set<String> locais = new TreeSet<>();

	public PasseioBicicleta(int id, String nome) {
		super(id, nome);
	}

	public PasseioBicicleta(int id, String nome, String[] locais) {
		this(id, nome);

		for (String local : locais) {
			this.locais.add(local);
		}
	}

	public Set<String> getLocais() {
		return locais;
	}

	public void setLocais(Set<String> locais) {
		this.locais = locais;
	}

	public void addLocal(String local) {
		this.locais.add(local);
	}

	public Collection<String> locais() {
		return locais;
	}

}
