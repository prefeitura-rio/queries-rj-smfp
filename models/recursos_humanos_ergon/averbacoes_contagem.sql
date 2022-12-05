SELECT 
    SAFE_CAST(REGEXP_REPLACE(TRIM(numfunc), r'\.0$', '') AS STRING) AS id_funcionario,
    SAFE_CAST(REGEXP_REPLACE(TRIM(numvinc), r'\.0$', '') AS STRING) AS id_vinculo,
    SAFE_CAST(REGEXP_REPLACE(TRIM(chaveaverb), r'\.0$', '') AS STRING) AS id_averbacao,
    SAFE_CAST(TRIM(finalidade) AS STRING) AS finalidade,
    SAFE_CAST(TRIM(dias) AS STRING) AS dias,
FROM rj-smfp.recursos_humanos_ergon_staging.averbacoes_contagem AS t