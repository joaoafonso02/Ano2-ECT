class HelloWorld {
    public static void main(String [] args) {
        System.out.println("\nHello World");
        int sum = 0;

        for (int i = 0; i < 200; i++) {
            sum += i;
        }

        System.out.println("Sum = " + sum);
    }
}
