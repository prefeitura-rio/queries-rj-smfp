  with pe_percentual AS (
  SELECT
    origem,
    id_meta_secretaria,
    tipo_meta,
    data_valor,
    CASE 
    WHEN IS_NAN(valor) THEN NULL
    ELSE valor 
    END valor 
  FROM {{ ref('pe_porcentagem') }}
  ORDER BY id_meta_secretaria, data_valor
  )

  , ar_percentual AS (
    SELECT DISTINCT 
    origem,
    id_meta,
    ar_unidade_medida,
    data_valor,
    ROUND(valor/100,4) as valor
    FROM {{ ref('ar_valores') }}
    WHERE ar_unidade_medida = 'Percentual'
  )
  
  , todos_percentual AS (
  SELECT
    origem,
    id_meta_secretaria as id_meta,
    tipo_meta,
    data_valor,
    valor
  FROM pe_percentual
  
  UNION ALL

  SELECT
    origem,
    id_meta,
    ar_unidade_medida as tipo_meta,
    data_valor,
    valor
  FROM ar_percentual)

  SELECT 
    tv.*,
    td.id_detalhamento,
    td.dashboard_detalhamento_objetivo,
    td.dashboard_descricao,
    td.dashboard_resumo
  FROM todos_percentual as tv
  LEFT JOIN {{ ref('todos_detalhes') }} as td
    ON tv.id_meta = td.id_meta_principal
  ORDER BY origem, id_meta, data_valor