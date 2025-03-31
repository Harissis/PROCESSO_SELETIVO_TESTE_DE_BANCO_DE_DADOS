-- =============================================
-- CONFIGURAÇÃO INICIAL
-- =============================================
USE ans_dados_abertos;
SET GLOBAL local_infile = 1;
SET SQL_SAFE_UPDATES = 0; -- Desativa modo seguro temporariamente

-- =============================================
-- CRIAÇÃO DAS TABELAS
-- =============================================
-- Tabela para dados financeiros

CREATE TABLE dados_financeiros (
    DATA DATE,
    REG_ANS VARCHAR(20),
    CD_CONTA_CONTABIL VARCHAR(50),
    DESCRICAO TEXT,
    VL_SALDO_INICIAL DECIMAL(20,2),
    VL_SALDO_FINAL DECIMAL(20,2),
    PERIODO VARCHAR(10),
    INDEX (PERIODO),
    INDEX (REG_ANS)
);

-- Tabela para operadoras (já ajustada conforme seu CSV)

CREATE TABLE operadoras (
    registro_ans VARCHAR(20),
    cnpj VARCHAR(18),
    razao_social VARCHAR(255),
    nome_fantasia VARCHAR(255),
    modalidade VARCHAR(100),
    logradouro VARCHAR(255),
    numero VARCHAR(20),
    complemento VARCHAR(100),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    uf CHAR(2),
    cep VARCHAR(10),
    ddd VARCHAR(2),
    telefone VARCHAR(20),
    fax VARCHAR(20),
    email VARCHAR(100),
    representante VARCHAR(255),
    cargo_representante VARCHAR(100),
    regiao_comercializacao VARCHAR(100),
    data_registro_ans DATE,
    INDEX (registro_ans),
    INDEX (nome_fantasia)
);

-- =============================================
-- FUNÇÃO PARA CONVERSÃO DE VALORES
-- =============================================
DELIMITER //
CREATE FUNCTION converter_valor(valor VARCHAR(100)) RETURNS DECIMAL(20,2)
DETERMINISTIC
BEGIN
    DECLARE resultado DECIMAL(20,2);
    SET valor = REPLACE(REPLACE(valor, '.', ''), ',', '.');
    SET resultado = IF(valor = '' OR valor IS NULL, 0.00, CAST(valor AS DECIMAL(20,2)));
    RETURN resultado;
END //
DELIMITER ;

-- =============================================
-- IMPORTAÇÃO DOS DADOS FINANCEIROS (2023)
-- =============================================

-- 1º Trimestre 2023
LOAD DATA LOCAL INFILE 'C:\\xampp\\mysql\\data\\extracoes\\1T2023.csv'
INTO TABLE dados_financeiros
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(DATA, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, @vl_inicial, @vl_final)
SET 
    VL_SALDO_INICIAL = converter_valor(@vl_inicial),
    VL_SALDO_FINAL = converter_valor(@vl_final),
    PERIODO = '1T2023';

-- 2º Trimestre 2023
LOAD DATA LOCAL INFILE 'C:\\xampp\\mysql\\data\\extracoes\\2T2023.csv'
INTO TABLE dados_financeiros
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(DATA, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, @vl_inicial, @vl_final)
SET 
    VL_SALDO_INICIAL = converter_valor(@vl_inicial),
    VL_SALDO_FINAL = converter_valor(@vl_final),
    PERIODO = '2T2023';

-- 3º Trimestre 2023
LOAD DATA LOCAL INFILE 'C:\\xampp\\mysql\\data\\extracoes\\3T2023.csv'
INTO TABLE dados_financeiros
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(DATA, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, @vl_inicial, @vl_final)
SET 
    VL_SALDO_INICIAL = converter_valor(@vl_inicial),
    VL_SALDO_FINAL = converter_valor(@vl_final),
    PERIODO = '3T2023';

-- 4º Trimestre 2023
LOAD DATA LOCAL INFILE 'C:\\xampp\\mysql\\data\\extracoes\\4T2023.csv'
INTO TABLE dados_financeiros
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(DATA, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, @vl_inicial, @vl_final)
SET 
    VL_SALDO_INICIAL = converter_valor(@vl_inicial),
    VL_SALDO_FINAL = converter_valor(@vl_final),
    PERIODO = '4T2023';

-- =============================================
-- IMPORTAÇÃO DOS DADOS FINANCEIROS (2024)
-- =============================================

-- 1º Trimestre 2024
LOAD DATA LOCAL INFILE 'C:\\xampp\\mysql\\data\\extracoes\\1T2024.csv'
INTO TABLE dados_financeiros
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(DATA, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, @vl_inicial, @vl_final)
SET 
    VL_SALDO_INICIAL = converter_valor(@vl_inicial),
    VL_SALDO_FINAL = converter_valor(@vl_final),
    PERIODO = '1T2024';

-- 2º Trimestre 2024
LOAD DATA LOCAL INFILE 'C:\\xampp\\mysql\\data\\extracoes\\2T2024.csv'
INTO TABLE dados_financeiros
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(DATA, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, @vl_inicial, @vl_final)
SET 
    VL_SALDO_INICIAL = converter_valor(@vl_inicial),
    VL_SALDO_FINAL = converter_valor(@vl_final),
    PERIODO = '2T2024';

-- 3º Trimestre 2024
LOAD DATA LOCAL INFILE 'C:\\xampp\\mysql\\data\\extracoes\\3T2024.csv'
INTO TABLE dados_financeiros
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(DATA, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, @vl_inicial, @vl_final)
SET 
    VL_SALDO_INICIAL = converter_valor(@vl_inicial),
    VL_SALDO_FINAL = converter_valor(@vl_final),
    PERIODO = '3T2024';

-- 4º Trimestre 2024
LOAD DATA LOCAL INFILE 'C:\\xampp\\mysql\\data\\extracoes\\4T2024.csv'
INTO TABLE dados_financeiros
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(DATA, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, @vl_inicial, @vl_final)
SET 
    VL_SALDO_INICIAL = converter_valor(@vl_inicial),
    VL_SALDO_FINAL = converter_valor(@vl_final),
    PERIODO = '4T2024';

-- =============================================
-- IMPORTAÇÃO DOS DADOS CADASTRAIS
-- =============================================
LOAD DATA LOCAL INFILE 'C:/xampp/mysql/data/extracoes/Relatorio_cadop.csv'
INTO TABLE operadoras
CHARACTER SET latin1  -- Alterado para latin1 que é mais compatível
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'  -- Apenas \n (sem \r)
IGNORE 1 LINES
(registro_ans, cnpj, razao_social, @nome_fantasia, modalidade, 
 logradouro, numero, complemento, bairro, cidade, uf, cep, ddd,
 telefone, fax, email, representante, cargo_representante, 
 regiao_comercializacao, @data_registro)
SET 
    nome_fantasia = NULLIF(@nome_fantasia, ''),
    data_registro_ans = CASE 
        WHEN @data_registro REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$' THEN STR_TO_DATE(@data_registro, '%Y-%m-%d')
        WHEN @data_registro REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{4}$' THEN STR_TO_DATE(@data_registro, '%d/%m/%Y')
        ELSE NULL
    END;

-- =============================================
-- VERIFICAÇÕES FINAIS
-- =============================================
-- Verifica períodos importados
SELECT 
    PERIODO,
    COUNT(*) AS total_registros,
    MIN(DATA) AS data_inicial,
    MAX(DATA) AS data_final
FROM dados_financeiros
GROUP BY PERIODO
ORDER BY PERIODO;

-- Verifica operadoras importadas
SELECT COUNT(*) AS total_operadoras FROM operadoras;
SELECT COUNT(*) AS sem_nome_fantasia FROM operadoras WHERE nome_fantasia IS NULL OR nome_fantasia = '';

-- Ativa modo seguro novamente
SET SQL_SAFE_UPDATES = 1;

-- =============================================
-- QUERY ANALÍTICA FINAL
-- =============================================
-- =============================================
-- QUERY 1: TOP 10 OPERADORAS - ÚLTIMO TRIMESTRE
-- Atende ao requisito: "10 operadoras com maiores despesas em EVENTOS/SINISTROS..."
-- no último trimestre disponível
-- =============================================
SELECT 
    COALESCE(o.nome_fantasia, o.razao_social) AS operadora,
    ROUND(SUM(f.VL_SALDO_FINAL), 2) AS total_despesas,
    (SELECT MAX(PERIODO) FROM dados_financeiros) AS periodo_referencia
FROM dados_financeiros f
JOIN operadoras o ON f.REG_ANS = o.registro_ans
WHERE 
    -- Filtro que abrange todas as variações possíveis da descrição
    (f.DESCRICAO LIKE '%EVENTOS/SINISTROS CONHECIDOS OU AVISADOS%' OR
     f.DESCRICAO LIKE '%ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR%' OR
     f.DESCRICAO LIKE '%SINISTROS CONHECIDOS%')
    -- Sempre pega o último trimestre dinamicamente
    AND f.PERIODO = (SELECT MAX(PERIODO) FROM dados_financeiros)
GROUP BY operadora
ORDER BY total_despesas DESC
LIMIT 10;

-- =============================================
-- QUERY 2: TOP 10 OPERADORAS - ÚLTIMO ANO
-- Atende ao requisito: "10 operadoras com maiores despesas nessa categoria no último ano"
-- Utiliza tabela temporária para melhor performance com grandes volumes de dados
-- =============================================

-- Criação da tabela temporária para processamento intermediário
CREATE TEMPORARY TABLE IF NOT EXISTS temp_sinistros_anual AS
SELECT 
    REG_ANS, 
    SUM(VL_SALDO_FINAL) AS total_sinistro
FROM dados_financeiros
WHERE 
    -- Mesmo critério de filtro da Query 1 para consistência
    (DESCRICAO LIKE '%EVENTOS/SINISTROS CONHECIDOS OU AVISADOS%' OR
     DESCRICAO LIKE '%ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR%' OR
     DESCRICAO LIKE '%SINISTROS CONHECIDOS%')
    -- Filtro por ano (substitua 2024 pelo ano atual se necessário)
    AND PERIODO LIKE '%2024'
GROUP BY REG_ANS;

-- Consulta final agregando os nomes das operadoras
SELECT 
    COALESCE(o.nome_fantasia, o.razao_social) AS operadora,
    ROUND(t.total_sinistro, 2) AS total_despesas_anual,
    '2024' AS ano_referencia  -- Atualize para o ano correto
FROM temp_sinistros_anual t
JOIN operadoras o ON t.REG_ANS = o.registro_ans
ORDER BY total_despesas_anual DESC
LIMIT 10;

