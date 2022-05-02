SELECT 
    SAFE_CAST(DATAINI AS DATE) AS data_inicio,
    SAFE_CAST(DATAFIM AS DATE) AS data_fim,
    SAFE_CAST(REGEXP_REPLACE(PAISETOR, r'\.0$', '') AS STRING) AS id_setor_pai,
    SAFE_CAST(REGEXP_REPLACE(SETOR, r'\.0$', '') AS STRING) AS id_setor,
    SAFE_CAST(NOMESETOR AS STRING) AS nome,
    SAFE_CAST(NOMESETORLONGO AS STRING) AS nome_completo,
    SAFE_CAST(FLEX_CAMPO_01 AS STRING) AS sigla,
    SAFE_CAST(REGEXP_REPLACE(EMP_CODIGO, r'\.0$', '') AS STRING) AS id_empresa,
    SAFE_CAST(REGEXP_REPLACE(FLEX_CAMPO_02, r'\.0$', '') AS STRING) AS id_empresa_prevrio,
    SAFE_CAST(REGEXP_REPLACE(FLEX_CAMPO_05, r'\.0$', '') AS STRING) AS id_secretaria,
    SAFE_CAST(EXTINTO AS STRING) AS extinto,
FROM rj-smfp.administracao_recursos_humanos_ergon_staging.setor AS t