SELECT 
    SAFE_CAST(TIPO AS STRING) AS tipo,
    SAFE_CAST(DESCR AS STRING) AS descricao,
FROM rj-smfp.administracao_recursos_humanos_ergon_staging.tipo_orgao AS t