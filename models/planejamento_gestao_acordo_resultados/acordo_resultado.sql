SELECT
    SAFE_CAST(ano AS INT64)	as ano,
    SAFE_CAST(orgao AS STRING) as orgao,
    SAFE_CAST(orgaoegpweb AS STRING) as orgao_egpweb,
    SAFE_CAST(tipo_acordo AS STRING) as tipo_acordo,
    SAFE_CAST(data_publicacao AS DATE) as publicacao,
    SAFE_CAST(data_assinatura AS DATE) as assinatura,
    SAFE_CAST(data_resultado AS DATE) as resultado,
    SAFE_CAST(bateu_acordo AS BOOL) as indicador_cumprimento_acordo,
    SAFE_CAST(nota_final AS FLOAT64) as nota_final,
    SAFE_CAST(bonus_final AS FLOAT64) as bonus_final,
    SAFE_CAST(valor_estimado_bonus AS FLOAT64) valor_estimado_bonus
FROM `planejamento_gestao_acordo_resultados_staging.acordo_resultado`