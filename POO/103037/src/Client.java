
public class Client {
    private String nome;
    private String localidade;

    public Client(String clientName, String clientLocal) {
    }
    public String getNome() {
        return nome;
    }
    public void set(String nome, String localidade) {
        this.nome = nome;
        this.localidade = localidade;
    }
    public String getLocalidade() {
        return localidade;
    }
    public void setLocalidade(String localidade) {
        this.localidade = localidade;
    }
    @Override
    public String toString() {
        return getNome() + "[" + getLocalidade() + "]";
    }
}


