  with pe_textual AS (
  SELECT
    origem,
    id_meta_secretaria,
    tipo_meta,
    data_valor,
    valor
  FROM {{ ref('pe_textual') }}
  ORDER BY id_meta_secretaria, data_valor
  )

  , ar_textual AS (
    SELECT DISTINCT 
    origem,
    id_meta,
    ar_unidade_medida,
    data_valor,
    CASE
      WHEN valor = 1 THEN "Entregue"
      WHEN valor = 0 THEN "Não Entregue"
      ELSE "Não identificado"
      END valor
    FROM {{ ref('ar_valores') }}
    WHERE ar_unidade_medida = 'Textual' AND data_valor <= CURRENT_DATE()
  )
  
  , todos_textual AS (
  SELECT
    origem,
    id_meta_secretaria as id_meta,
    tipo_meta,
    data_valor,
    valor
  FROM pe_textual
  
  UNION ALL

  SELECT
    origem,
    id_meta,
    ar_unidade_medida as tipo_meta,
    data_valor,
    valor
  FROM ar_textual)

  SELECT 
    tv.*,
    td.id_detalhamento,
    td.dashboard_detalhamento_objetivo,
    td.dashboard_descricao,
    td.dashboard_resumo,
    td.dashboard_tema,
    CASE
      WHEN tv.origem = "Acordo de Resultados" THEN td.dashboard_status_ar
      WHEN tv.origem = "Plano Estratégico" THEN dashboard_status_pe
      ELSE NULL
    END status_detalhamento,
    CASE
      WHEN tv.origem = "Acordo de Resultados" THEN td.dashboard_cor_fonte_ar
      WHEN tv.origem = "Plano Estratégico" THEN td.dashboard_cor_fonte_pe
      ELSE NULL
    END cor_status_detalhamento
  FROM todos_textual as tv
  LEFT JOIN {{ ref('todos_detalhes') }} as td
    ON tv.id_meta = td.id_meta_principal
  ORDER BY origem, id_meta, data_valor