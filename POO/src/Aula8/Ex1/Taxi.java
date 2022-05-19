package Aula8.Ex1;

public class Taxi extends Automovel{
    private int license_number;

    Taxi(String matricula, String marca, String modelo, int potencia, int no_do_quadro, float capacidade_bagageira, int license_number) {
        super(matricula, marca, modelo, potencia, no_do_quadro);
        this.setLicenseNumber(license_number);
    }

    public int getLicenseNumber() {return license_number;}

    public void setLicenseNumber(int license_number){
        if(license_number <= 0) throw new IllegalArgumentException("INVALID LICENSE NUMBER!");
        this.license_number = license_number;
    }

    @Override
    public String toString() {
        return "Taxi [id = " + this.getId() + ", License Number = " + this.getLicenseNumber() + ", Car Registration = " + this.getMatricula() + ", Car Brand = " + this.getMarca() + ", Model = " + this.getModelo() + ", Car Power = " + this.getPotencia() + ", Board Number = " + this.getNoDoQuadro() + "]";
    }

    @Override
    public void trajeto(int quilometros) {
        // TODO Auto-generated method stub
        
    }
}
