import java.util.*;

public class AgenciaTuristica {
	private String nome;
	private String endereco;
	private Set<Atividade> atividades = new HashSet<>();

	public AgenciaTuristica(String nome, String endereco) {
		this.nome = nome;
		this.endereco = endereco;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public Set<Atividade> atividades() {
		return atividades;
	}

	public void setAtividades(Set<Atividade> atividades) {
		this.atividades = atividades;
	}

	public void add(Atividade atividade) {
		this.atividades.add(atividade);
	}

	public int totalItems() {
		int i = 0;

		for (Atividade atividade : atividades) {
			i += atividade.locais().size();
		}

		return i;
	}

	public String[] getAllItems() {
		List<String> items = new ArrayList<>();

		for (Atividade atividade : atividades) {
			items.addAll(atividade.locais());
		}

		return items.toArray(new String[items.size()]);
	}

	@Override
	public String toString() {
		return "Agencia Turistica " + nome + "\nAtividades: " + atividades;
	}

}
