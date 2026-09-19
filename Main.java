public class Main {

    public static void main(String[] args) {

        Biblioteca biblioteca = new Biblioteca(20);

        Livro livro1 = new Livro("L001", "Java Completo");
        Livro livro2 = new Livro("L002", "POO na Prática");
        Livro livro3 = new Livro("L003", "Estruturas de Dados");
        Livro livro4 = new Livro("L004", "Banco de Dados");

        Revista revista1 =
                new Revista("R001", "Revista Ciência");

        biblioteca.adicionarItem(livro1);
        biblioteca.adicionarItem(livro2);
        biblioteca.adicionarItem(livro3);
        biblioteca.adicionarItem(livro4);
        biblioteca.adicionarItem(revista1);

        Aluno aluno = new Aluno("João");
        Professor professor = new Professor("Maria");

        biblioteca.emprestar(livro1, aluno);
        biblioteca.emprestar(livro2, aluno);
        biblioteca.emprestar(livro3, aluno);

        // recusado por limite
        biblioteca.emprestar(livro4, aluno);

        biblioteca.emprestar(revista1, professor);

        biblioteca.listarAcervo();
    }
}