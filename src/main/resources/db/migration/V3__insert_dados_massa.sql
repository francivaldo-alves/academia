-- =============================================
-- ALUNOS
-- =============================================
INSERT INTO alunos (nome, data_nascimento, sexo, telefone, celular, email, observacao,
                    endereco, numero, complemento, bairro, cidade, estado, cep)
VALUES ('Carlos Eduardo Silva', '1990-03-15', 'M', '(11) 3322-1100', '(11) 99876-5432', 'carlos.silva@email.com',
        'Aluno pontual e dedicado.', 'Rua das Flores', '123', 'Apto 4B', 'Centro', 'São Paulo', 'SP', '01310-100'),
       ('Ana Paula Souza', '1995-07-22', 'F', '(11) 3311-2200', '(11) 98765-4321', 'ana.souza@email.com', NULL,
        'Av. Paulista', '1500', NULL, 'Bela Vista', 'São Paulo', 'SP', '01310-200'),
       ('Roberto Almeida', '1988-11-05', 'M', NULL, '(11) 97654-3210', 'roberto.almeida@email.com',
        'Tem restrição no joelho.', 'Rua Augusta', '987', 'Casa', 'Consolação', 'São Paulo', 'SP', '01305-000'),
       ('Fernanda Lima', '2000-01-30', 'F', '(11) 3344-5566', '(11) 96543-2109', 'fernanda.lima@email.com', NULL,
        'Rua Oscar Freire', '45', 'Apto 10', 'Jardins', 'São Paulo', 'SP', '01426-000'),
       ('Thiago Martins', '1993-09-18', 'M', NULL, '(11) 95432-1098', 'thiago.martins@email.com',
        'Iniciante na modalidade.', 'Alameda Santos', '300', NULL, 'Cerqueira César', 'São Paulo', 'SP', '01419-000');

-- =============================================
-- MODALIDADES
-- =============================================
INSERT INTO modalidades (nome, ativa)
VALUES ('Jiu-Jitsu', TRUE),
       ('Muay Thai', TRUE),
       ('Boxe', TRUE),
       ('Karatê', FALSE);

-- =============================================
-- GRADUACOES
-- =============================================
INSERT INTO graduacoes (modalidade_id, nome)
VALUES ((SELECT id FROM modalidades WHERE nome = 'Jiu-Jitsu'), 'Faixa Branca'),
       ((SELECT id FROM modalidades WHERE nome = 'Jiu-Jitsu'), 'Faixa Azul'),
       ((SELECT id FROM modalidades WHERE nome = 'Jiu-Jitsu'), 'Faixa Roxa'),
       ((SELECT id FROM modalidades WHERE nome = 'Jiu-Jitsu'), 'Faixa Marrom'),
       ((SELECT id FROM modalidades WHERE nome = 'Jiu-Jitsu'), 'Faixa Preta'),
       ((SELECT id FROM modalidades WHERE nome = 'Muay Thai'), 'Iniciante'),
       ((SELECT id FROM modalidades WHERE nome = 'Muay Thai'), 'Intermediário'),
       ((SELECT id FROM modalidades WHERE nome = 'Muay Thai'), 'Avançado'),
       ((SELECT id FROM modalidades WHERE nome = 'Boxe'), 'Iniciante'),
       ((SELECT id FROM modalidades WHERE nome = 'Boxe'), 'Amador'),
       ((SELECT id FROM modalidades WHERE nome = 'Boxe'), 'Profissional'),
       ((SELECT id FROM modalidades WHERE nome = 'Karatê'), 'Faixa Branca'),
       ((SELECT id FROM modalidades WHERE nome = 'Karatê'), 'Faixa Amarela'),
       ((SELECT id FROM modalidades WHERE nome = 'Karatê'), 'Faixa Preta');

-- =============================================
-- PLANOS (Mensal e Trimestral)
-- =============================================
INSERT INTO planos (modalidade_id, nome, valor_mensal, ativo)
VALUES ((SELECT id FROM modalidades WHERE nome = 'Jiu-Jitsu'), 'Mensal', 150.00, TRUE),
       ((SELECT id FROM modalidades WHERE nome = 'Jiu-Jitsu'), 'Trimestral', 130.00, TRUE),
       ((SELECT id FROM modalidades WHERE nome = 'Muay Thai'), 'Mensal', 140.00, TRUE),
       ((SELECT id FROM modalidades WHERE nome = 'Muay Thai'), 'Trimestral', 120.00, TRUE),
       ((SELECT id FROM modalidades WHERE nome = 'Boxe'), 'Mensal', 130.00, TRUE),
       ((SELECT id FROM modalidades WHERE nome = 'Boxe'), 'Trimestral', 110.00, TRUE),
       ((SELECT id FROM modalidades WHERE nome = 'Karatê'), 'Mensal', 120.00, FALSE),
       ((SELECT id FROM modalidades WHERE nome = 'Karatê'), 'Trimestral', 100.00, FALSE);

-- =============================================
-- MATRICULAS
-- =============================================
INSERT INTO matriculas (aluno_id, data_matricula, dia_vencimento, data_encerramento, status)
VALUES ((SELECT id FROM alunos WHERE email = 'carlos.silva@email.com'), '2024-01-10', 10, NULL, 'ATIVA'),
       ((SELECT id FROM alunos WHERE email = 'ana.souza@email.com'), '2024-02-01', 5, NULL, 'ATIVA'),
       ((SELECT id FROM alunos WHERE email = 'roberto.almeida@email.com'), '2023-06-15', 15, '2024-03-15', 'ENCERRADA'),
       ((SELECT id FROM alunos WHERE email = 'fernanda.lima@email.com'), '2024-03-20', 20, NULL, 'ATIVA'),
       ((SELECT id FROM alunos WHERE email = 'thiago.martins@email.com'), '2024-04-01', 1, NULL, 'ATIVA');

-- =============================================
-- MATRICULAS_MODALIDADES
-- =============================================
INSERT INTO matriculas_modalidades (matricula_id, modalidade_id, graduacao_id, plano_id, data_inicio, data_fim)
VALUES ((SELECT m.id
         FROM matriculas m
                  JOIN alunos a ON a.id = m.aluno_id
         WHERE a.email = 'carlos.silva@email.com'),
        (SELECT id FROM modalidades WHERE nome = 'Jiu-Jitsu'),
        (SELECT g.id
         FROM graduacoes g
                  JOIN modalidades m ON m.id = g.modalidade_id
         WHERE m.nome = 'Jiu-Jitsu'
           AND g.nome = 'Faixa Azul'),
        (SELECT p.id
         FROM planos p
                  JOIN modalidades m ON m.id = p.modalidade_id
         WHERE m.nome = 'Jiu-Jitsu'
           AND p.nome = 'Mensal'),
        '2024-01-10', NULL),
       ((SELECT m.id
         FROM matriculas m
                  JOIN alunos a ON a.id = m.aluno_id
         WHERE a.email = 'ana.souza@email.com'),
        (SELECT id FROM modalidades WHERE nome = 'Muay Thai'),
        (SELECT g.id
         FROM graduacoes g
                  JOIN modalidades m ON m.id = g.modalidade_id
         WHERE m.nome = 'Muay Thai'
           AND g.nome = 'Intermediário'),
        (SELECT p.id
         FROM planos p
                  JOIN modalidades m ON m.id = p.modalidade_id
         WHERE m.nome = 'Muay Thai'
           AND p.nome = 'Mensal'),
        '2024-02-01', NULL),
       ((SELECT m.id
         FROM matriculas m
                  JOIN alunos a ON a.id = m.aluno_id
         WHERE a.email = 'roberto.almeida@email.com'),
        (SELECT id FROM modalidades WHERE nome = 'Boxe'),
        (SELECT g.id
         FROM graduacoes g
                  JOIN modalidades m ON m.id = g.modalidade_id
         WHERE m.nome = 'Boxe'
           AND g.nome = 'Iniciante'),
        (SELECT p.id
         FROM planos p
                  JOIN modalidades m ON m.id = p.modalidade_id
         WHERE m.nome = 'Boxe'
           AND p.nome = 'Trimestral'),
        '2023-06-15', '2024-03-15'),
       ((SELECT m.id
         FROM matriculas m
                  JOIN alunos a ON a.id = m.aluno_id
         WHERE a.email = 'fernanda.lima@email.com'),
        (SELECT id FROM modalidades WHERE nome = 'Jiu-Jitsu'),
        (SELECT g.id
         FROM graduacoes g
                  JOIN modalidades m ON m.id = g.modalidade_id
         WHERE m.nome = 'Jiu-Jitsu'
           AND g.nome = 'Faixa Branca'),
        (SELECT p.id
         FROM planos p
                  JOIN modalidades m ON m.id = p.modalidade_id
         WHERE m.nome = 'Jiu-Jitsu'
           AND p.nome = 'Trimestral'),
        '2024-03-20', NULL),
       ((SELECT m.id
         FROM matriculas m
                  JOIN alunos a ON a.id = m.aluno_id
         WHERE a.email = 'thiago.martins@email.com'),
        (SELECT id FROM modalidades WHERE nome = 'Muay Thai'),
        (SELECT g.id
         FROM graduacoes g
                  JOIN modalidades m ON m.id = g.modalidade_id
         WHERE m.nome = 'Muay Thai'
           AND g.nome = 'Iniciante'),
        (SELECT p.id
         FROM planos p
                  JOIN modalidades m ON m.id = p.modalidade_id
         WHERE m.nome = 'Muay Thai'
           AND p.nome = 'Mensal'),
        '2024-04-01', NULL);

-- =============================================
-- FATURAS_MATRICULAS
-- =============================================
INSERT INTO faturas_matriculas (matricula_id, data_vencimento, valor, data_pagamento, data_cancelamento, status)
VALUES
    -- Carlos → Jiu-Jitsu Mensal R$ 150,00
    ((SELECT m.id
      FROM matriculas m
               JOIN alunos a ON a.id = m.aluno_id
      WHERE a.email = 'carlos.silva@email.com'), '2024-01-10', 150.00, '2024-01-09 10:00:00', NULL, 'PAGA'),
    ((SELECT m.id
      FROM matriculas m
               JOIN alunos a ON a.id = m.aluno_id
      WHERE a.email = 'carlos.silva@email.com'), '2024-02-10', 150.00, '2024-02-10 14:30:00', NULL, 'PAGA'),
    ((SELECT m.id
      FROM matriculas m
               JOIN alunos a ON a.id = m.aluno_id
      WHERE a.email = 'carlos.silva@email.com'), '2024-03-10', 150.00, NULL, NULL, 'ABERTA'),

    -- Ana → Muay Thai Mensal R$ 140,00
    ((SELECT m.id
      FROM matriculas m
               JOIN alunos a ON a.id = m.aluno_id
      WHERE a.email = 'ana.souza@email.com'), '2024-02-05', 140.00, '2024-02-04 09:00:00', NULL, 'PAGA'),
    ((SELECT m.id
      FROM matriculas m
               JOIN alunos a ON a.id = m.aluno_id
      WHERE a.email = 'ana.souza@email.com'), '2024-03-05', 140.00, NULL, NULL, 'VENCIDA'),
    ((SELECT m.id
      FROM matriculas m
               JOIN alunos a ON a.id = m.aluno_id
      WHERE a.email = 'ana.souza@email.com'), '2024-04-05', 140.00, NULL, NULL, 'ABERTA'),

    -- Roberto → Boxe Trimestral R$ 110,00 (encerrada)
    ((SELECT m.id
      FROM matriculas m
               JOIN alunos a ON a.id = m.aluno_id
      WHERE a.email = 'roberto.almeida@email.com'), '2023-06-15', 110.00, '2023-06-14 11:00:00', NULL, 'PAGA'),
    ((SELECT m.id
      FROM matriculas m
               JOIN alunos a ON a.id = m.aluno_id
      WHERE a.email = 'roberto.almeida@email.com'), '2023-07-15', 110.00, NULL, '2024-03-15', 'CANCELADA'),

    -- Fernanda → Jiu-Jitsu Trimestral R$ 130,00
    ((SELECT m.id
      FROM matriculas m
               JOIN alunos a ON a.id = m.aluno_id
      WHERE a.email = 'fernanda.lima@email.com'), '2024-03-20', 130.00, '2024-03-19 16:00:00', NULL, 'PAGA'),
    ((SELECT m.id
      FROM matriculas m
               JOIN alunos a ON a.id = m.aluno_id
      WHERE a.email = 'fernanda.lima@email.com'), '2024-04-20', 130.00, NULL, NULL, 'ABERTA'),

    -- Thiago → Muay Thai Mensal R$ 140,00
    ((SELECT m.id
      FROM matriculas m
               JOIN alunos a ON a.id = m.aluno_id
      WHERE a.email = 'thiago.martins@email.com'), '2024-04-01', 140.00, NULL, NULL, 'ABERTA');

-- =============================================
-- ASSIDUIDADE
-- =============================================
INSERT INTO assiduidade (matricula_id, data_entrada, data_saida)
VALUES ((SELECT m.id
         FROM matriculas m
                  JOIN alunos a ON a.id = m.aluno_id
         WHERE a.email = 'carlos.silva@email.com'), '2024-03-04 07:00:00', '2024-03-04 08:30:00'),
       ((SELECT m.id
         FROM matriculas m
                  JOIN alunos a ON a.id = m.aluno_id
         WHERE a.email = 'carlos.silva@email.com'), '2024-03-06 07:05:00', '2024-03-06 08:35:00'),
       ((SELECT m.id
         FROM matriculas m
                  JOIN alunos a ON a.id = m.aluno_id
         WHERE a.email = 'carlos.silva@email.com'), '2024-03-08 07:10:00', '2024-03-08 08:40:00'),
       ((SELECT m.id
         FROM matriculas m
                  JOIN alunos a ON a.id = m.aluno_id
         WHERE a.email = 'ana.souza@email.com'), '2024-03-04 18:00:00', '2024-03-04 19:30:00'),
       ((SELECT m.id
         FROM matriculas m
                  JOIN alunos a ON a.id = m.aluno_id
         WHERE a.email = 'ana.souza@email.com'), '2024-03-05 18:10:00', '2024-03-05 19:40:00'),
       ((SELECT m.id
         FROM matriculas m
                  JOIN alunos a ON a.id = m.aluno_id
         WHERE a.email = 'roberto.almeida@email.com'), '2023-07-10 09:00:00', '2023-07-10 10:00:00'),
       ((SELECT m.id
         FROM matriculas m
                  JOIN alunos a ON a.id = m.aluno_id
         WHERE a.email = 'fernanda.lima@email.com'), '2024-03-21 10:00:00', '2024-03-21 11:30:00'),
       ((SELECT m.id
         FROM matriculas m
                  JOIN alunos a ON a.id = m.aluno_id
         WHERE a.email = 'fernanda.lima@email.com'), '2024-03-23 10:05:00', NULL),
       ((SELECT m.id
         FROM matriculas m
                  JOIN alunos a ON a.id = m.aluno_id
         WHERE a.email = 'thiago.martins@email.com'), '2024-04-02 19:00:00', '2024-04-02 20:30:00');