
# Sistema de Biblioteca - Java e PostgreSQL

## Estrutura do Projeto

```text
BibliotecaProjeto/
│
├── Main.java
├── Biblioteca.java
│
├── ItemBiblioteca.java
├── Livro.java
├── Revista.java
├── DVD.java
│
├── Usuario.java
├── Aluno.java
├── Professor.java
│
└── banco_biblioteca.sql
```

---

# Exercício 1 - Sistema de Biblioteca em Java

## Objetivo

Desenvolver um sistema de biblioteca utilizando:

- Herança
- Classes Abstratas
- Polimorfismo
- Encapsulamento
- Arrays de tamanho fixo

### Regras de Negócio

#### Itens

| Tipo | Prazo | Multa |
|--------|--------|--------|
| Livro | 14 dias | R$ 0,50 por dia |
| Revista | 7 dias | R$ 1,00 por dia |

#### Usuários

| Tipo | Limite de Empréstimos |
|--------|--------|
| Aluno | 3 itens |
| Professor | 5 itens |

---

## Classes Implementadas

### ItemBiblioteca (Abstrata)

Atributos:

- codigo
- titulo
- disponivel

Métodos abstratos:

```java
public abstract int getPrazoDias();
public abstract double calcularMulta(int diasAtraso);
```

Classes filhas:

- Livro
- Revista
- DVD

---

### Usuario (Abstrata)

Atributos:

- nome
- quantidadeEmprestada

Método abstrato:

```java
public abstract int getLimiteItens();
```

Classes filhas:

- Aluno
- Professor

---

### Biblioteca

Responsável por:

```java
emprestar()
devolver()
listarAcervo()
```

O acervo é armazenado em:

```java
ItemBiblioteca[]
```

com tamanho fixo.

---

### Main

Cenário de teste:

✅ Cadastro de itens

✅ Cadastro de usuários

✅ Empréstimo realizado com sucesso

✅ Empréstimo recusado por limite atingido

---

## Saída Esperada

```text
Empréstimo realizado para João
Empréstimo realizado para João
Empréstimo realizado para João
Empréstimo recusado. Limite atingido.
Empréstimo realizado para Maria

===== ACERVO =====
L001 - Java Completo | Disponível: false
L002 - POO na Prática | Disponível: false
L003 - Estruturas de Dados | Disponível: false
L004 - Banco de Dados | Disponível: true
R001 - Revista Ciência | Disponível: false
```

---

## Teste de Extensão

Foi criada a classe:

```java
DVD extends ItemBiblioteca
```

sem alterar nenhuma classe existente.

Isso demonstra o princípio:

```text
Open/Closed Principle (SOLID)
```

---

# Exercício 2 - Modelagem PostgreSQL

## Tabelas

### item

```sql
id
codigo
titulo
tipo
autor
edicao
disponivel
```

---

### usuario

```sql
id
nome
tipo
limite_itens
```

---

### emprestimo

```sql
id
item_id
usuario_id
data_retirada
data_devolucao_prevista
data_devolucao
valor_multa
```

---

## Restrições Aplicadas

### Chaves Primárias

```sql
GENERATED ALWAYS AS IDENTITY
```

---

### Restrição de Tipos

```sql
CHECK (tipo IN (...))
```

---

### Chaves Estrangeiras

```sql
FOREIGN KEY (item_id)
REFERENCES item(id)
```

```sql
FOREIGN KEY (usuario_id)
REFERENCES usuario(id)
```

---

## Dados de Teste

### Itens

- 2 Livros
- 2 Revistas

### Usuários

- 1 Aluno
- 1 Professor

### Empréstimos

- 1 Empréstimo em aberto
- 1 Empréstimo devolvido

---

# Tecnologias Utilizadas

- Java
- Programação Orientada a Objetos (POO)
- PostgreSQL
- SQL DDL
- SQL DML
- VS Code

---

# Autor

Projeto desenvolvido para prática de:

- Classes Abstratas
- Herança
- Polimorfismo
- Encapsulamento
- Modelagem de Banco de Dados Relacional
- PostgreSQL
