public class Biblioteca {

    private ItemBiblioteca[] acervo;
    private int quantidadeItens;

    public Biblioteca(int capacidade) {
        acervo = new ItemBiblioteca[capacidade];
        quantidadeItens = 0;
    }

    public void adicionarItem(ItemBiblioteca item) {

        if (quantidadeItens < acervo.length) {
            acervo[quantidadeItens] = item;
            quantidadeItens++;
        }
    }

    public void emprestar(ItemBiblioteca item, Usuario usuario) {

        if (!item.isDisponivel()) {
            System.out.println("Item indisponível.");
            return;
        }

        if (usuario.getQuantidadeEmprestada() >= usuario.getLimiteItens()) {
            System.out.println(
                    "Empréstimo recusado. Limite atingido para "
                            + usuario.getNome()
            );
            return;
        }

        item.emprestar();
        usuario.incrementarEmprestimo();

        System.out.println(
                "Empréstimo realizado para "
                        + usuario.getNome()
        );
    }

    public void devolver(ItemBiblioteca item, Usuario usuario) {

        item.devolver();
        usuario.decrementarEmprestimo();

        System.out.println("Item devolvido.");
    }

    public void listarAcervo() {

        System.out.println("\n===== ACERVO =====");

        for (int i = 0; i < quantidadeItens; i++) {
            System.out.println(acervo[i]);
        }
    }
}