CREATE TABLE item (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    titulo VARCHAR(150) NOT NULL,
    tipo VARCHAR(20) NOT NULL
        CHECK (tipo IN ('LIVRO','REVISTA')),
    autor VARCHAR(100),
    edicao VARCHAR(50),
    disponivel BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE usuario (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(20) NOT NULL
        CHECK (tipo IN ('ALUNO','PROFESSOR')),
    limite_itens INTEGER NOT NULL
);

CREATE TABLE emprestimo (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    item_id INTEGER NOT NULL,
    usuario_id INTEGER NOT NULL,

    data_retirada DATE NOT NULL,
    data_devolucao_prevista DATE NOT NULL,
    data_devolucao DATE,

    valor_multa NUMERIC(10,2) DEFAULT 0,

    FOREIGN KEY (item_id)
        REFERENCES item(id),

    FOREIGN KEY (usuario_id)
        REFERENCES usuario(id)
);

INSERT INTO item
(codigo,titulo,tipo,autor,edicao,disponivel)
VALUES
('L001','Java Completo','LIVRO','Herbert ','13ª',FALSE),

('L002','Estruturas de Dados do ano 2029','LIVRO',
'Mark Allen Weiss','5ª',TRUE),

('R001','Revista da ciencia'
'REVISTA',NULL,'120',FALSE),

('R002','Revista Tecnologia202'
'REVISTA',NULL,'55',TRUE);

INSERT INTO usuario
(nome,tipo,limite_itens)
VALUES
('João Silveira','ALUNO',3),
('Mariah Souza','PROFESSOR',5);

INSERT INTO emprestimo
(item_id,usuario_id,data_retirada,
data_devolucao_prevista,data_devolucao,
valor_multa)
VALUES
(
1,
1,
'2025-11-01',
'2025-11-15',
NULL,
0
);

INSERT INTO emprestimo
(item_id,usuario_id,data_retirada,
data_devolucao_prevista,data_devolucao,
valor_multa)
VALUES
(
3,
2,
'2025-10-01',
'2025-10-08',
'2025-10-10',
2.00
);