package Aula5;
import java.io.IOException;
import java.util.Scanner;
import java.util.Vector;

public class Ex5 {
	public static final Scanner sc = new Scanner(System.in);
	public static void main(String[] args) throws IOException {
		Vector<Livro> livros = new Vector<>(100);
		Vector<Utilizador> utilizadores = new Vector<>(100);

		while(true) {
			System.out.println("\nBiblioteca:");
			System.out.println("1 - inscrever utilizador");
			System.out.println("2 - remover utilizador");
			System.out.println("3 - imprimir lista de utilizadores");
			System.out.println("4 - registar um novo livro");
			System.out.println("5 - imprimir lista de livros");
			System.out.println("6 - emprestar");
			System.out.println("4 - devolver");
			System.out.println("8 - sair");
			System.out.print("\nChoice: ");

			int choice = sc.nextInt();

			switch(choice) { 
                
                case 1:
                    System.out.println("(inscrever utilizador)");
                    int nMec = 0;
                    while(true) {
                        System.out.print("nMec: ");
                        nMec = sc.nextInt();
                        for (Utilizador utilizador : utilizadores) {
                            if(utilizador.getnMec() == nMec) {
                                System.out.println("nMec já introduzido!");
                                continue;
                            }
                        }
                        break;
                    }
                    System.out.print("Nome: ");
                    String nome = sc.nextLine();
                    System.out.print("curso: ");
                    String curso = sc.nextLine();
                    utilizadores.add(new Utilizador(nome, nMec, curso));
            
            case 2:
				System.out.println("(remover utilizador)");
				nMec = 0;
				Boolean removed = false;
				System.out.print("nMec: ");
				nMec = sc.nextInt();
				for (int i = 0; i < utilizadores.size(); i++) {
					if(utilizadores.get(i).getnMec() == nMec) {
						utilizadores.remove(i);
						System.out.println("utilizador removido");
						removed = true;
						System.in.read();
					}
				}
				if( !removed ) {
					System.out.println("Utilizador não encontrado!");
					System.in.read();
				}

			case 3:
				System.out.println("(imprimir lista de utilizadores)");
				for (Utilizador utilizador : utilizadores) {
					System.out.println(utilizador);
				}
				System.in.read();
			
            case 4:
				System.out.println("(registar um novo livro)");
				System.out.print("Titulo: ");
				String titulo = sc.nextLine();
				System.out.print("Tipo de Emprestimo (NORMAL ou CONDICIONAL): ");
				String tipoEmprestimo = sc.nextLine();
				livros.add(new Livro(titulo, tipoEmprestimo));
			}
        }
    } 
}
