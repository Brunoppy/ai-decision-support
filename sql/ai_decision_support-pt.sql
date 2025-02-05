-- Sistema de Suporte à Decisão Baseado em IA

-- Armazena regras de decisão baseadas em dados da empresa
CREATE TABLE regras_decisao (
    id_regra SERIAL PRIMARY KEY,
    nome_regra VARCHAR(255) NOT NULL,
    descricao TEXT,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Armazena previsões geradas por IA para tomada de decisão
CREATE TABLE previsoes_modelo (
    id_previsao SERIAL PRIMARY KEY,
    id_regra INT REFERENCES regras_decisao(id_regra),
    resultado_previsao TEXT NOT NULL,
    confianca DECIMAL(5,2),
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Armazena recomendações baseadas em previsões de IA
CREATE TABLE recomendacoes (
    id_recomendacao SERIAL PRIMARY KEY,
    id_previsao INT REFERENCES previsoes_modelo(id_previsao),
    acao_sugerida TEXT NOT NULL,
    aplicada BOOLEAN DEFAULT FALSE,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Histórico de decisões tomadas e recomendações aplicadas
CREATE TABLE log_decisoes (
    id_log SERIAL PRIMARY KEY,
    id_recomendacao INT REFERENCES recomendacoes(id_recomendacao),
    decisao_tomada TEXT NOT NULL,
    data_decisao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
