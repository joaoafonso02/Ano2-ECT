import java.time.LocalDate;

public class Culture extends Activity {
    public enum Modality {KAYAK,BIKE}

    public enum  Option {
        ARCHITECTURAL_TOUR, RIVER_TOUR, WINE_TASTING, ART_MUSEUM;
    }
    private Option option;

    private Modality modality;
    private int price  = 22;
    
    public Culture(Modality modality, int cost) {
        super(cost);
        this.modality= modality;
    }

    public Culture(Culture.Option architecturalTour, int cost) {
        this.cost = cost;
    }

    public Option getOption() {
        return option;
    }

    public void setOption(Option option) {
        this.option = option;
    }

    public Modality getModality() {return modality;}

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setModality(Modality modality) {this.modality = modality;}

    @Override
    public Event addActivity(Activity activity) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public LocalDate getDate() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public double totalPrice() {
        // TODO Auto-generated method stub
        return 0;
    }
}
