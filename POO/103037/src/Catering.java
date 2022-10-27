import java.time.LocalDate;

public class Catering extends Activity{
    private int price  = 25;

    public enum Option{
        RIVER_TOUR, ARCHITECTURAL_TOUR, WINE_TASTING, LIGHT_BITES, FULL_MENU, DRINKS_AND_SNACKS
    }

    private Option op;

    public Catering(Option op, int cost) {
        super(cost);
        this.op = op;
    }

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
