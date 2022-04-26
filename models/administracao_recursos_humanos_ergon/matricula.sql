SELECT 
    SAFE_CAST(REGEXP_REPLACE(NUMFUNC, r'\.0$', '') AS STRING) AS id_funcionario,
    SAFE_CAST(REGEXP_REPLACE(MATRIC, r'\.0$', '') AS STRING) AS id_matricula,
FROM rj-smfp.administracao_recursos_humanos_ergon_staging.matricula AS t