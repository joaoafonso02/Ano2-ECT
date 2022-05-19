package Aula8.Ex1;

public class PesadoDeMercadorias extends Pesado{
    public float carga_max;

    public PesadoDeMercadorias(String matricula, String marca, String modelo, int potencia, int numero_do_quadro, float peso, float carga_max) { 
        super( matricula, marca, modelo, potencia, numero_do_quadro, carga_max);
        this.setCargaMax(carga_max);
    }

    public float getCargaMax() {return carga_max;}

    public void setCargaMax(float carga_max ) {
        if(carga_max <= 0) throw new IllegalArgumentException("INVALID MAXIMUM WEIGHT!");
        this.carga_max = carga_max;
    }

    @Override
    public String toString() {
        return "Heavy Goods [id = " + this.getId() + ", Maximum Weight = " + this.getCargaMax() + ", Car Registration = " + this.getMatricula() + ", Car Brand = " + this.getMarca() + ", Model = " + this.getModelo() + ", Car Power = " + this.getPotencia() + ", Board Number = " + this.getNoDoQuadro() + "]";
    } 


    @Override
    public void trajeto(int quilometros) {
        // TODO Auto-generated method stub
        
    }
    
}
