package Aula7;

public class Circle extends Forma{
     
    private double raio;

    Circle(double raio, String cor) {
        this.setRaio(raio);
        this.setColor(cor);
    }

    public void setRaio(double raio) {
        this.raio = raio;
        this.getArea();
        this.getPerimetro();
    }

    public double getPerimetro() {
        return 2 * Math.PI * this.getRaio();
    }

    public double getArea() {
        return Math.PI * this.getRaio() * this.getRaio();
    }

    public double getRaio() {
        return this.raio;
    }

    public boolean isValidFig() {
        return this.getRaio() > 0;
    }

    public String toString() {
        return "Circle, radius:" + this.getRaio() + ", area:" + this.getArea() + ", perimeter" + this.getPerimetro() + ",cor:" + this.getColor();
    }
}