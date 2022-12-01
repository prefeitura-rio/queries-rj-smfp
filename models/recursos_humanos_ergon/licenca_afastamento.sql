SELECT 
    SAFE_CAST(REGEXP_REPLACE(TRIM(numfunc), r'\.0$', '') AS STRING) AS id_funcionario,
    SAFE_CAST(REGEXP_REPLACE(TRIM(numvinc), r'\.0$', '') AS STRING) AS id_vinculo,
    SAFE_CAST(TRIM(dtini) AS STRING) AS data_inicio,
    SAFE_CAST(TRIM(dtfim) AS STRING) AS data_final,
    SAFE_CAST(TRIM(tipofreq) AS STRING) AS tipo_afastamento,
    SAFE_CAST(REGEXP_REPLACE(TRIM(codfreq), r'\.0$', '') AS STRING) AS id_afastamento,
    SAFE_CAST(TRIM(motivo) AS STRING) AS motivo,
    SAFE_CAST(TRIM(dtprevfim) AS STRING) AS data_previsao_retorno,
    SAFE_CAST(TRIM(flex_campo_01) AS STRING) AS parecer,
    SAFE_CAST(TRIM(flex_campo_02) AS STRING) AS data_atendimento,
    SAFE_CAST(REGEXP_REPLACE(TRIM(emp_codigo), r'\.0$', '') AS STRING) AS id_empresa,
    SAFE_CAST(TRIM(flex_campo_07) AS STRING) AS crm,
FROM rj-smfp.recursos_humanos_ergon_staging.licenca_afastamento AS t