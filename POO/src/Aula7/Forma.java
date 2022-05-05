package Aula7;

public abstract class Forma {
    protected String color;

    public abstract boolean isValidFig();

    public void setColor(String color) {
        this.color = color;
    }
    public String getColor() {
        return this.color;
    }
    
    public abstract double getPerimetro(); 
    public abstract double getArea();

    public boolean equals(Forma f) {
        return this.toString().equals(f.toString());
    }
}