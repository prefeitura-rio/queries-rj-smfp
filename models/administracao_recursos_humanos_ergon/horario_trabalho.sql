SELECT 
    SAFE_CAST(REGEXP_REPLACE(CODIGO, r'\.0$', '') AS STRING) AS id_horario,
    SAFE_CAST(DESCRICAO AS STRING) AS descricao,
    SAFE_CAST(PONTLEI AS STRING) AS publicacao_diario_oficial,
    SAFE_CAST(CARGA_HR_MES AS STRING) AS carga_horaria_mes,
    SAFE_CAST(CARGA_HR_SEMANA AS STRING) AS carga_horaria_semana,
    SAFE_CAST(CARGA_HR_DIA AS STRING) AS carga_horaria_dia,
    SAFE_CAST(REGEXP_REPLACE(ID_REG, r'\.0$', '') AS STRING) AS id_registro,
FROM rj-smfp.administracao_recursos_humanos_ergon_staging.horario_trabalho AS t