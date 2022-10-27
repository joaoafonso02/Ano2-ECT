import java.time.LocalDate;
import java.util.Date;
import java.util.Map;
import java.util.Map.Entry;

public class EventManager {

    private String nome;
    private Map<Client, Event> eventos;
    
    public EventManager(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }


    public Client addClient(String nome, String localidade) {
        eventos.put(nome, localidade);

    }

    public Event addEvent(Client c1, LocalDate date) {
        String[] splitDate = date.toString().split(".");
        eventos.get(c1).set(Integer.parseInt(splitDate[2]), Integer.parseInt(splitDate[1]), Integer.parseInt(splitDate[02]));
        return null;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((nome == null) ? 0 : nome.hashCode());
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
        EventManager other = (EventManager) obj;
        if (nome == null) {
            if (other.nome != null)
                return false;
        } else if (!nome.equals(other.nome))
            return false;
        return true;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
    public String listClients() {
        StringBuilder sBuilder = new StringBuilder();
        sBuilder.append("Clients:\n");
        for(Entry<Client, Event> entrada: eventos.entrySet()) {
                

        }
        return null;
    }

    public String listEvents() {
        return null;
    }

    public String[] clientsWithEvents() {
        return null;
    }

    public String[] nextEventsByDate() {
        return null;
    }

}
