SELECT 
    SAFE_CAST(tipo AS STRING) AS tipo,
    SAFE_CAST(descr AS STRING) AS descricao,
FROM rj-smfp.administracao_recursos_humanos_ergon_staging.tipo_orgao AS t