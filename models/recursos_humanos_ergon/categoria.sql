SELECT 
    SAFE_CAST(sigla AS STRING) AS sigla,
    SAFE_CAST(nome AS STRING) AS nome,
FROM rj-smfp.recursos_humanos_ergon_staging.categoria AS t