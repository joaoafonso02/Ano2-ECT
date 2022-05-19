package Aula8.Ex1;

public class VeiculoLigeiro extends Automovel{
    private float capacidade_bagageira;

    public VeiculoLigeiro(String matricula, String marca, String modelo, int potencia, int no_do_quadro, float capacidade_bagageira) {
        super(matricula, marca, modelo, potencia, no_do_quadro);
        this.setCapacidadeBagageira(capacidade_bagageira);
    }

    // Get Capacidade Bagageira
    public float getCapacidadeBagageira() {return capacidade_bagageira;}

    // Set Capacidade Bagageira
    public void setCapacidadeBagageira(float capacidade_bagageira ) {
        if (capacidade_bagageira <= 0) throw new IllegalArgumentException("INVALID LUGGAGE CAPACITY!");
        this.capacidade_bagageira = capacidade_bagageira;
    }

    @Override
    public String toString() {
        return "light car [id = " + this.getId() + ", Luggage Capacity = " + this.getCapacidadeBagageira() + ", Car Registration = " + this.getMatricula() + ", Car Brand = " + this.getMarca() + ", Model = " + this.getModelo() + ", Car Power = " + this.getPotencia() + ", Board Number = " + this.getNoDoQuadro() + "]";
    }

    @Override
    public void trajeto(int quilometros) {
        // TODO Auto-generated method stub
        
    }
}
