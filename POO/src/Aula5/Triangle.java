package Aula5;

public class Triangle {
    private double side1, side2, side3;

    Triangle(double side1, double side2, double side3) {
        set(side1, side2, side3);
    }

    public void set(double side1, double side2, double side3) {
        assert side1 > 0 && side2 > 0 && side3 > 0: "Invalid Measures for a triangle";
        this.side1 = side1;
        this.side2 = side2;
        this.side3 = side3;
    }

    public double getSide1() { return side1;} // get side1
    public double getSide2() { return side2;} // get side2
    public double getSide3() { return side3;} // get side3

    public String toString() {
        return "Triangle is made by: \tside1 - " + side1 + ";\tside2 - " + side2 + ";\tside3 - " + side3;
    }

    public double TriangleArea() {
        double s = (getSide1() + getSide2() + getSide3()) / 2;
        return Math.sqrt(s * (s-side1) * (s-side2) * (s-side3));
    }

    public double TrianglePerimeter() {
        return getSide1() + getSide2() + getSide3();
    }
  
    public boolean TriangleEquals(Triangle t1) {
        return this.side1 == t1.getSide1() && this.side2 == t1.getSide2() && this.side3 == t1.getSide3();
    }
}
