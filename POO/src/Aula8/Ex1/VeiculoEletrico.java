package Aula8.Ex1;

public interface VeiculoEletrico{
    int autonomia();// devolve autonomia restante
    void carregar(int percentagem);// simula um carregamento até ‘percentagem’
    void descarregar(int num);
}