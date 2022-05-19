package Aula8.Ex1;

public class PesadoDePassageiros extends Pesado{
    private int numero_max_passageiros;

    PesadoDePassageiros(String matricula, String marca, String modelo, int potencia, int numero_do_quadro, float peso) {
        super(matricula, marca, modelo, potencia, numero_do_quadro, peso);
        this.setNumeroMaxPassageiros(numero_max_passageiros);
    }

    public int getNumeroMaxPassageiros() {return numero_max_passageiros;}


    public void setNumeroMaxPassageiros(int numero_max_passageiros) {
        if(numero_max_passageiros <= 0) throw new IllegalArgumentException("INVALID MAXIMUM NUMBER OF PASSENGERS!");
        this.numero_max_passageiros = numero_max_passageiros;
    }

    @Override
    public String toString() {
        return "Passenger heavy [id = " + this.getId() + ", Maximum number of passengers = " + getNumeroMaxPassageiros() + ", Car Registration = " + this.getMatricula() + ", Car Brand = " + this.getMarca() + ", Model = " + this.getModelo() + ", Car Power = " + this.getPotencia() + ", Board Number = " + this.getNoDoQuadro() + "]";
    }
}
