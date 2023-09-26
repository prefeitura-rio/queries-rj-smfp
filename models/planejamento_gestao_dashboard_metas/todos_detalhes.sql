WITH ar_com_pe AS (
SELECT 
  chave_meta_pe,
  ard.id_meta as ar_id_meta,
  ard.id_meta_mae,
    CASE 
    WHEN ard.pior_tendencia_meta_mae IS NULL THEN "Sem informações/Não se aplica"
    ELSE ard.pior_tendencia_meta_mae 
    END pior_tendencia_meta_mae,
  ard.ar_data_referencia_ultimo_resultado,
    CASE 
      WHEN ar_unidade_medida = "Numérico" THEN REPLACE(FORMAT("%'d", CAST(ar_ultimo_resultado AS int64)), ",", ".")
      WHEN ar_unidade_medida = "Percentual" THEN REPLACE(CONCAT(FORMAT("%'d", CAST(FLOOR(ar_ultimo_resultado) AS int64)), SUBSTR(FORMAT("%.2f", CAST(ar_ultimo_resultado AS float64)), -3), "%"), ".", ",")
      WHEN ar_unidade_medida = "Textual" AND ar_ultimo_resultado = 1 THEN "Entregue"
      WHEN ar_unidade_medida = "Textual" AND ar_ultimo_resultado != 1 THEN "Não Entregue"
      ELSE SAFE_CAST(ar_ultimo_resultado AS STRING) 
      END AS ar_ultimo_resultado,
  ard.tendencia_ar as ar_tendencia,
  ard.resumo_comentarios as ar_resumo_comentarios,
  ard.origem as ar_origem,
  ard.orgao_sigla as ar_orgao,
  ard.ar_unidade_medida as ar_tipo_meta,
  ard.descricao_planilha as ar_nome_meta,
  CASE 
    WHEN ar_unidade_medida = "Numérico" THEN REPLACE(FORMAT("%'d", CAST(dezembro AS int64)), ",", ".")
    WHEN ar_unidade_medida = "Percentual" THEN REPLACE(CONCAT(FORMAT("%'d", CAST(FLOOR(dezembro) AS int64)), SUBSTR(FORMAT("%.2f", CAST(dezembro AS float64)), -3), "%"), ".", ",")
    WHEN ar_unidade_medida = "Textual" THEN "Meta entregue"
    ELSE SAFE_CAST(dezembro AS STRING)
  END as ar_objetivo_2023,
  ped.id_meta_secretaria as pe_id_meta_secretaria,
  ped.codigo_meta,
  ped.tendencia_pe,
  ped.origem as pe_origem,
  ped.orgao_responsavel as pe_orgao,
  ped.tipo_meta as pe_tipo_meta,
  ped.casas_decimais as pe_casas_decimais,
  ped.valor_meta_final AS pe_objetivo_2024,
  ped._2023 as pe_objetivo_2023,
  ped.ultimo_resultado as pe_ultimo_resultado,
  ped.data_referencia_resultado as pe_data_referencia_ultimo_resultado,
  ped.descricao_meta_desdobrada as pe_nome_meta,
  ped.cor_fonte as pe_cor_fonte,
  ped.pe_tendencia_normalizada as pe_tendencia_meta_desdobrada,
  ped.tema_transversal as pe_tema_transversal,
  ped.meta as pe_descricao_meta,
  ped.comentarios_da_meta as pe_comentarios_da_meta,
  ped.resumo_executivo as pe_resumo_executivo,
  ped.pe_desdobramento_anual_da_meta,
  ped.codigo_meta_desdobrada as pe_codigo_meta_desdobrada,
FROM {{ ref('ar_detalhes') }} as ard
--FROM rj-smfp.planejamento_gestao_dashboard_metas.ar_detalhes as ard
LEFT JOIN (
  SELECT 
    chave_meta_pe,
    MIN(chave_meta_ar_egpweb) chave_meta_ar_egpweb
  FROM `rj-smfp.planejamento_gestao_dashboard_metas_staging.relacao_metas` 
  WHERE relacao_entre_indicadores = '1 - Direta (Mesmo indicador)'
  AND   chave_meta_ar like '2023%'
  GROUP BY chave_meta_pe
  ) as rm
  ON ard.id_meta = rm.chave_meta_ar_egpweb
LEFT JOIN {{ ref('pe_detalhes') }} as ped
--LEFT JOIN rj-smfp.planejamento_gestao_dashboard_metas.pe_detalhes as ped
  ON rm.chave_meta_pe = ped.codigo_meta_desdobrada AND ard.orgao_sigla = ped.orgao_responsavel
ORDER BY pe_tipo_meta DESC
)

, pe_com_ar AS (
  SELECT
    chave_meta_ar_egpweb,
    ped.id_meta_secretaria,
    ped.codigo_meta,
    ped.tendencia_pe,
    ped.origem as pe_origem,
    ped.orgao_responsavel as pe_orgao,
    ped.tipo_meta as pe_tipo_meta,
    ped.casas_decimais as pe_casas_decimais,
    ped.valor_meta_final AS pe_objetivo_2024,
    ped._2023 as pe_objetivo_2023,
    ped.ultimo_resultado as pe_ultimo_resultado,
    ped.data_referencia_resultado as pe_data_referencia_ultimo_resultado,
    ped.descricao_meta_desdobrada as pe_nome_meta,
    ped.cor_fonte as pe_cor_fonte,
    ped.pe_tendencia_normalizada as pe_tendencia_meta_desdobrada,
    ped.meta as pe_descricao_meta,
    ped.tema_transversal as pe_tema_transversal,
    ped.comentarios_da_meta as pe_comentarios_da_meta,
    ped.resumo_executivo as pe_resumo_executivo,
    ped.pe_desdobramento_anual_da_meta,
    ped.codigo_meta_desdobrada as pe_codigo_meta_desdobrada,
    ard.id_meta_mae,
    ard.pior_tendencia_meta_mae,
    ard.ar_data_referencia_ultimo_resultado,
    CASE 
      WHEN ar_unidade_medida = "Numérico" THEN REPLACE(FORMAT("%'d", CAST(ar_ultimo_resultado AS int64)), ",", ".")
      WHEN ar_unidade_medida = "Percentual" THEN REPLACE(CONCAT(FORMAT("%'d", CAST(FLOOR(ar_ultimo_resultado) AS int64)), SUBSTR(FORMAT("%.2f", CAST(ar_ultimo_resultado AS float64)), -3), "%"), ".", ",")
      WHEN ar_unidade_medida = "Textual" AND ar_ultimo_resultado = 1 THEN "Entregue"
      WHEN ar_unidade_medida = "Textual" AND ar_ultimo_resultado != 1 THEN "Não Entregue"
      ELSE SAFE_CAST(ar_ultimo_resultado AS STRING) 
      END AS ar_ultimo_resultado,
    ard.tendencia_ar as ar_tendencia,
    ard.resumo_comentarios as ar_resumo_comentarios,
    ard.origem as ar_origem,
    ard.orgao_sigla as ar_orgao,
    ard.ar_unidade_medida as ar_tipo_meta,
    ard.descricao_planilha as ar_nome_meta,
    CASE 
      WHEN ar_unidade_medida = "Numérico" THEN REPLACE(FORMAT("%'d", CAST(dezembro AS int64)), ",", ".")
      WHEN ar_unidade_medida = "Percentual" THEN REPLACE(CONCAT(FORMAT("%'d", CAST(FLOOR(dezembro) AS int64)), SUBSTR(FORMAT("%.2f", CAST(dezembro AS float64)), -3), "%"), ".", ",")
      WHEN ar_unidade_medida = "Textual" THEN "Meta entregue"
      ELSE SAFE_CAST(dezembro AS STRING)
      END as ar_objetivo_2023
  FROM {{ ref('pe_detalhes') }} as ped
  --FROM rj-smfp.planejamento_gestao_dashboard_metas.pe_detalhes as ped
  LEFT JOIN (
  SELECT 
    chave_meta_pe,
    MIN(chave_meta_ar_egpweb) chave_meta_ar_egpweb
  FROM `rj-smfp.planejamento_gestao_dashboard_metas_staging.relacao_metas` 
  WHERE relacao_entre_indicadores = '1 - Direta (Mesmo indicador)'
  AND   chave_meta_ar like '2023%'
  GROUP BY chave_meta_pe
  ) as rm
  ON rm.chave_meta_pe = ped.codigo_meta_desdobrada
  LEFT JOIN {{ ref('ar_detalhes') }} as ard
  --LEFT JOIN rj-smfp.planejamento_gestao_dashboard_metas.ar_detalhes as ard
  ON rm.chave_meta_ar_egpweb = ard.id_meta AND ard.orgao_sigla = ped.orgao_responsavel
)

, todos_juntos AS (
SELECT
  ar_id_meta                          as id_meta_principal,
  pe_id_meta_secretaria               as id_meta_relacionada,
  id_meta_mae                         as id_meta_mae,
  pior_tendencia_meta_mae             as tendencia_meta_mae,
  ar_origem                           as origem_meta,
  ar_orgao                            as orgao_sigla,
  ar_nome_meta                        as dashboard_nome,
  pe_objetivo_2023                    as dashboard_objetivo_pe,
  ar_objetivo_2023                    as dashboard_objetivo_ar,
  CASE
    WHEN ar_data_referencia_ultimo_resultado IS NULL and pe_data_referencia_ultimo_resultado IS NULL THEN NULL
    WHEN ar_data_referencia_ultimo_resultado IS NULL THEN pe_ultimo_resultado
    WHEN pe_data_referencia_ultimo_resultado IS NULL THEN ar_ultimo_resultado
    WHEN ar_data_referencia_ultimo_resultado > pe_data_referencia_ultimo_resultado 
    THEN ar_ultimo_resultado
    ELSE pe_ultimo_resultado
    END                               as dashboard_ultimo_resultado,
  CASE
    WHEN ar_data_referencia_ultimo_resultado IS NULL and pe_data_referencia_ultimo_resultado IS NULL THEN NULL
    WHEN ar_data_referencia_ultimo_resultado IS NULL THEN pe_data_referencia_ultimo_resultado
    WHEN pe_data_referencia_ultimo_resultado IS NULL THEN ar_data_referencia_ultimo_resultado
    WHEN ar_data_referencia_ultimo_resultado > pe_data_referencia_ultimo_resultado 
    THEN ar_data_referencia_ultimo_resultado
    ELSE pe_data_referencia_ultimo_resultado
    END                               as dashboard_data_referencia_ultimo_resultado,
  pe_tendencia_meta_desdobrada        as dashboard_status_pe,
  ar_tendencia                        as dashboard_status_ar,
  CASE 
    WHEN ar_tendencia = "Cumprida" then "#005A38"
    WHEN ar_tendencia = "Andamento Satisfatório" then "#62C26A"
    WHEN ar_tendencia = "Atraso Recuperável" then "#E9CE56"
    WHEN ar_tendencia = "Cumprida parcialmente" then "#ABAD67" 
    WHEN ar_tendencia = "Atraso grave" then "#E2843C"
    WHEN ar_tendencia = "Não cumprida" then "#BD443F" 
    ELSE "#4F4F4F"
    END                               as dashboard_cor_fonte_ar,
  CASE 
    WHEN pe_tendencia_meta_desdobrada = "Cumprida" then "#005A38"
    WHEN pe_tendencia_meta_desdobrada = "Andamento Satisfatório" then "#62C26A"
    WHEN pe_tendencia_meta_desdobrada = "Atraso Recuperável" then "#E9CE56"
    WHEN pe_tendencia_meta_desdobrada = "Cumprida parcialmente" then "#ABAD67" 
    WHEN pe_tendencia_meta_desdobrada = "Atraso grave" then "#E2843C"
    WHEN pe_tendencia_meta_desdobrada = "Não cumprida" then "#BD443F" 
    ELSE "#4F4F4F"
    END                               as dashboard_cor_fonte_pe,
  ar_nome_meta                        as dashboard_descricao,
  ar_resumo_comentarios               as dashboard_resumo,
  ar_resumo_comentarios               as dashboard_comentarios,
  "ACORDO DE RESULTADOS"              as dashboard_tema,
  ar_objetivo_2023                    as dashboard_detalhamento_objetivo,
  ar_tipo_meta                        as tipo_meta,
  NULL                                as desdobramento_anual_da_meta,
  pe_codigo_meta_desdobrada           as pe_codigo_meta_desdobrada
FROM ar_com_pe

UNION ALL 

SELECT
  id_meta_secretaria                  as id_meta_principal,
  chave_meta_ar_egpweb                as id_meta_relacionada,
  codigo_meta                         as id_meta_mae,
  tendencia_pe                        as tendencia_meta_mae,
  pe_origem                           as origem_meta,
  pe_orgao                            as orgao_sigla,
  pe_nome_meta                        as dashboard_nome,
  pe_objetivo_2023                    as dashboard_objetivo_pe,
  ar_objetivo_2023                    as dashboard_objetivo_ar,
  CASE
    WHEN ar_data_referencia_ultimo_resultado IS NULL and pe_data_referencia_ultimo_resultado IS NULL THEN NULL
    WHEN ar_data_referencia_ultimo_resultado IS NULL THEN pe_ultimo_resultado
    WHEN pe_data_referencia_ultimo_resultado IS NULL THEN ar_ultimo_resultado
    WHEN ar_data_referencia_ultimo_resultado >= pe_data_referencia_ultimo_resultado 
    THEN ar_ultimo_resultado
    ELSE pe_ultimo_resultado
    END                               as dashboard_ultimo_resultado,
  CASE
    WHEN ar_data_referencia_ultimo_resultado IS NULL and pe_data_referencia_ultimo_resultado IS NULL THEN NULL
    WHEN ar_data_referencia_ultimo_resultado IS NULL THEN pe_data_referencia_ultimo_resultado
    WHEN pe_data_referencia_ultimo_resultado IS NULL THEN ar_data_referencia_ultimo_resultado
    WHEN ar_data_referencia_ultimo_resultado >= pe_data_referencia_ultimo_resultado 
    THEN ar_data_referencia_ultimo_resultado
    ELSE pe_data_referencia_ultimo_resultado
    END                               as dashboard_data_referencia_ultimo_resultado,
  pe_tendencia_meta_desdobrada        as dashboard_status_pe,
  ar_tendencia                        as dashboard_status_ar,
  CASE 
    WHEN ar_tendencia = "Cumprida" then "#005A38"
    WHEN ar_tendencia = "Andamento Satisfatório" then "#62C26A"
    WHEN ar_tendencia = "Atraso Recuperável" then "#E9CE56"
    WHEN ar_tendencia = "Cumprida parcialmente" then "#ABAD67" 
    WHEN ar_tendencia = "Atraso grave" then "#E2843C"
    WHEN ar_tendencia = "Não cumprida" then "#BD443F" 
    ELSE "#4F4F4F"
    END                               as dashboard_cor_fonte_ar,
  CASE 
    WHEN pe_tendencia_meta_desdobrada = "Cumprida" then "#005A38"
    WHEN pe_tendencia_meta_desdobrada = "Andamento Satisfatório" then "#62C26A"
    WHEN pe_tendencia_meta_desdobrada = "Atraso Recuperável" then "#E9CE56"
    WHEN pe_tendencia_meta_desdobrada = "Cumprida parcialmente" then "#ABAD67" 
    WHEN pe_tendencia_meta_desdobrada = "Atraso grave" then "#E2843C"
    WHEN pe_tendencia_meta_desdobrada = "Não cumprida" then "#BD443F" 
    ELSE "#4F4F4F"
    END                               as dashboard_cor_fonte_pe,
  CASE 
    WHEN pe_descricao_meta = "nan" THEN pe_nome_meta
    ELSE pe_descricao_meta
    END                               as dashboard_descricao,
  pe_resumo_executivo                 as dashboard_resumo,
  pe_comentarios_da_meta              as dashboard_comentarios,
  pe_tema_transversal                 as dashboard_tema,
  pe_objetivo_2023                    as dashboard_detalhamento_objetivo,
  pe_tipo_meta                        as tipo_meta,
  pe_desdobramento_anual_da_meta      as desdobramento_anual_da_meta,
  pe_codigo_meta_desdobrada           as pe_codigo_meta_desdobrada
FROM pe_com_ar
)

, todos_ordenados AS (
SELECT
  tj.*,
  CASE 
    WHEN tj.origem_meta = "Plano Estratégico" AND tj.id_meta_relacionada IS NULL THEN "PE"
    WHEN tj.origem_meta = "Plano Estratégico" AND tj.id_meta_relacionada IS NOT NULL THEN "PE/AR"
    ELSE "AR"
    END dashboard_origem_meta, 
  oo.ordenacao_orgaos,
  CASE 
    WHEN tj.origem_meta = "Plano Estratégico" THEN 1
    -- WHEN rel_ind.colocar_logo_abaixo IS TRUE THEN 1
    ELSE 2 
  END ordenacao_origem,
  rel_ind.colocar_logo_abaixo,
  rel_ind.chave_meta_pe as codigo_pe_relacao_indireta,
  CASE 
    WHEN rm.ordem_meta_ar IS NULL THEN "9999" 
    ELSE rm.ordem_meta_ar 
  END ordem_meta_ar
FROM todos_juntos as tj
LEFT JOIN (
  SELECT DISTINCT
    orgao_sigla,
    CASE WHEN ordem_secretariado_e_relatorios IS NULL THEN 999 ELSE CAST(CAST(ordem_secretariado_e_relatorios AS FLOAT64) AS INT64) END ordenacao_orgaos 
  FROM {{ ref('orgaos') }} 
  --FROM rj-smfp.planejamento_gestao_dashboard_metas.orgaos
) AS oo
  ON tj.orgao_sigla = oo.orgao_sigla
LEFT JOIN (SELECT 
    chave_meta_ar_egpweb,
    chave_meta_pe,
    LEFT(chave_meta_ar,4) as ano,
    CASE
      WHEN relacao_entre_indicadores = "2 - Direta (Outro indicador)" THEN TRUE
      ELSE FALSE
    END as colocar_logo_abaixo
  FROM `rj-smfp.planejamento_gestao_dashboard_metas_staging.relacao_metas`
  WHERE chave_meta_ar like '2023%') as rel_ind
    ON tj.id_meta_principal = rel_ind.chave_meta_ar_egpweb
LEFT JOIN (SELECT codigo_egpweb, MIN(cod_meta_d) as ordem_meta_ar FROM `rj-smfp.planejamento_gestao_acordo_resultados_staging.meta_desdobrada` group by codigo_egpweb) as rm
    ON tj.id_meta_principal = SAFE_CAST(SAFE_CAST(rm.codigo_egpweb AS FLOAT64) AS STRING)
)

SELECT
  id_meta_principal,
  id_meta_relacionada,
  CASE
    WHEN id_meta_relacionada IS NULL THEN id_meta_principal
    WHEN origem_meta = "Plano Estratégico" THEN CONCAT(id_meta_principal, " - ", id_meta_relacionada)
    WHEN origem_meta = "Acordo de Resultados" THEN CONCAT(id_meta_relacionada, " - ", id_meta_principal)
  END id_detalhamento,
  id_meta_mae,
  tendencia_meta_mae,
  origem_meta,
  orgao_sigla,
  dashboard_nome,
  dashboard_objetivo_pe,
  dashboard_objetivo_ar,
  dashboard_ultimo_resultado,
  dashboard_data_referencia_ultimo_resultado,
  dashboard_status_pe,
  dashboard_status_ar,
  dashboard_cor_fonte_ar,
  dashboard_cor_fonte_pe,
  dashboard_origem_meta,
  dashboard_descricao,
  dashboard_resumo,
  dashboard_comentarios,
  dashboard_tema,
  dashboard_detalhamento_objetivo,
  tipo_meta,
  desdobramento_anual_da_meta,
  (ROW_NUMBER() OVER (ORDER BY 
    ordenacao_orgaos, 
    ordenacao_origem, 
    CASE WHEN origem_meta = "Plano Estratégico" THEN id_meta_principal
    ELSE ordem_meta_ar END)) ordenacao_final
  -- CASE 
  --     WHEN origem_meta = "Plano Estratégico" THEN pe_codigo_meta_desdobrada
  --     WHEN colocar_logo_abaixo IS TRUE THEN CONCAT(codigo_pe_relacao_indireta, "1")
  --   ELSE ordem_meta_ar END ordem_codigos,
  -- (ROW_NUMBER() OVER (ORDER BY 
  --   ordenacao_orgaos, 
  --   ordenacao_origem, 
    -- CASE 
    --   WHEN origem_meta = "Plano Estratégico" THEN pe_codigo_meta_desdobrada
    --   WHEN colocar_logo_abaixo IS TRUE THEN CONCAT(codigo_pe_relacao_indireta, "1")
    -- ELSE ordem_meta_ar END)) ordenacao_final
FROM todos_ordenados
ORDER BY ordenacao_final
