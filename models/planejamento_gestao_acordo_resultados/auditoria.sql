SELECT
    SAFE_CAST(cod_auditoria AS STRING) as id_auditoria,
    SAFE_CAST(ano_base AS INT64) as ano,
    SAFE_CAST(orgao_auditado AS STRING) as orgao,
    SAFE_CAST(cod_meta AS STRING) as codigo_meta,
    SAFE_CAST(orgao_acordo_egpweb AS STRING) as orgao_egpweb,
    SAFE_CAST(relatorio_da_auditoria_geral_rag AS STRING) as rag,
    SAFE_CAST(ordem_de_servico AS STRING) as ordem_servico,
    SAFE_CAST(SAFE_CAST(data_do_inicio_da_auditoria AS STRING) AS DATE FORMAT 'DD/MM/YYYY') as data_inicio_auditoria,
    SAFE_CAST(SAFE_CAST(data_do_final_da_auditoria AS STRING) AS DATE FORMAT 'DD/MM/YYYY') as data_final_auditoria,
    SAFE_CAST(SAFE_CAST(data_do_relatorio AS STRING) AS DATE FORMAT 'DD/MM/YYYY') as data_relatorio,
    SAFE_CAST(meta_auditada AS STRING) as descricao_meta,
    SAFE_CAST(resumo_da_auditoria AS STRING) as resumo_auditoria,
    SAFE_CAST(numero_de_testes AS INT64) as quantidade_testes,
    SAFE_CAST(numero_de_fragilidades AS INT64) as quantidade_fragilidades,
    CASE
        WHEN penalidade = "TRUE" THEN TRUE
        WHEN penalidade = "FALSE" THEN FALSE 
        WHEN penalidade = "VERDADEIRO" THEN TRUE
        WHEN penalidade = "FALSO" THEN FALSE
        ELSE NULL         
    END as indicador_penalidade,
    SAFE_CAST(REPLACE(SAFE_CAST(penalidade_nota AS STRING), ',', '.') AS FLOAT64) as penalidade_nota,
    SAFE_CAST(REPLACE(SAFE_CAST(penalidade_bonus AS STRING), ',', '.') AS FLOAT64) as penalidade_bonus,
    SAFE_CAST(SAFE_CAST(inicio_do_periodo_apurado AS STRING) AS DATE FORMAT 'DD/MM/YYYY') as inicio_periodo_apurado,
    SAFE_CAST(SAFE_CAST(final_do_periodo_apurado AS STRING) AS DATE FORMAT 'DD/MM/YYYY') as final_periodo_apurado,
    SAFE_CAST(numero_de_recomendacoes AS INT64) as quantidade_recomendacoes
FROM `planejamento_gestao_acordo_resultados_staging.auditoria`