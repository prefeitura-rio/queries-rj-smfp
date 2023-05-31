SELECT
    SAFE_CAST(id_empresa_setor AS INT64) id_empresa,
    SAFE_CAST(id_setor AS INT64) id_setor,
    'EMPRESA PUBLICA' AS MACRO_CATEGORIA,
    'ADM INDIRETA'AS entes_administrativos
FROM rj-smfp.recursos_humanos_ergon_comlurb.setor AS t
WHERE (data_fim IS NULL OR data_fim >= '2021-01-01')