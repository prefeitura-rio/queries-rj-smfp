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

  SELECT * FROM todos_textual
  ORDER BY origem, id_meta, data_valor