package Aula7;

public class Rectangle extends Forma{
    private double length, height;

    Rectangle(double length, double height, String cor) {
        this.setComprimento(length);
        this.setHeight(height);
        this.setColor(cor);
    }

    public double getArea() {
        return this.length * this.height;
    }

    public double getPerimetro() {
        return 2 * (this.length + this.height);
    }

    public void setComprimento(double length) {
        this.length = length;
        this.getArea();
        this.getPerimetro();
    }

    public double getLength() {
        return this.length;
    }

    public void setHeight(double altura) {
        this.height = altura;
        this.getArea();
        this.getPerimetro();
    }

    public double getHeight() {
        return this.height;
    }

    public boolean isValidFig() {
        return this.getLength() > 0 && this.getHeight() > 0;
    }

    public String toString() {
        return "Rectangle, length:" + this.getLength() + ", height:" + this.getHeight() + ", area:" + this.getArea() + ", perimeter" + this.getPerimetro() + ", color:" + this.getColor();
    }
}