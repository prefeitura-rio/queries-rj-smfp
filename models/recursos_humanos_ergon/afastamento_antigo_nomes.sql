SELECT 
    SAFE_CAST(REGEXP_REPLACE(TRIM(emp_codigo), r'\.0$', '') AS STRING) AS id_empresa,
    SAFE_CAST(REGEXP_REPLACE(TRIM(afast_cod), r'\.0$', '') AS STRING) AS id_afastamento,
    SAFE_CAST(TRIM(afast_descr) AS STRING) AS nome_afastamento,
FROM rj-smfp.recursos_humanos_ergon_staging.afastamento_antigo_nomes AS t