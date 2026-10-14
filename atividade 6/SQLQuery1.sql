-- ============================================================
-- CLÍNICA MÉDICA VIDA SAUDÁVEL
-- Banco de dados: clinica_medica_db
-- Linguagem: SQL DML + ajustes DDL necessários
-- ============================================================

USE clinica_medica_db;

-- ============================================================
-- PREPARAÇÃO: AJUSTAR AS COLUNAS AO ENUNCIADO
-- Execute somente se as colunas ainda não existirem.
-- ============================================================

-- Na tabela pacientes, o endereço será armazenado separado.
-- Se a tabela já possui endereco, ela poderá continuar existindo.

ALTER TABLE pacientes
    ADD COLUMN rua VARCHAR(150),
    ADD COLUMN numero VARCHAR(10),
    ADD COLUMN cidade VARCHAR(100),
    ADD COLUMN cep VARCHAR(10);

-- Na tabela agendamentos, adicionar os campos solicitados.
ALTER TABLE agendamentos
    ADD COLUMN sala VARCHAR(30),
    ADD COLUMN valor DECIMAL(10,2),
    ADD COLUMN observacoes TEXT;

-- ============================================================
-- 1º PASSO A: INSERÇÃO DE MÉDICOS
-- ============================================================

INSERT INTO medicos
    (nome, especialidade, crm, telefone, email)
VALUES
    ('Carlos Andrade', 'Cardiologia', 'SP123456',
     '(14) 99123-4567', 'carlos.andrade@vidasaudavel.com'),

    ('Sofia Almeida', 'Dermatologia', 'SP654321',
     '(14) 99765-4321', 'sofia.almeida@vidasaudavel.com'),

    ('Fernando Batista', 'Ortopedia', 'SP789123',
     '(14) 98877-6655', 'fernando.batista@vidasaudavel.com');

-- Conferir os médicos cadastrados
SELECT * FROM medicos;


-- ============================================================
-- 1º PASSO B: INSERÇÃO DE PACIENTES
-- ============================================================

INSERT INTO pacientes
    (nome, cpf, data_nascimento, rua, numero, cidade, cep,
     telefone, email)
VALUES
    ('Ana Oliveira', '111.222.333-44', '1985-05-20',
     'Rua das Flores', '123', 'Botucatu', '18600-000',
     '(14) 99888-7777', 'ana.oliveira@email.com'),

    ('Lucas Martins', '444.555.666-77', '1992-11-30',
     'Avenida Principal', '456', 'Botucatu', '18602-123',
     '(14) 99777-6666', 'lucas.martins@email.com'),

    ('Ricardo Mendes', '777.888.999-00', '1978-02-10',
     'Travessa da Paz', '78', 'Botucatu', '18605-456',
     '(14) 99666-5555', 'ricardo.mendes@email.com');

-- Conferir os pacientes cadastrados
SELECT * FROM pacientes;


-- ============================================================
-- 1º PASSO C: INSERÇÃO DE AGENDAMENTOS
-- ============================================================

INSERT INTO agendamentos
    (id_medico, id_paciente, data_hora, sala, valor, observacoes)
VALUES
    (1, 1, '2025-10-20 09:00:00', 'Sala 101', 350.00,
     'Paciente relata dor no peito'),

    (2, 3, '2025-10-22 14:30:00', 'Sala 205', 400.00,
     'Verificar manchas na pele'),

    (3, 2, '2025-10-25 11:00:00', 'Sala 302', 300.00,
     NULL);

-- Conferir os agendamentos cadastrados
SELECT * FROM agendamentos;


-- ============================================================
-- 2º PASSO A: ATUALIZAÇÃO DO TELEFONE DO MÉDICO
-- ============================================================

UPDATE medicos
SET telefone = '(14) 99100-2030'
WHERE nome = 'Carlos Andrade'
  AND crm = 'SP123456';

-- Conferir os médicos após a atualização
SELECT * FROM medicos;


-- ============================================================
-- 2º PASSO B: ATUALIZAÇÃO DO ENDEREÇO DE ANA OLIVEIRA
-- ============================================================

UPDATE pacientes
SET rua = 'Avenida Vital Brasil',
    numero = '789',
    cep = '18603-190'
WHERE nome = 'Ana Oliveira'
  AND cpf = '111.222.333-44';

-- Conferir os pacientes após a atualização
SELECT * FROM pacientes;


-- ============================================================
-- 3º PASSO A: EXCLUSÃO DO AGENDAMENTO DE RICARDO MENDES
-- COM A DRA. SOFIA ALMEIDA
-- ============================================================

DELETE FROM agendamentos
WHERE id_medico = 2
  AND id_paciente = 3;

-- Conferir os agendamentos após a exclusão
SELECT * FROM agendamentos;


-- ============================================================
-- 3º PASSO B: EXCLUSÃO DO PACIENTE RICARDO MENDES
-- ============================================================

DELETE FROM pacientes
WHERE nome = 'Ricardo Mendes'
  AND cpf = '777.888.999-00';

-- Conferir os pacientes após a exclusão
SELECT * FROM pacientes;


-- ============================================================
-- CONSULTA FINAL: CONFERIR TODAS AS TABELAS
-- ============================================================

SELECT * FROM medicos;
SELECT * FROM pacientes;
SELECT * FROM agendamentos;

-- ============================================================
-- FIM DO SCRIPT
-- ============================================================
