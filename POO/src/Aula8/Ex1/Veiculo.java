package Aula8.Ex1;

public abstract class Veiculo implements KmPercorridosInterface {
    private String matricula, modelo, marca;
    private int potencia, km_percorridos, ultimo_trajeto, id;
    private static int id_counter = 1;

    public Veiculo(String matricula, String marca, String modelo, int potencia) {
        this.setMatricula(matricula);
        this.setMarca(marca);
        this.setModelo(modelo);
        this.setPotencia(potencia);
        this.setId();
    }

    // get args 
    public int distanciaTotal() { return this.km_percorridos;}

    public int ultimoTrajeto() {return ultimo_trajeto;}

    protected void setId() {this.id = id_counter++;}

    public int getId() {return this.id;}

    public String getMatricula() {return matricula;}

    public String getMarca() {return marca;}
    
    public String getModelo() {return modelo;}

    public int getPotencia() {return potencia;}

    // confirm args
    public void setMatricula(String matricula) {
        if(matricula.isEmpty()|| matricula.length()!=8 || matricula.charAt(2)!='-' || matricula.charAt(5)!='-') throw new IllegalArgumentException("INVALID CAR REGISTRATION!");
        this.matricula = matricula;
    }

    public void setMarca(String marca) {
        if (marca == null || marca.equals("")) throw new IllegalArgumentException("INVALID CAR BRAND!");
        this.marca = marca;
    }
    
    public void setModelo(String modelo) {
        if (modelo == null || modelo.equals("")) throw new IllegalArgumentException("INVALID CAR MODEL!");
        this.modelo = modelo;
    }

    public void setPotencia(int potencia) {
        if (potencia <= 0) throw new IllegalArgumentException("INVALID CAR POWER! ( > 0 )");
        this.potencia = potencia;
    }
}
