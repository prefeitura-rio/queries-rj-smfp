SELECT 
    SAFE_CAST(sigla AS STRING) AS sigla,
    SAFE_CAST(nome AS STRING) AS nome,
FROM rj-smfp.administracao_recursos_humanos_ergon_staging.orgaos_regime_juridico AS t