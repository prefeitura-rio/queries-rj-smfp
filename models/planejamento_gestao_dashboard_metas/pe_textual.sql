WITH pe_geral AS (
  SELECT
    CONCAT(_meta, "-", orgao_responsavel) AS id_meta_secretaria,
    SAFE_CAST(_metas AS STRING) id_numerico_meta_pe,
    SAFE_CAST(_meta AS STRING) id_meta_pe,
    "Plano Estratégico" as origem,
    -- CASE WHEN tendencia_cumprimento_meta_2022 = "Cumprida" or tendencia_cumprimento_meta_2022 = "Tendência de cumprir" then "Cumprir"
    --   WHEN tendencia_cumprimento_meta_2022 = "Cumprida parcialmente" or tendencia_cumprimento_meta_2022 = "Tendência de cumprir parcialmente" then "Cumprir parcialmente"
    --   WHEN tendencia_cumprimento_meta_2022 = "Não cumprida" or tendencia_cumprimento_meta_2022 = "Tendência de não cumprir" then "Cumprir"
    --   ELSE tendencia_cumprimento_meta_2022 END 
    --   AS tendencia_subdivisao,
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
    SAFE_CAST(data_referencia_resultado AS DATE) data_referencia_resultado,
    SAFE_CAST(comentarios_da_meta AS STRING) comentarios_da_meta,
    SAFE_CAST(resumo_executivo AS STRING) resumo_executivo,
    SAFE_CAST(tendencia_cumprimento_meta_2021 AS STRING) tendencia_cumprimento_meta_2021,
    SAFE_CAST(tendencia_cumprimento_meta_2022 AS STRING) tendencia_cumprimento_meta_2022,
    SAFE_CAST(tendencia_cumprimento_meta_2023 AS STRING) tendencia_cumprimento_meta_2023,
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
    SAFE_CAST(SAFE_CAST(quantidade_de_indicadores_na_meta AS FLOAT64) AS INT64) quantidade_de_indicadores_na_meta,
    SAFE_CAST(meta_de_resultado AS STRING) meta_de_resultado,
    SAFE_CAST(medicao_em_2021 AS STRING) medicao_em_2021,
    SAFE_CAST(SAFE_CAST(quantidade_de_projetos_associados AS FLOAT64) AS INT64) quantidade_de_projetos_associados,
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
    SAFE_CAST(SAFE_CAST(ano_meta_desdobrada AS FLOAT64) AS INT64) ano_meta_desdobrada,
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
), 

pe_valores as (
SELECT
  id_meta_secretaria,
  origem,
  tendencia_cumprimento_meta_2023,
  -- tendencia_subdivisao,
  tipo_meta,
  casas_decimais,
  valor_meta_final,
  ano_meta_desdobrada,
  resultado_alcancado_para_2024,
  ordem_da_meta_no_dashboard_do_prefeito,
  _2021,
  _2022,
  _2023,
  _2024,
  _2025,
  data_valor,
  valor
FROM pe_geral
UNPIVOT(valor FOR data_valor IN (
  jan_21,
  fev_21,
  mar_21,
  abr_21,
  mai_21,
  jun_21,
  jul_21,
  ago_21,
  set_21,
  out_21,
  nov_21,
  dez_21,
  jan_22,
  fev_22,
  mar_22,
  abr_22,
  mai_22,
  jun_22,
  jul_22,
  ago_22,
  set_22,
  out_22,
  nov_22,
  dez_22,
  jan_23,
  fev_23,
  mar_23,
  abr_23,
  mai_23,
  jun_23,
  jul_23,
  ago_23,
  set_23,
  out_23,
  nov_23,
  dez_23,
  jan_24,
  fev_24,
  mar_24,
  abr_24,
  mai_24,
  jun_24,
  jul_24,
  ago_24,
  set_24,
  out_24,
  nov_24,
  dez_24)
  )
),

pe_textual as (
  SELECT
    id_meta_secretaria,
    origem,
    tendencia_cumprimento_meta_2023,
    -- tendencia_subdivisao,
    tipo_meta,
    casas_decimais,
    valor_meta_final,
    ano_meta_desdobrada,
    resultado_alcancado_para_2024,
    _2021,
    _2022,
    _2023,
    _2024,
    _2025,
    SAFE_CAST(REPLACE(`rj-smfp.planejamento_gestao_dashboard_metas_staging`.tradutor_data(data_valor), "_", "-") AS DATE FORMAT 'MON-YY') data_valor,
    valor,
  FROM pe_valores
  WHERE tipo_meta = 'Textual'
)

select * from pe_textual
