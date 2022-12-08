SELECT
    SAFE_CAST(ano AS INT64)	as ano,
    SAFE_CAST(orgao AS STRING) as orgao,
    SAFE_CAST(orgaoegpweb AS STRING) as orgao_egpweb,
    SAFE_CAST(tipo_acordo AS STRING) as tipo_acordo,
    SAFE_CAST(SAFE_CAST(data_publicacao AS STRING) AS DATE FORMAT 'DD/MM/YYYY') as data_publicacao,
    SAFE_CAST(data_assinatura AS DATE) as data_assinatura,
    SAFE_CAST(data_resultado AS DATE FORMAT 'DD/MM/YYYY') as data_resultado,
    CASE
        WHEN bateu_acordo = "TRUE" THEN TRUE
        WHEN bateu_acordo = "FALSE" THEN FALSE 
        WHEN bateu_acordo = "VERDADEIRO" THEN TRUE
        WHEN bateu_acordo = "FALSO" THEN FALSE
        ELSE NULL         
    END as indicador_cumprimento_acordo,
    SAFE_CAST(REPLACE(nota_final, ",", ".") AS FLOAT64) as nota_final,
    SAFE_CAST(bonus_final AS FLOAT64) as bonus_final,
    SAFE_CAST(valor_estimado_bonus AS FLOAT64) valor_estimado_bonus
FROM `rj-smfp.planejamento_gestao_acordo_resultados_staging.acordo_resultado`