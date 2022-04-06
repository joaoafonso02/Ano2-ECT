package Aula5;

public class Rectangle {
    private double length, height;
    
    Rectangle(double length, double height) {
        setMeasures(length, height);
    }

    public void setMeasures(double length, double height) {
        assert length > 0 && height > 0 : "Wrong measures";
        this.length = length;
        this.height = height;
    }

    public double getLength() { return length;} // get length
    public double getHeight() { return height;} // get height

    public String toString() {
        return "This is a Rectangle with " + this.length + " of length and " + this.height + " of height!";
    }

    public double Area() {
        return length * height;
    }

    public double Perimeter() {
        return 2 * length + 2 * height;
    }

    public boolean equals(Rectangle r1) {
        return this.length == r1.getLength() && this.height == r1.getHeight();
    }
}
