package Aula7;

public class Triangle extends Forma{
    private double lado1, lado2, lado3;

    Triangle(double lado1, double lado2, double lado3, String cor) {
        this.setLados(lado1, lado2, lado3);
        this.setColor(cor);
    }

    public void setLados(double lado1, double lado2, double lado3) {
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
        this.getArea();
        this.getPerimetro();
    }

    public double getPerimetro() {
        return this.lado1 + this.lado2 + this.lado3;
    }

    public double getArea() {
        double p = (this.lado1 + this.lado2 + this.lado3) / 2;
        return (double) Math.sqrt(p * (p - this.lado1) * (p - this.lado2) * (p - this.lado3));
    }

    public boolean isValidFig() {
        if (this.lado1 <= 0 || this.lado2 <= 0 || this.lado3 <= 0)
            return false;
        if (this.lado1 + this.lado2 <= this.lado3 || this.lado1 + this.lado3 <= this.lado2 || this.lado2 + this.lado3 <= this.lado1)
            return false;
        return true;
    }

    public String toString() {
        return "tipo:triangulo,lado1:" + this.lado1 + ",lado2:" + this.lado2 + ",lado3:" + this.lado3 + ",area:" + this.getArea() + ",perimetro" + this.getPerimetro() + ",cor:" + this.getColor();
    }
}
