SELECT 
    SAFE_CAST(sigla AS STRING) AS sigla,
    SAFE_CAST(nome AS STRING) AS nome,
    SAFE_CAST(inativo AS STRING) AS inativo,
    SAFE_CAST(primeiro_prov AS STRING) AS primeiro_provimento,
    SAFE_CAST(ativo AS STRING) AS ativo,
FROM rj-smfp.recursos_humanos_ergon_staging.forma_provimento AS t