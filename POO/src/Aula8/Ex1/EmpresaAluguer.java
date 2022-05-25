package Aula8.Ex1;
import java.util.*;

public class EmpresaAluguer {
    private String nome, codigo_postal, email;
    private List<Veiculo> veiculos = new ArrayList<Veiculo>();

    EmpresaAluguer(String nome, String codigo_postal, String email) {
        this.setNome(nome);
        this.setCodigoPostal(codigo_postal);
        this.setEmail(email);
    }

    // get
    public String getNome() {return nome;}
    public String getCodigoPostal() {return codigo_postal;}
    public String getEmail() {return email;}
    public List<Veiculo> getVeiculos() {return veiculos;}

    // set
    public void setNome(String nome) {
        if(nome.isEmpty()) throw new IllegalArgumentException("INVALID NAME!");
        this.nome = nome;
    }

    public void setCodigoPostal(String codigo_postal) {
        if(codigo_postal.isEmpty()) throw new IllegalArgumentException("INVALID NAME!");
        this.codigo_postal = codigo_postal;
    }

    public void setEmail(String email) {
        if(email.isEmpty() || !email.contains("@")) throw new IllegalArgumentException("INVALID NAME!");
        this.email = email;
    }

    public void addVeiculo(VeiculoLigeiroEletrico eletrico1) {
        veiculos.addAll((Collection<? extends Veiculo>) eletrico1);
    }

    public void removeVeiculo(Veiculo veiculo) {
        veiculos.remove(veiculo);
    }

}
