SELECT
    SAFE_CAST(ano AS INT64)	as ano,
    SAFE_CAST(orgao AS STRING) as orgao,
    SAFE_CAST(orgaoegpweb AS STRING) as orgaoegpweb,
    SAFE_CAST(tipo_acordo AS STRING) as tipo_acordo,
    data_publicacao as publicacao,
    SAFE_CAST(data_assinatura AS DATE) as assinatura,
    SAFE_CAST(data_resultado AS DATE FORMAT 'DD/MM/YYYY') as resultado,
    SAFE_CAST(bateu_acordo AS BOOL) as cumpriu_acordo,
    SAFE_CAST(REPLACE(nota_final, ",", ".") AS FLOAT64) as nota_final,
    SAFE_CAST(bonus_final AS FLOAT64) as bonus_final,
    SAFE_CAST(valor_estimado_bonus AS FLOAT64) valor_estimado_bonus
FROM `planejamento_gestao_acordo_resultados_staging.acordo_resultado`