package Aula8.Ex1;


public abstract class Automovel extends Veiculo {
    private int no_do_quadro;

    public Automovel(String matricula, String marca, String modelo, int potencia, int numero_do_quadro) {
        super(matricula, marca, modelo, potencia);
        this.setNoDoQuadro(numero_do_quadro);
    }

    public int getNoDoQuadro() {return no_do_quadro;}

    public void setNoDoQuadro(int no_do_quadro) {
        if (no_do_quadro <= 0) throw new IllegalArgumentException("INVALID BOARD NUMBER!");
        this.no_do_quadro = no_do_quadro;
    }
}

