package Aula9;

import Aula5.Data;

public class Pessoa {
    private String nome;
    private Data dataNasc;
    private int cc;

    public Pessoa(String nome, int cc, Data dataNasc) {
        assert nome.length() > 0  &&  cc > 0;
        this.nome = nome;
        this.cc = cc;
        this.dataNasc = dataNasc;
    }

    public String getName() { return this.nome; }

    @Override
    public String toString() {
        return String.format("%s; CC: %d; Data de Nascimento: %s", this.nome, this.cc, this.dataNasc);
    }

    @Override
    public boolean equals(Object obj) {
        if(this == obj) {
            return true;
        }
        if(obj == null) {
            return false;
        }
        if(!(obj instanceof Pessoa)) {
            return false;
        }
        Pessoa b = (Pessoa) obj;
        if(this.cc == b.cc & this.dataNasc.equals(b.dataNasc) && this.nome.equals(b.nome))
            return true;
        return false;
    }

    @Override
    public int hashCode(){
        int a = this.nome.hashCode() * 98;
        a += this.cc;
        a /= 13;
        a += this.dataNasc.hashCode();
        a *= 17;

        return a;
    }
}