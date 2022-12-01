SELECT 
    SAFE_CAST(REGEXP_REPLACE(TRIM(numfunc), r'\.0$', '') AS STRING) AS id_funcionario,
    SAFE_CAST(REGEXP_REPLACE(TRIM(numvinc), r'\.0$', '') AS STRING) AS id_vinculo,
    SAFE_CAST(TRIM(dtini) AS STRING) AS data_inicio,
    SAFE_CAST(TRIM(dtfim) AS STRING) AS data_final,
    SAFE_CAST(TRIM(tipofreq) AS STRING) AS tipo_frequencia,
    SAFE_CAST(REGEXP_REPLACE(TRIM(codfreq), r'\.0$', '') AS STRING) AS id_frequencia,
    SAFE_CAST(TRIM(obs) AS STRING) AS observacoes,
    SAFE_CAST(REGEXP_REPLACE(TRIM(emp_codigo), r'\.0$', '') AS STRING) AS id_empresa,
FROM rj-smfp.recursos_humanos_ergon_staging.frequencias AS t