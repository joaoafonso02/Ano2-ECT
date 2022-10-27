import java.time.LocalDate;

public class Sport extends Activity{
    public static final String Modality = null;
    private int price  = 30;

    public enum Modality {KAYAK,BIKE}

    private Modality modality;

    public Sport(Modality modality, int price) {
        super(price);
        this.modality = modality;
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
