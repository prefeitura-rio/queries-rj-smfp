  with pe_ranking AS (
  SELECT
    origem,
    id_meta_secretaria,
    tipo_meta,
    data_valor,
    valor
  FROM {{ ref('pe_ranking') }}
  ORDER BY id_meta_secretaria, data_valor
  )

  , ar_ranking AS (
    SELECT DISTINCT 
    origem,
    id_meta,
    ar_unidade_medida,
    data_valor,
    valor
    FROM {{ ref('ar_valores') }}
    WHERE ar_unidade_medida = 'Ranking'
  )
  
  , todos_ranking AS (
  SELECT
    origem,
    id_meta_secretaria as id_meta,
    tipo_meta,
    data_valor,
    valor
  FROM pe_ranking
  
  UNION ALL

  SELECT
    origem,
    id_meta,
    ar_unidade_medida as tipo_meta,
    data_valor,
    valor
  FROM ar_ranking)

  SELECT 
    tv.*,
    td.id_detalhamento,
    td.dashboard_detalhamento_objetivo,
    td.dashboard_descricao,
    td.dashboard_resumo 
  FROM todos_ranking as tv
  LEFT JOIN {{ ref('todos_detalhes') }} as td
    ON tv.id_meta = td.id_meta_principal
  ORDER BY origem, id_meta, data_valor