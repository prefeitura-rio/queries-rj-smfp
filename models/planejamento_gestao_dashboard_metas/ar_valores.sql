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
    CASE WHEN ch.cor_chance = "1" then "Indefinida" 
      WHEN ch.cor_chance = "2" then "Não cumprida"
      WHEN ch.cor_chance = "3" then "Atraso grave"
      WHEN ch.cor_chance = "4" then "Atraso Recuperável"
      WHEN ch.cor_chance = "5" then "Andamento Satisfatório"
      else "Sem informações/Não se aplica" END
      as ar_tendencia,
    com.comentario as comentario,
    CONCAT(i.ano, "-", LPAD(CAST(i.mes AS STRING), 2, "0"), ": ", com.comentario) as comentario_datado
  FROM `rj-smfp.planejamento_gestao_acordo_resultados.indicador` as i
  FULL JOIN `rj-smfp.planejamento_gestao_acordo_resultados.nota_meta` as nm
    ON i.id_meta = nm.id_meta AND i.ano = nm.ano AND i.mes = nm.mes
  LEFT JOIN `rj-smfp.planejamento_gestao_acordo_resultados.comentario` as com
    ON i.id_meta = com.id_camada AND i.ano = com.ano AND i.mes = com.mes
  LEFT JOIN `rj-smfp.planejamento_gestao_acordo_resultados.chance` as ch
    ON i.id_meta = ch.id_camada AND i.ano = ch.ano AND i.mes = ch.mes  
  ORDER BY i.id_meta, ano, mes
)

SELECT * FROM ar_valores