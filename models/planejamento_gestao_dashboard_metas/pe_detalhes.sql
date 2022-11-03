WITH pe_geral AS (
  SELECT
    CONCAT(_meta, "-", orgao_responsavel) AS id_meta_secretaria,
    SAFE_CAST(_metas AS STRING) id_numerico_meta_pe,
    SAFE_CAST(_meta AS STRING) id_meta_pe,
    "Plano Estratégico" as origem,
    CASE WHEN tendencia_cumprimento_meta_2022 = "Cumprida" or tendencia_cumprimento_meta_2022 = "Tendência de cumprir" then "Cumprir"
      WHEN tendencia_cumprimento_meta_2022 = "Cumprida parcialmente" or tendencia_cumprimento_meta_2022 = "Tendência de cumprir parcialmente" then "Cumprir parcialmente"
      WHEN tendencia_cumprimento_meta_2022 = "Não cumprida" or tendencia_cumprimento_meta_2022 = "Tendência de não cumprir" then "Cumprir"
      ELSE tendencia_cumprimento_meta_2022 END 
      AS tendencia_subdivisao,
    SAFE_CAST(codigo_tema AS STRING) codigo_tema,
    SAFE_CAST(tema_transversal AS STRING) tema_transversal,
    SAFE_CAST(inciativa_estrategica__nome_de_trabalho AS STRING) iniciativa_estrategica_nome_de_trabalho,
    SAFE_CAST(codigo_meta_desdobrada AS STRING) codigo_meta_desdobrada,
    SAFE_CAST(palavras_chave_meta AS STRING) palavras_chave_meta,
    SAFE_CAST(chave_da_meta_pe AS STRING) codigo_meta,
    SAFE_CAST(meta AS STRING) meta,
    SAFE_CAST(orgao_responsavel AS STRING) orgao_responsavel,
    SAFE_CAST(descricao_do_indicador AS STRING) descricao_do_indicador,
    SAFE_CAST(unidade_de_medida AS STRING) unidade_de_medida,
    SAFE_CAST(fonte_dos_dados AS STRING) fonte_dos_dados,
    SAFE_CAST(frequencia_de_medicao AS STRING) frequencia_de_medicao,
    SAFE_CAST(formula_de_calculo AS STRING) formula_de_calculo,
    SAFE_CAST(valor_referencia AS STRING) valor_referencia,
    SAFE_CAST(data_referencia AS STRING) data_referencia,
    SAFE_CAST(regionalizavel AS STRING) regionalizavel,
    REPLACE(REPLACE(SAFE_CAST(_2021 AS STRING), "\n-", "Sem valor alvo"), "-", "Sem valor alvo") _2021,
    REPLACE(REPLACE(SAFE_CAST(_2022 AS STRING), "\n-", "Sem valor alvo"), "-", "Sem valor alvo") _2022,
    REPLACE(REPLACE(SAFE_CAST(_2023 AS STRING), "\n-", "Sem valor alvo"), "-", "Sem valor alvo") _2023,
    REPLACE(REPLACE(SAFE_CAST(_2024 AS STRING), "\n-", "Sem valor alvo"), "-", "Sem valor alvo") _2024,
    REPLACE(REPLACE(SAFE_CAST(_2025 AS STRING), "\n-", "Sem valor alvo"), "-", "Sem valor alvo") _2025,
    SAFE_CAST(meta_validada_pelo_prefeito AS STRING) meta_validada_pelo_prefeito,
    SAFE_CAST(meta_global_alinhada_com_mais_de_um_tema_transversal AS STRING) meta_global_alinhada_com_mais_de_um_tema_transversal,
    SAFE_CAST(se_a_resposta_for_sim_na_coluna_anterior____qualis_temas AS STRING) se_a_resposta_for_sim_na_coluna_anterior_qualis_temas,
    SAFE_CAST(meta_alinhada_com_contribuicoes_da_participacao_social AS STRING) meta_alinhada_com_contribuicoes_da_participacao_social,
    SAFE_CAST(meta_alinhada_com_meta_do_pds AS STRING) meta_alinhada_com_meta_do_pds,
    SAFE_CAST(palavra_chave_estrategia_pds AS STRING) palavra_chave_estrategia_pds,
    SAFE_CAST(codigo_meta_pds AS STRING) codigo_meta_pds,
    SAFE_CAST(se_a_resposta_for_sim_na_coluna_anterior____qual_meta_do_pds AS STRING) se_a_resposta_for_sim_na_coluna_anterior_qual_meta_do_pds,
    SAFE_CAST(se_a_resposta_for_alinhada_na_coluna_anterior_mas_com_ponto_de_atencao AS STRING) se_a_resposta_for_alinhada_na_coluna_anterior_mas_com_ponto_de_atencao,
    SAFE_CAST(se_a_resposta_for_desalinhada_na_coluna_anterior____qual_meta_do_pds AS STRING) se_a_resposta_for_desalinhada_na_coluna_anterior_qual_meta_do_pds,
    SAFE_CAST(selo_participacao___esta_entre_as_mais_pedidas_de_participacao_social AS STRING) selo_participacao_esta_entre_as_mais_pedidas_de_participacao_social,
    SAFE_CAST(preenchimento_atualizado_em AS STRING) preenchimento_atualizado_em,
    SAFE_CAST(observacoes AS STRING) observacoes,
    SAFE_CAST(ultimo_resultado AS STRING) ultimo_resultado,
    SAFE_CAST(`rj-smfp.planejamento_gestao_dashboard_metas_staging`.tradutor_data(LOWER(data_referencia_resultado)) AS DATE FORMAT 'MON-YY') data_referencia_resultado,
    SAFE_CAST(comentarios_da_meta AS STRING) comentarios_da_meta,
    SAFE_CAST(resumo_executivo AS STRING) resumo_executivo,
    SAFE_CAST(tendencia_cumprimento_meta_2021 AS STRING) tendencia_cumprimento_meta_2021,
    SAFE_CAST(tendencia_cumprimento_meta_2022 AS STRING) tendencia_cumprimento_meta_2022,
    SAFE_CAST(tendencia_cumprimento_meta_2024 AS STRING) tendencia_cumprimento_meta_2024,
    SAFE_CAST(jan_21 AS STRING) jan_21,
    SAFE_CAST(fev_21 AS STRING) fev_21,
    SAFE_CAST(mar_21 AS STRING) mar_21,
    SAFE_CAST(abr_21 AS STRING) abr_21,
    SAFE_CAST(mai_21 AS STRING) mai_21,
    SAFE_CAST(jun_21 AS STRING) jun_21,
    SAFE_CAST(jul_21 AS STRING) jul_21,
    SAFE_CAST(ago_21 AS STRING) ago_21,
    SAFE_CAST(set_21 AS STRING) set_21,
    SAFE_CAST(out_21 AS STRING) out_21,
    SAFE_CAST(nov_21 AS STRING) nov_21,
    SAFE_CAST(dez_21 AS STRING) dez_21,
    SAFE_CAST(final_2021 AS STRING) final_2021,
    SAFE_CAST(jan_22 AS STRING) jan_22,
    SAFE_CAST(fev_22 AS STRING) fev_22,
    SAFE_CAST(mar_22 AS STRING) mar_22,
    SAFE_CAST(abr_22 AS STRING) abr_22,
    SAFE_CAST(mai_22 AS STRING) mai_22,
    SAFE_CAST(jun_22 AS STRING) jun_22,
    SAFE_CAST(jul_22 AS STRING) jul_22,
    SAFE_CAST(ago_22 AS STRING) ago_22,
    SAFE_CAST(set_22 AS STRING) set_22,
    SAFE_CAST(out_22 AS STRING) out_22,
    SAFE_CAST(nov_22 AS STRING) nov_22,
    SAFE_CAST(dez_22 AS STRING) dez_22,
    SAFE_CAST(final_2022 AS STRING) final_2022,
    SAFE_CAST(final_acumulado_2022 AS STRING) final_acumulado_2022,
    SAFE_CAST(jan_23 AS STRING) jan_23,
    SAFE_CAST(fev_23 AS STRING) fev_23,
    SAFE_CAST(mar_23 AS STRING) mar_23,
    SAFE_CAST(abr_23 AS STRING) abr_23,
    SAFE_CAST(mai_23 AS STRING) mai_23,
    SAFE_CAST(jun_23 AS STRING) jun_23,
    SAFE_CAST(jul_23 AS STRING) jul_23,
    SAFE_CAST(ago_23 AS STRING) ago_23,
    SAFE_CAST(set_23 AS STRING) set_23,
    SAFE_CAST(out_23 AS STRING) out_23,
    SAFE_CAST(nov_23 AS STRING) nov_23,
    SAFE_CAST(dez_23 AS STRING) dez_23,
    SAFE_CAST(final_2023 AS STRING) final_2023,
    SAFE_CAST(final_acumulado_2023 AS STRING) final_acumulado_2023,
    SAFE_CAST(jan_24 AS STRING) jan_24,
    SAFE_CAST(fev_24 AS STRING) fev_24,
    SAFE_CAST(mar_24 AS STRING) mar_24,
    SAFE_CAST(abr_24 AS STRING) abr_24,
    SAFE_CAST(mai_24 AS STRING) mai_24,
    SAFE_CAST(jun_24 AS STRING) jun_24,
    SAFE_CAST(jul_24 AS STRING) jul_24,
    SAFE_CAST(ago_24 AS STRING) ago_24,
    SAFE_CAST(set_24 AS STRING) set_24,
    SAFE_CAST(out_24 AS STRING) out_24,
    SAFE_CAST(nov_24 AS STRING) nov_24,
    SAFE_CAST(dez_24 AS STRING) dez_24,
    SAFE_CAST(final_2024 AS STRING) final_2024,
    SAFE_CAST(final_acumulado_2024 AS STRING) final_acumulado_2024,
    SAFE_CAST(chaves_projetos_associados AS STRING) chaves_projetos_associados,
    SAFE_CAST(nome_dos_projetos AS STRING) nome_dos_projetos,
    SAFE_CAST(gerencia_egp_rio AS STRING) gerencia_egp_rio,
    SAFE_CAST(quantidade_de_indicadores_na_meta AS INT64) quantidade_de_indicadores_na_meta,
    SAFE_CAST(meta_de_resultado AS STRING) meta_de_resultado,
    SAFE_CAST(medicao_em_2021 AS STRING) medicao_em_2021,
    SAFE_CAST(quantidade_de_projetos_associados AS INT64) quantidade_de_projetos_associados,
    SAFE_CAST(tipo_compromisso AS STRING) tipo_compromisso,
    SAFE_CAST(texto_compromisso AS STRING) texto_compromisso,
    SAFE_CAST(o_globo AS STRING) o_globo,
    SAFE_CAST(g1 AS STRING) g1,
    SAFE_CAST(folha AS STRING) folha,
    SAFE_CAST(texto_o_globo AS STRING) texto_o_globo,
    CASE WHEN ar = "S" then TRUE ELSE FALSE END ar,
    SAFE_CAST(descricao_meta_desdobrada AS STRING) descricao_meta_desdobrada,
    SAFE_CAST(indicador_dashboard_prefeito AS STRING) indicador_dashboard_prefeito,
    SAFE_CAST(tipo_meta AS STRING) tipo_meta,
    SAFE_CAST(SAFE_CAST(casas_decimais AS FLOAT64) AS INT64) casas_decimais,
    SAFE_CAST(meta1 AS STRING) valor_meta_final,
    SAFE_CAST(ano_meta_desdobrada AS INT64) ano_meta_desdobrada,
    SAFE_CAST(usa_valor_de_referencia_para_calculo_do_resultado_celula_dn AS STRING) usa_valor_de_referencia_para_calculo_do_resultado_celula_dn,
    SAFE_CAST(resultado_alcancado_para_2024 AS STRING) resultado_alcancado_para_2024,
    SAFE_CAST(ordem_da_meta_no_dashboard_do_prefeito AS STRING) ordem_da_meta_no_dashboard_do_prefeito,
    SAFE_CAST(problemas_encontrados___orientacoes AS STRING) problemas_encontrados_orientacoes,
    SAFE_CAST(andamento_de_projetos_prioritarios_ligados_a_meta___projeto_1 AS STRING) andamento_de_projetos_prioritarios_ligados_a_meta_projeto_1,
    SAFE_CAST(andamento_de_projetos_prioritarios_ligados_a_meta___projeto_2 AS STRING) andamento_de_projetos_prioritarios_ligados_a_meta_projeto_2,
    SAFE_CAST(andamento_de_projetos_prioritarios_ligados_a_meta___projeto_3 AS STRING) andamento_de_projetos_prioritarios_ligados_a_meta_projeto_3,
    SAFE_CAST(andamento_de_projetos_prioritarios_ligados_a_meta___projeto_4 AS STRING) andamento_de_projetos_prioritarios_ligados_a_meta_projeto_4,
    SAFE_CAST(andamento_de_projetos_prioritarios_ligados_a_meta___projeto_5 AS STRING) andamento_de_projetos_prioritarios_ligados_a_meta_projeto_5,
  FROM `rj-smfp.planejamento_gestao_dashboard_metas_staging.metas_planejamento_estrategico`
  CROSS JOIN UNNEST(SPLIT(orgao_responsavel, '\n')) AS orgao_responsavel
)

, pe_detalhes as (
SELECT
  id_meta_secretaria,
  id_numerico_meta_pe,
  id_meta_pe,
  origem,
  tendencia_subdivisao,
  CASE WHEN tendencia_cumprimento_meta_2022 = "Tendência de cumprir" or tendencia_cumprimento_meta_2022 = "Cumprida" then "#005A38" 
    WHEN tendencia_cumprimento_meta_2022 = "Tendência de cumprir parcialmente" or tendencia_cumprimento_meta_2022 = "Cumprida parcialmente" then "#ABAD67" 
    WHEN tendencia_cumprimento_meta_2022 = "Tendência de não cumprir" or tendencia_cumprimento_meta_2022 = "Não cumprida" then "#DE9B89" 
    ELSE "#4F4F4F" END 
    AS cor_fonte,
  CASE WHEN tendencia_cumprimento_meta_2022 = "Cumprida" then "Cumprida"
    WHEN tendencia_cumprimento_meta_2022 = "Cumprida parcialmente" then "Cumprida parcialmente"
    WHEN tendencia_cumprimento_meta_2022 = "Não cumprida" then "Não cumprida"
    WHEN tendencia_cumprimento_meta_2022 = "Tendência de cumprir" then "Andamento Satisfatório"
    WHEN tendencia_cumprimento_meta_2022 = "Tendência de cumprir parcialmente" then "Atraso Recuperável"
    WHEN tendencia_cumprimento_meta_2022 = "Tendência de não cumprir" then "Atraso grave"
    WHEN tendencia_cumprimento_meta_2022 = "Indefinida" then "Indefinida"
    WHEN tendencia_cumprimento_meta_2022 = "Não se aplica" then "Sem informações/Não se aplica" 
    ELSE "VALOR NÃO ENCONTRADO" END
    AS pe_tendencia_normalizada,
  codigo_tema,
  tema_transversal,
  iniciativa_estrategica_nome_de_trabalho,
  codigo_meta_desdobrada,
  palavras_chave_meta,
  codigo_meta,
  meta,
  orgao_responsavel,
  descricao_do_indicador,
  unidade_de_medida,
  fonte_dos_dados,
  frequencia_de_medicao,
  formula_de_calculo,
  valor_referencia,
  data_referencia,
  regionalizavel,
  CASE 
    WHEN CONTAINS_SUBSTR(_2021, "Sem valor alvo") AND _2021 != "Sem valor alvo" THEN REPLACE(_2021, "Sem valor alvo", "")
    ELSE _2021
  END _2021,
  CASE 
    WHEN CONTAINS_SUBSTR(_2021, "Sem valor alvo") AND _2022 != "Sem valor alvo" THEN REPLACE(_2022, "Sem valor alvo", "")
    ELSE _2022
  END _2022,
  CASE 
    WHEN CONTAINS_SUBSTR(_2023, "Sem valor alvo") AND _2023 != "Sem valor alvo" THEN REPLACE(_2023, "Sem valor alvo", "")
    ELSE _2023
  END _2023,
  CASE 
    WHEN CONTAINS_SUBSTR(_2021, "Sem valor alvo") AND _2024 != "Sem valor alvo" THEN REPLACE(_2024, "Sem valor alvo", "")
    ELSE _2024
  END _2024,
  CASE 
    WHEN CONTAINS_SUBSTR(_2025, "Sem valor alvo") AND _2025 != "Sem valor alvo" THEN REPLACE(_2025, "Sem valor alvo", "")
    ELSE _2025
  END _2025,
  meta_validada_pelo_prefeito,
  meta_global_alinhada_com_mais_de_um_tema_transversal,
  se_a_resposta_for_sim_na_coluna_anterior_qualis_temas,
  meta_alinhada_com_contribuicoes_da_participacao_social,
  meta_alinhada_com_meta_do_pds,
  palavra_chave_estrategia_pds,
  codigo_meta_pds,
  se_a_resposta_for_sim_na_coluna_anterior_qual_meta_do_pds,
  se_a_resposta_for_alinhada_na_coluna_anterior_mas_com_ponto_de_atencao,
  se_a_resposta_for_desalinhada_na_coluna_anterior_qual_meta_do_pds,
  selo_participacao_esta_entre_as_mais_pedidas_de_participacao_social,
  preenchimento_atualizado_em,
  observacoes,
  CASE WHEN 
    REPLACE(REPLACE(REPLACE(ultimo_resultado, "\n-", ""), "-", ""), "\n", "") = "" OR REPLACE(REPLACE(REPLACE(ultimo_resultado, "\n-", ""), "-", ""), "\n", "") = "nan" THEN NULL
    ELSE REPLACE(REPLACE(REPLACE(ultimo_resultado, "\n-", ""), "-", ""), "\n", "") END 
    as ultimo_resultado,
  data_referencia_resultado,
  comentarios_da_meta,
  resumo_executivo,
  tendencia_cumprimento_meta_2021,
  tendencia_cumprimento_meta_2022,
  tendencia_cumprimento_meta_2024,
  final_2021,
  final_2022,
  final_acumulado_2022,
  final_2023,
  final_acumulado_2023,
  final_2024,
  final_acumulado_2024,
  chaves_projetos_associados,
  nome_dos_projetos,
  gerencia_egp_rio,
  quantidade_de_indicadores_na_meta,
  meta_de_resultado,
  medicao_em_2021,
  quantidade_de_projetos_associados,
  tipo_compromisso,
  texto_compromisso,
  o_globo,
  g1
  folha,
  texto_o_globo,
  ar
  descricao_meta_desdobrada,
  indicador_dashboard_prefeito,
  tipo_meta,
  casas_decimais,
  valor_meta_final,
  ano_meta_desdobrada,
  usa_valor_de_referencia_para_calculo_do_resultado_celula_dn,
  resultado_alcancado_para_2024,
  ordem_da_meta_no_dashboard_do_prefeito,
  problemas_encontrados_orientacoes,
  andamento_de_projetos_prioritarios_ligados_a_meta_projeto_1,
  andamento_de_projetos_prioritarios_ligados_a_meta_projeto_2,
  andamento_de_projetos_prioritarios_ligados_a_meta_projeto_3,
  andamento_de_projetos_prioritarios_ligados_a_meta_projeto_4,
  andamento_de_projetos_prioritarios_ligados_a_meta_projeto_5
FROM pe_geral
WHERE codigo_meta IS NOT NULL)

,pe_tendencia_0 as ( 
SELECT
  origem,
  --orgao_responsavel,
  codigo_meta,                                
  MIN(CASE WHEN tendencia_cumprimento_meta_2022 = "Cumprida" then 8
    WHEN tendencia_cumprimento_meta_2022 = "Cumprida parcialmente" then 2
    WHEN tendencia_cumprimento_meta_2022 = "Não cumprida" then 1
    WHEN tendencia_cumprimento_meta_2022 = "Tendência de cumprir" then 6
    WHEN tendencia_cumprimento_meta_2022 = "Tendência de cumprir parcialmente" then 5
    WHEN tendencia_cumprimento_meta_2022 = "Tendência de não cumprir" then 4
    WHEN tendencia_cumprimento_meta_2022 = "Indefinida" then 3
    WHEN tendencia_cumprimento_meta_2022 = "Não se aplica" or tendencia_cumprimento_meta_2022 = "Não" then 7
    ELSE 999 END) tendencia_numero_pe,
FROM pe_geral
WHERE codigo_meta != "nan"
GROUP BY origem, codigo_meta
ORDER BY tendencia_numero_pe DESC
)

SELECT
  pd.*,
  tendencia_numero_pe,
  CASE 
    WHEN tendencia_numero_pe = 1 THEN "Não cumprida"
    WHEN tendencia_numero_pe = 2 THEN "Cumprida parcialmente"
    WHEN tendencia_numero_pe = 3 THEN "Indefinida"
    WHEN tendencia_numero_pe = 4 THEN "Atraso grave"
    WHEN tendencia_numero_pe = 5 THEN "Atraso Recuperável"
    WHEN tendencia_numero_pe = 6 THEN "Andamento Satisfatório"
    WHEN tendencia_numero_pe = 7 THEN "Sem informações/Não se aplica"
    WHEN tendencia_numero_pe = 8 THEN "Cumprida"
    ELSE "VALOR NÃO ENCONTRADO" END tendencia_pe
FROM pe_detalhes as pd
LEFT JOIN pe_tendencia_0 as pt
  ON pd.codigo_meta = pt.codigo_meta --AND pd.orgao_responsavel = pt.orgao_responsavel
WHERE id_meta_secretaria != "nan-nan" --AND id_meta_secretaria != 'M56-SEOP'
ORDER BY origem, orgao_responsavel, codigo_meta