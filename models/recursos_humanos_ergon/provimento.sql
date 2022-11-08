SELECT 
    SAFE_CAST(REGEXP_REPLACE(numfunc, r'\.0$', '') AS STRING) AS id_funcionario,
    SAFE_CAST(REGEXP_REPLACE(numvinc, r'\.0$', '') AS STRING) AS id_vinculo,
    SAFE_CAST(dtini AS DATE) AS data_inicio,
    SAFE_CAST(dtfim AS DATE) AS data_fim,
    SAFE_CAST(REGEXP_REPLACE(setor, r'\.0$', '') AS STRING) AS id_setor,
    SAFE_CAST(REGEXP_REPLACE(cargo, r'\.0$', '') AS STRING) AS id_cargo,
    SAFE_CAST(REGEXP_REPLACE(referencia, r'\.0$', '') AS STRING) AS id_referencia,
    SAFE_CAST(REGEXP_REPLACE(jornada, r'\.0$', '') AS STRING) AS id_jornada,
    SAFE_CAST(formaprov AS STRING) AS forma,
    SAFE_CAST(obs AS STRING) AS observacoes,
    SAFE_CAST(flex_campo_03 AS STRING) AS regime_horas,
    SAFE_CAST(emp_codigo AS STRING) AS empresa_vinculo,
FROM rj-smfp.recursos_humanos_ergon_staging.provimento AS t