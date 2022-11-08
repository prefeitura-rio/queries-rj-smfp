SELECT 
    SAFE_CAST(REGEXP_REPLACE(numfunc, r'\.0$', '') AS STRING) AS id_funcionario,
    SAFE_CAST(REGEXP_REPLACE(matric, r'\.0$', '') AS STRING) AS id_matricula,
FROM rj-smfp.recursos_humanos_ergon_staging.matricula AS t