SELECT 
    SAFE_CAST(SIGLA AS STRING) AS sigla,
    SAFE_CAST(NOME AS STRING) AS nome,
FROM rj-smfp.administracao_recursos_humanos_ergon_staging.regime_juridico AS t