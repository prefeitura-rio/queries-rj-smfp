SELECT 
    SAFE_CAST(SIGLA AS STRING) AS sigla,
    SAFE_CAST(NOME AS STRING) AS nome,
FROM nan.administracao_recursos_humanos_ergon_staging.orgaos_regime_juridico AS t