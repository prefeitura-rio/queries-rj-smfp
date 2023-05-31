SELECT
    SAFE_CAST(s.id_empresa AS INT64) id_empresa,
    safe_cast (s.id_secretaria AS INT64) id_secretaria,
    safe_cast (s.id_setor AS INT64) id_setor,
    SAFE_CAST(s1.sigla AS STRING) sigla,
    SAFE_CAST(de.entes_administrativos AS STRING) entes_administrativos
FROM rj-smfp.recursos_humanos_ergon.setor s
JOIN rj-smfp.recursos_humanos_ergon.dTb_empresas de
    ON s.id_empresa = CAST(de.empresa AS STRING)
JOIN rj-smfp.recursos_humanos_ergon.setor s1
    ON s.id_secretaria = s1.id_setor
    AND s.id_empresa = s1.id_empresa
    AND s1.id_empresa = CAST(de.empresa AS STRING)
WHERE (s.data_fim IS NULL OR s.data_fim >= '2021-01-01')
    AND (s1.data_fim IS NULL OR s1.data_fim >= '2021-01-01')