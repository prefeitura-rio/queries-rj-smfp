SELECT 
    SAFE_CAST(REGEXP_REPLACE(NUMFUNC, r'\.0$', '') AS STRING) AS id_funcionario,
    SAFE_CAST(REGEXP_REPLACE(NUMVINC, r'\.0$', '') AS STRING) AS id_vinculo,
    SAFE_CAST(DTINI AS DATE) AS data_inicio,
    SAFE_CAST(DTFIM AS DATE) AS data_fim,
    SAFE_CAST(REGEXP_REPLACE(SETOR, r'\.0$', '') AS STRING) AS id_setor,
    SAFE_CAST(REGEXP_REPLACE(CARGO, r'\.0$', '') AS STRING) AS id_cargo,
    SAFE_CAST(REGEXP_REPLACE(REFERENCIA, r'\.0$', '') AS STRING) AS id_referencia,
    SAFE_CAST(REGEXP_REPLACE(JORNADA, r'\.0$', '') AS STRING) AS id_jornada,
    SAFE_CAST(FORMAPROV AS STRING) AS forma,
    SAFE_CAST(OBS AS STRING) AS observacoes,
    SAFE_CAST(FLEX_CAMPO_03 AS STRING) AS regime_horas,
    SAFE_CAST(EMP_CODIGO AS STRING) AS empresa_vinculo,
FROM rj-smfp.administracao_recursos_humanos_ergon_staging.provimento AS t