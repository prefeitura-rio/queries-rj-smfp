SELECT
    SAFE_CAST(ano AS INT64) as ano,
    SAFE_CAST(orgao AS STRING) as orgao,
    SAFE_CAST(REPLACE(estimativa, ',', '.') AS FLOAT64) as estimativa_premiacao,
    SAFE_CAST(anofolha AS INT64) as ano_referencia,
    SAFE_CAST(dataestimativa AS DATE FORMAT 'DD/MM/YYYY') as data_estimativa
FROM `rj-smfp.planejamento_gestao_acordo_resultados_staging.estimativa_premiacao`