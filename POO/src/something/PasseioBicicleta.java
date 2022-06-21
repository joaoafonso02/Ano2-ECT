package something;

import java.util.LinkedHashSet;
import java.util.Set;

public class PasseioBicicleta extends Atividade {
    private Set<String> locais;

    public PasseioBicicleta(int numero, String nome) {
        super(numero, nome);
        this.locais = new LinkedHashSet<>();
    }

    public PasseioBicicleta(int numero, String nome, String[] locais) {
        super(numero, nome);
        this.locais = new LinkedHashSet<>();
        for (String local : locais) {
            this.locais.add(local);
        }
    }

    public void addLocal(String local) {
        this.locais.add(local);
    }

    public Set<String> locais() {
        Set<String> returnList = new LinkedHashSet<>();
        for (String local : locais) {
            returnList.add(local);
        }
        return returnList;
    }

    @Override
    public String toString() {
        return super.toString();
    }
}
