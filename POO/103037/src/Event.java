import java.time.LocalDate;
import java.util.*;

public class Event implements IEvent{
    private LocalDate date;
    private Set<Activity> atividades = new TreeSet<>();

    @Override
    public Event addActivity(Activity activity) {
        if(activity.getClass().getName().equals("Sport") || activity.getClass().getName().equals("Culture")) {
            //if(activity.contains(activity.getPrice()))
            activity.add(activity);
        }
        return null;
    }
    public Set<Activity> getAtividades() {
        return atividades;
    }
    public void setAtividades(Set<Activity> atividades) {
        this.atividades = atividades;
    }

    public double totalPrice() {
        int i  = 0;
        for(Activity at : atividades) {
            i += at.getPrice()*at.getNumParticipants();
        }
        return i;
    }

    @Override
    public LocalDate getDate() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((atividades == null) ? 0 : atividades.hashCode());
        result = prime * result + ((date == null) ? 0 : date.hashCode());
        return result;
    }
    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Event other = (Event) obj;
        if (atividades == null) {
            if (other.atividades != null)
                return false;
        } else if (!atividades.equals(other.atividades))
            return false;
        if (date == null) {
            if (other.date != null)
                return false;
        } else if (!date.equals(other.date))
            return false;
        return true;
    }
 
}
