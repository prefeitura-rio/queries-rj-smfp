SELECT 
    SAFE_CAST(dataini AS DATE) AS data_inicio,
    SAFE_CAST(datafim AS DATE) AS data_fim,
    SAFE_CAST(REGEXP_REPLACE(paisetor, r'\.0$', '') AS STRING) AS id_setor_pai,
    SAFE_CAST(REGEXP_REPLACE(setor, r'\.0$', '') AS STRING) AS id_setor,
    SAFE_CAST(nomesetor AS STRING) AS nome,
    SAFE_CAST(nomesetorlongo AS STRING) AS nome_completo,
    SAFE_CAST(flex_campo_01 AS STRING) AS sigla,
    SAFE_CAST(REGEXP_REPLACE(emp_codigo, r'\.0$', '') AS STRING) AS id_empresa,
    SAFE_CAST(REGEXP_REPLACE(flex_campo_02, r'\.0$', '') AS STRING) AS id_empresa_prevrio,
    SAFE_CAST(REGEXP_REPLACE(flex_campo_05, r'\.0$', '') AS STRING) AS id_secretaria,
    SAFE_CAST(extinto AS STRING) AS extinto,
FROM rj-smfp.recursos_humanos_ergon_staging.setor AS t