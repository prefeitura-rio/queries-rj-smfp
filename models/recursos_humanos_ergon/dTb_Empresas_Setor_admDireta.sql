SELECT
    SAFE_CAST(s.id_empresa AS INT64) id_empresa,
    SAFE_CAST(s.id_secretaria AS INT64) id_secretaria,
    SAFE_CAST(s.id_setor AS INT64) id_setor,
    SAFE_CAST(s1.sigla AS STRING) sigla,
    SAFE_CAST(de.MACRO_CATEGORIA AS STRING) MACRO_CATEGORIA,
    SAFE_CAST(de.entes_administrativos AS STRING) entes_administrativos
FROM rj-smfp.recursos_humanos_ergon.setor s
JOIN rj-smfp.recursos_humanos_ergon.dTb_empresas de 
    ON CAST(s.id_empresa AS INT64) = CAST(de.empresa AS INT64)
JOIN rj-smfp.recursos_humanos_ergon.setor s1
    ON s.id_secretaria = s1.id_setor
    AND CAST(s.id_empresa AS INT64) = CAST(s1.id_empresa AS INT64)
    AND CAST(s1.id_empresa AS INT64) = CAST(de.empresa AS INT64)
WHERE (s.data_fim IS NULL OR s.data_fim >= '2021-01-01')
    AND (s1.data_fim IS NULL OR s1.data_fim >= '2021-01-01')
    AND s.id_empresa = '1'