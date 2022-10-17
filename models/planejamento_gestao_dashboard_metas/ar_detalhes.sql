with ar_valores as (
  SELECT 
    i.id_meta,
    "Acordo de Resultados" as origem,
    i.ano,
    i.mes,
    SAFE_CAST(CONCAT(i.ano, "-", LPAD(CAST(i.mes AS STRING), 2, "0")) AS DATE FORMAT "YYYY-MM") data_valor,
    i.valor,
    nm.valor as nota,
    ch.cor_chance as chance_cor,
    CASE  
      WHEN ch.cor_chance = "1" then "Indefinida" 
      WHEN ch.cor_chance = "2" then "Não cumprida"
      WHEN ch.cor_chance = "3" then "Atraso grave"
      WHEN ch.cor_chance = "4" then "Atraso Recuperável"
      WHEN ch.cor_chance = "5" then "Andamento Satisfatório"
      WHEN ch.cor_chance = "6" then "Cumprida"
      else "Sem informações/Não se aplica" END
      as tendencia_ar,
    CASE  
      WHEN ch.cor_chance = "1" then 3
      WHEN ch.cor_chance = "2" then 1
      WHEN ch.cor_chance = "3" then 4
      WHEN ch.cor_chance = "4" then 5
      WHEN ch.cor_chance = "5" then 6
      WHEN ch.cor_chance = "6" then 8
      else 7 END
      as tendencia_numero_ar,
    com.id_camada as ordem_comentario,
    com.comentario as comentario,
    CONCAT(i.ano, "-", LPAD(CAST(i.mes AS STRING), 2, "0"), ": ", com.comentario) as comentario_datado
  FROM `rj-smfp.planejamento_gestao_acordo_resultados.indicador` as i
  FULL JOIN `rj-smfp.planejamento_gestao_acordo_resultados.nota_meta` as nm
    ON i.id_meta = nm.id_meta AND i.ano = nm.ano AND i.mes = nm.mes
  FULL JOIN (SELECT * FROM `rj-smfp.planejamento_gestao_acordo_resultados.comentario`) as com
    ON i.id_meta = com.id_camada AND i.ano = com.ano AND i.mes = com.mes
  FULL JOIN (SELECT * FROM `rj-smfp.planejamento_gestao_acordo_resultados.chance` WHERE indice_camada = "1") as ch
    ON i.id_meta = ch.id_camada AND i.ano = ch.ano AND i.mes = ch.mes
  ORDER BY i.id_meta, ano, mes
)

, ar_tendencia_1 AS (
  SELECT DISTINCT
    ar.origem,
    ar.id_meta,
    ar.tendencia_numero_ar,
    ar.tendencia_ar,
    ar.data_valor as ar_data_referencia_ultimo_resultado,
    ar.valor as ar_ultimo_resultado
  FROM ar_valores as ar
  INNER JOIN (SELECT id_meta, MAX(data_valor) data_valor FROM ar_valores WHERE data_valor <= CURRENT_DATE() GROUP BY id_meta) as max_date
    ON ar.id_meta = max_date.id_meta AND ar.data_valor = max_date.data_valor
  ORDER BY id_meta
)

, ar_detalhes as (
  SELECT 
  meta.id_meta,
  CASE 
    WHEN arp.codigo_metaar IS NULL THEN meta.id_meta 
    ELSE arp.codigo_metaar 
    END id_meta_mae,
  "Acordo de Resultados" origem,
  CASE 
    WHEN arp.orgao_resp IS NULL AND CONTAINS_SUBSTR(meta.sigla_orgao, "/") THEN meta.sigla_orgao 
    ELSE arp.orgao_resp 
    END orgao_sigla,
  `rj-smfp.planejamento_gestao_dashboard_metas_staging`.tradutor_unidade_medida(meta.unidade_medida) ar_unidade_medida,
  meta.orgao,
  arp.descricao_meta_ar_2022 as descricao_planilha,
  meta.descricao,
  meta.observacao,
  meta.ordem,
  meta.referencia,
  meta.data_referencia,
  meta.ano,
  meta.fonte,
  meta.formula,
  meta.tipo_acompanhamento,
  meta.tipo_gestao,
  meta.unidade_medida,
  meta.numero_meta_mae,
  meta.area_resultado,
  meta.tipo,
  meta.indicador_recurso,
  meta.indicador_auditoria,
  meta.janeiro,
  meta.fevereiro,
  meta.marco,
  meta.abril,
  meta.maio,
  meta.junho,
  meta.julho,
  meta.agosto,
  meta.setembro,
  meta.outubro,
  meta.novembro,
  meta.dezembro
  FROM `rj-smfp.planejamento_gestao_acordo_resultados.meta` as meta
  LEFT JOIN (SELECT * FROM `rj-smfp.planejamento_gestao_dashboard_metas_staging.metas_acordo_resultados_planilha`) as arp
    ON meta.id_meta = CAST(CAST(arp.codigo_egpweb AS FLOAT64) AS STRING)
  WHERE meta.ano = 2022
)

, info_tendencia as (
SELECT 
  art1.origem,
  ard.orgao_sigla,
  ard.id_meta,
  ard.id_meta_mae,
  ar_data_referencia_ultimo_resultado,
  ar_ultimo_resultado,
  art1.tendencia_numero_ar,
  art1.tendencia_ar
FROM ar_tendencia_1 art1
INNER JOIN ar_detalhes as ard
  ON art1.id_meta = ard.id_meta)

, tendencia_por_meta_mae as (
  SELECT
    it.id_meta_mae,
    it.tendencia_ar
  FROM info_tendencia as it
  INNER JOIN (SELECT id_meta_mae, MIN(tendencia_numero_ar) pior_numero_ar FROM info_tendencia GROUP BY id_meta_mae) as min_status
    ON it.id_meta_mae = min_status.id_meta_mae AND it.tendencia_numero_ar = min_status.pior_numero_ar
)

, comentarios_sumarizados as (
  SELECT
    id_meta,
    STRING_AGG(comentario_datado, "\n" ORDER BY data_valor DESC, ordem_comentario ASC LIMIT 5) resumo_comentarios
  FROM ar_valores
  GROUP BY id_meta
)

, ar_detalhes_1 as (

SELECT distinct
  CASE 
    WHEN ard.tipo != "Performance" THEN it.ar_data_referencia_ultimo_resultado
    ELSE DATE_TRUNC(CURRENT_DATE(), WEEK(THURSDAY))
    END ar_data_referencia_ultimo_resultado,
  it.ar_ultimo_resultado,
  CASE 
    WHEN it.tendencia_ar IS NULL THEN "Sem informações/Não se aplica"
    ELSE it.tendencia_ar
    END tendencia_ar,
  cs.resumo_comentarios,
  tmm.tendencia_ar as pior_tendencia_meta_mae,
  ard.*
FROM ar_detalhes as ard
LEFT JOIN info_tendencia as it 
  ON ard.id_meta = it.id_meta AND it.id_meta_mae = ard.id_meta_mae
LEFT JOIN comentarios_sumarizados as cs
  ON it.id_meta = cs.id_meta
LEFT JOIN tendencia_por_meta_mae as tmm
  ON ard.id_meta_mae = tmm.id_meta_mae
)

SELECT * FROM ar_detalhes_1 
WHERE id_meta != id_meta_mae --retirando metas que deveriam ter sido excluidas
