SELECT 
    SAFE_CAST(ORGAO AS STRING) AS nome,
    SAFE_CAST(DESCR AS STRING) AS nome_completo,
    SAFE_CAST(TIPO_ORGAO AS STRING) AS tipo,
FROM rj-smfp.administracao_recursos_humanos_ergon_staging.orgaos_externos AS t