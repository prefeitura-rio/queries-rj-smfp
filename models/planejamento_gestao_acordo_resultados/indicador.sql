SELECT
    SAFE_CAST(metaID AS STRING) as id_meta,
    SAFE_CAST(ano AS INT64) as ano,
    SAFE_CAST(mes AS INT64) as mes,
    SAFE_CAST(valorRealizado AS FLOAT64) as valor
FROM `planejamento_gestao_acordo_resultados_staging.indicador`