  with pe_numerico AS (
  SELECT
    origem,
    id_meta_secretaria,
    tipo_meta,
    data_valor,
    valor
  FROM `rj-smfp.planejamento_gestao_dashboard_metas.pe_numerico`
  ORDER BY id_meta_secretaria, data_valor
  )

  , ar_numerico AS (
    SELECT DISTINCT 
    origem,
    id_meta,
    ar_unidade_medida,
    data_valor,
    valor
    FROM `rj-smfp.planejamento_gestao_dashboard_metas.ar_valores`
    WHERE ar_unidade_medida = 'Numérico'
  )
  
  , todos_numerico AS (
  SELECT
    origem,
    id_meta_secretaria as id_meta,
    tipo_meta,
    data_valor,
    valor
  FROM pe_numerico
  
  UNION ALL

  SELECT
    origem,
    id_meta,
    ar_unidade_medida as tipo_meta,
    data_valor,
    valor
  FROM ar_numerico)

  SELECT * FROM todos_numerico
  ORDER BY origem, id_meta, data_valor