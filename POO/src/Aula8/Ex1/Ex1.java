package Aula8.Ex1;

public class Ex1 {
    
    // Criação da agência de aluguer de veículos
    private static EmpresaAluguer empresa = new EmpresaAluguer("Transportes Manolo", "4100-077", "geral@manolo.pt");
    // Criar veículos da frota da agência
    private static PesadoDeMercadorias pesado1 = new PesadoDeMercadorias("01-24-BA", "Porshe", "Palio", 200, 1, 2.0f, 5.0f);
    private static PesadoDePassageiros pesado2 = new PesadoDePassageiros("44-44-64", "Volvo", "PS-C", 150, 1, 2.0f);
    private static Motociclo motociclo1 = new Motociclo("12-34-B5", "Yamaha", "Fazer", 150, "desportivo");
    private static Motociclo motociclo2 = new Motociclo("54-32-21", "Delim", "Southern", 120, "estrada");
    private static VeiculoLigeiro ligeiro1 = new VeiculoLigeiro("12-34-85", "Mercedes", "NS", 150, 1, 7.0f);
    private static Taxi ligeiro2 = new Taxi("12-34-5Z", "Mercedes", "NS", 150, 1, 123442);
    private static LigeiroPassageirosEletrico eletrico1 = new LigeiroPassageirosEletrico("12-34-N5", "Mercedes", "NS", 150, 1, 7.0f, 100);
    private static PesadoPassageirosEletrico eletrico2 = new PesadoPassageirosEletrico("ma-tr-ic", "Volvo", "x3", 300, 5, 20000, 70, 5000);

    public static void main(String[] args) {
        // Adicionar veículos à frota da agência
        empresa.addVeiculo(pesado1);
        empresa.addVeiculo(pesado2);
        empresa.addVeiculo(motociclo1);
        empresa.addVeiculo(motociclo2);
        empresa.addVeiculo(ligeiro1);
        empresa.addVeiculo(ligeiro2);
        empresa.addVeiculo(eletrico1);
        // Ver quilometragens
        printQuilometragens();
        // Fazer trajetos
        pesado1.trajeto(500);
        pesado1.trajeto(100);
        pesado1.trajeto(100);
        pesado1.trajeto(1000);
        pesado1.trajeto(100);
        pesado1.trajeto(1000);
        pesado1.trajeto(10000);
        pesado1.trajeto(10000);
        pesado1.trajeto(100);
        pesado2.trajeto(1000);
        motociclo1.trajeto(500);
        motociclo2.trajeto(1000);
        ligeiro1.trajeto(15000);
        ligeiro2.trajeto(1000);
        // Ver quilometragens
        printQuilometragens();
        // Veiculo com mais quilometros percorridos
        printVeiculoMaisPercorrido();
        System.out.println("============================================");
        System.out.println("Autonomia restante eletrico1: " + eletrico1.autonomia());
        System.out.println("eletrico1 percorre 100 quilometros");
        eletrico1.trajeto(100);
        System.out.println("Autonomia restante eletrico1: " + eletrico1.autonomia());
        System.out.println("eletrico1 carrega 100%");
        eletrico1.carregar(100);
        System.out.println("Autonomia restante eletrico1: " + eletrico1.autonomia());
        System.out.println("eletrico1 percorre 1000 quilometros");
        eletrico1.trajeto(1000);
        System.out.println("Autonomia restante eletrico1: " + eletrico1.autonomia());
        System.out.println("============================================");
        System.out.println("Autonomia restante eletrico2: " + eletrico2.autonomia());
        System.out.println("eletrico2 percorre 100 quilometros");
        eletrico2.trajeto(100);
        System.out.println("Autonomia restante eletrico2: " + eletrico2.autonomia());
        System.out.println("eletrico2 carrega 100%");
        eletrico2.carregar(100);
        System.out.println("Autonomia restante eletrico2: " + eletrico2.autonomia());
        System.out.println("eletrico2 percorre 1000 quilometros");
        eletrico2.trajeto(1000);
        System.out.println("Autonomia restante eletrico2: " + eletrico2.autonomia());
    }

    public static void printQuilometragens() {
        System.out.println("============================================");
        for (Veiculo veiculo : empresa.getFrota()) {
            System.out.println("Quilometragem de " + veiculo.getMatricula() + ": " + veiculo.distanciaTotal());
        }
    }

    public static void printVeiculoMaisPercorrido() {
        System.out.println("============================================");
        int maior_distancia = 0;
        Veiculo veiculo_mais_percorrido = null;
        for (Veiculo veiculo : empresa.getFrota()) {
            if (veiculo.distanciaTotal() > maior_distancia) {
                maior_distancia = veiculo.distanciaTotal();
                veiculo_mais_percorrido = veiculo;
            }
        }
        System.out.println("O veículo com mais quilometros percorridos é: " + veiculo_mais_percorrido.getMatricula());
    }

    
}
