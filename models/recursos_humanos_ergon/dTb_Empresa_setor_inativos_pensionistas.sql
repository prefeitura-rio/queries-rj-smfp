SELECT
    SAFE_CAST(id_empresa AS INT64) AS id_empresa,
    SAFE_CAST(id_secretaria AS INT64) AS id_secretaria,
    SAFE_CAST(id_setor AS INT64) AS id_setor,
    SAFE_CAST(sigla AS STRING) AS sigla
FROM rj-smfp.recursos_humanos_ergon.setor AS t
WHERE
  id_empresa IN ( '2', '4' ) AND
  data_particao < CURRENT_DATE('America/Sao_Paulo')

