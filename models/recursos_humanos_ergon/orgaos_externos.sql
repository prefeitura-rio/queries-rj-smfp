SELECT 
    SAFE_CAST(orgao AS STRING) AS nome,
    SAFE_CAST(descr AS STRING) AS nome_completo,
    SAFE_CAST(tipo_orgao AS STRING) AS tipo,
FROM rj-smfp.recursos_humanos_ergon_staging.orgaos_externos AS t