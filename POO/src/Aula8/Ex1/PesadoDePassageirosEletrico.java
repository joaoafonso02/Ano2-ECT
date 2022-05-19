package Aula8.Ex1;

public class PesadoDePassageirosEletrico extends PesadoDePassageiros implements VeiculoEletrico{
    private int autonomia_max, autonomia_rest;

    PesadoDePassageirosEletrico(String matricula, String marca, String modelo, int potencia, int numero_do_quadro, float peso, int numero_max_de_passageiros, int autonomia_max) {
        super(matricula, marca, modelo, potencia, numero_do_quadro, peso);
        this.setAutonomiaMax(autonomia_max);
        this.autonomia_rest = autonomia_max;
    }

    // get
    public int getAutonomiaMax() {return autonomia_max;}

    @Override
    public int autonomia() {return this.autonomia_rest;}

    //set
    public void setAutonomiaRestante(int autonomia_rest) {this.autonomia_rest = autonomia_rest;}

    public void setAutonomiaMax(int autonomia_max) {
        if (autonomia_max <= 0) throw new IllegalArgumentException("INVALID CAR AUTONOMY!");
        this.autonomia_max = autonomia_max;
    }

    @Override
    public void carregar(int percentagem) {
        if(percentagem < 0 || percentagem > 100) throw new IllegalArgumentException("MUST BE BETWEEN 0 & 100!");
        this.setAutonomiaRestante(autonomia_max * (percentagem/100));
    }

    @Override
    public void descarregar(int num) {
        if (autonomia_rest < 0) throw new IllegalArgumentException("INVALID CAR AUTONOMY!");
        this.setAutonomiaRestante(autonomia_rest - num);
    }
}
