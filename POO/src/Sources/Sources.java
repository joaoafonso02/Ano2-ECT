/* 
@Override
public int compareTo(Object obj) {
    Data date = (Data) obj;
    if (this.year() < date.year) return -1;
    else if (this.year() > date.year()) return 1;
    if (this.month() < date.month()) return -1;
    else if (this.month() > date.month()) return 1;
    if (this.day() < date.day()) return -1;
    else if (this.day() > date.day()) return 1;
    return 0;
}

@Override
public boolean equals(Object obj) {
    if (obj == null) {
        return false;
    }
    if (getClass() != obj.getClass()) {
        return false;
    }
    final Pessoa other = (Pessoa) obj;
    if ((this.nome == null) ? (other.nome != null) : !this.nome.equals(other.nome)) {
        return false;
    }
    if (this.cartao_cidadao != other.cartao_cidadao) {
        return false;
    }
    if (this.data_nascimento != other.data_nascimento && (this.data_nascimento == null || !this.data_nascimento.equals(other.data_nascimento))) {
        return false;
    }
    return true;
}

@Override
public String toString() {
    return this.getNome() + "; CC: " + this.getCartaoCidadao() + "; Data de Nascimento: " + this.getDataNascimento().getData();
}

@Override
public int hashCode(){
    int a = this.nome.hashCode();
    a += this.cc;
    a += this.dataNasc.hashCode();

    return a;
}

@Override
public int hashCode() {return raio * centro.x() * centro.y();}


//abstract
    public abstract class Forma{
        //...
    }

    public class Circulo extends Forma{
        // ...
    }


// interfaces
    public interface Desenhavel{
        //...
    }

    public class Grafico implements Desenhavel{
        // ...
    }
*/