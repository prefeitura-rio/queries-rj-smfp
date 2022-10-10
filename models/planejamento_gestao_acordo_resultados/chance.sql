SELECT
    SAFE_CAST(chaveCamada AS STRING) as id_camada,
    SAFE_CAST(camadaMetaEnum AS STRING) as indice_camada,
    SAFE_CAST(ano AS INT64) as ano,
    SAFE_CAST(mes AS INT64) as mes,
    SAFE_CAST(corChance AS STRING) as cor_chance
FROM `planejamento_gestao_acordo_resultados_staging.chance`