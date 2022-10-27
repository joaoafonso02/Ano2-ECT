

public abstract class Activity implements IEvent{
    private int numParticipants;
    protected int cost = 0;

    public Activity(int cost) {
        this.cost = cost;
        this.numParticipants = numParticipants;
    }

    public Activity(int cost, int numParticipants) {
        this.cost = cost;
        this.numParticipants = numParticipants;
    }

    public int getNumParticipants() {
        return numParticipants;
    }

    public void setNumParticipants(int numParticipants) {
        this.numParticipants = numParticipants;
    }

    public int getCost() {
        return cost;
    }

    public void setCost(int cost) {
        this.cost = cost;
    }

    public int getPrice() {
        return cost;
    }

    public void add(Activity activity) {
    }


}

