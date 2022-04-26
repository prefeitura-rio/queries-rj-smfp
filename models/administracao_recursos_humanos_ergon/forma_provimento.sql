SELECT 
    SAFE_CAST(SIGLA AS STRING) AS sigla,
    SAFE_CAST(NOME AS STRING) AS nome,
    SAFE_CAST(INATIVO AS STRING) AS inativo,
    SAFE_CAST(PRIMEIRO_PROV AS STRING) AS primeiro_provimento,
    SAFE_CAST(ATIVO AS STRING) AS ativo,
FROM rj-smfp.administracao_recursos_humanos_ergon_staging.forma_provimento AS t