package Aula5;

public class Circle {
    private double radius;

    Circle(double radius) {
        if(setRadius(radius)) {
            this.radius = radius;
        }
    }

    public boolean setRadius(double radius) {
        if(radius > 0)
            return true;
        return false;
    }

    public double getRadius() { return radius;} // get radius

    public String toString() {
        return "This is a Circle that has a radius of " + this.radius;
    }

    public double Area(double radius) {
        return Math.PI * this.radius * this.radius;
    }

    public double Perimeter(double radius) {
        return 2 * Math.PI * this.radius;
    }

    public boolean equals(Circle c1) {
        return this.radius == c1.getRadius();
    }
}
