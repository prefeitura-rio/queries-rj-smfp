SELECT 
    SAFE_CAST(SIGLA AS STRING) AS sigla,
    SAFE_CAST(NOME AS STRING) AS nome,
    SAFE_CAST(HORASSEM AS STRING) AS horas_semana,
    SAFE_CAST(HORASMEN AS STRING) AS horas_mes,
FROM rj-smfp.administracao_recursos_humanos_ergon_staging.jornada AS t