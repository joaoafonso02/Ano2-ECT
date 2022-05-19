package Aula8.Ex1;

public class Motociclo extends Veiculo{
    private String tipo;

    public Motociclo(String matricula, String marca, String modelo, int potencia, String tipo) {
        super(matricula, marca, modelo, potencia);
        this.setTipo(tipo);
    }

    // Get type
    public String getTipo() {return tipo;}

    // Set type
    public void setTipo(String tipo) {
        if ((tipo == null || tipo.equals(""))||(!tipo.equals("Sporty") && !tipo.equals("off-road"))) throw new IllegalArgumentException("INVALID TYPE!");
        this.tipo = tipo;
    }

    @Override
    public String toString() {
        return "Motocycle [id = " + this.getId() + ", type = " + this.getTipo() + ", Car Registration = " + this.getMatricula() + ", Car Brand = " + this.getMarca() + ", Model = " + this.getModelo() + ", Car Power = " + this.getPotencia() + "]";
    }

    @Override
    public void trajeto(int quilometros) {
        // DUVIDAAAAAAAAAAA
        
    }
}
