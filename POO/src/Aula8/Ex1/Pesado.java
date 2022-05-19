package Aula8.Ex1;

public abstract class Pesado extends Automovel{
    private float peso;

    Pesado (String matricula, String marca, String modelo, int potencia, int numero_do_quadro, float peso) { 
        super(matricula, marca, modelo, potencia, numero_do_quadro);
        this.setPeso(peso);
    }

    // get weight
    public float getPeso() {return peso;}

    public void setPeso(float peso) {
        if(peso <= 0) throw new IllegalArgumentException("INVALID WEIGHT!");
        this.peso = peso;
    }
}
