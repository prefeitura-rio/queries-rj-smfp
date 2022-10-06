with ar_detalhes as (
  SELECT 
  id_meta,
  "Acordo de Resultados" origem,
  orgao_sigla,
  orgao,
  descricao,
  observacao,
  ordem,
  referencia,
  data_referencia,
  ano,
  fonte,
  formula,
  tipo_acompanhamento,
  tipo_gestao,
  unidade_medida,
  numero_meta_mae,
  area_resultado,
  tipo,
  indicador_recurso,
  indicador_auditoria,
  janeiro,
  fevereiro,
  marco,
  abril,
  maio,
  junho,
  julho,
  agosto,
  setembro,
  outubro,
  novembro,
  dezembro
  FROM `rj-smfp.planejamento_gestao_acordo_resultados.meta`
  CROSS JOIN UNNEST(SPLIT(sigla_orgao, '/')) AS orgao_sigla
  WHERE ano = 2022
)

SELECT * FROM ar_detalhes