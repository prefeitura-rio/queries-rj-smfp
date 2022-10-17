with ar_valores as (
  SELECT 
    i.id_meta,
    "Acordo de Resultados" as origem,
    CASE
      WHEN detalhes.unidade_medida IS NOT NULL THEN `rj-smfp.planejamento_gestao_dashboard_metas_staging`.tradutor_unidade_medida(detalhes.unidade_medida)
      ELSE detalhes.unidade_medida 
      END ar_unidade_medida,
    detalhes.tipo ar_tipo_meta,
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
  INNER JOIN `rj-smfp.planejamento_gestao_dashboard_metas.ar_detalhes` as detalhes
    ON i.id_meta = detalhes.id_meta
  ORDER BY i.id_meta, ano, mes
)

SELECT * FROM ar_valores