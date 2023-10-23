{{ 
    config( alias='vantagens',schema='recursos_humanos_ergon_comlurb') 
}}

SELECT 
    SAFE_CAST(REGEXP_REPLACE(TRIM(numfunc), r'\.0$', '') AS STRING) AS id_funcionario,
    SAFE_CAST(REGEXP_REPLACE(TRIM(numvinc), r'\.0$', '') AS STRING) AS id_vinculo,
    SAFE_CAST(REGEXP_REPLACE(TRIM(emp_codigo), r'\.0$', '') AS STRING) AS id_empresa,
    SAFE_CAST(REGEXP_REPLACE(id_reg, r'\.0$', '') AS STRING) AS id_registro,
    SAFE_CAST(REGEXP_REPLACE(TRIM(chavevant), r'\.0$', '') AS STRING) AS id_vantagem,


    SAFE_CAST(dtini AS DATE) AS data_inicio,
    SAFE_CAST(dtfim AS DATE) AS data_fim,
    SAFE_CAST(TRIM(pontlei) AS STRING) AS publicacao_diario_oficial,
    SAFE_CAST(TRIM(pontpubl) AS STRING) AS pontpubl,
    SAFE_CAST(TRIM(pontproc) AS STRING) AS pontproc,
    SAFE_CAST(TRIM(vantagem) AS STRING) AS nome_vantagem,
    SAFE_CAST(TRIM(valor) AS STRING) AS valor_vantagem,
    SAFE_CAST(TRIM(info) AS STRING) AS informacao_atributo,
    SAFE_CAST(TRIM(tipo_incorporacao) AS STRING) AS tipo_incorporacao_cargo_fiducia,
    SAFE_CAST(TRIM(perc_inc_funcao) AS STRING) AS percentual_incorporacao_cargo_fiducia,
    SAFE_CAST(TRIM(inc_tabelavenc) AS STRING) AS incide_tabela_vencimentos,
    SAFE_CAST(TRIM(inc_referencia) AS STRING) AS incide_tabela_simbolo,
    SAFE_CAST(TRIM(obs) AS STRING) AS observacoes,



    SAFE_CAST(TRIM(valor2) AS STRING) AS valor_complementar,
    SAFE_CAST(TRIM(info2) AS STRING) AS informacao_complementar,
    SAFE_CAST(TRIM(valor3) AS STRING) AS valor_complementar_2,
    SAFE_CAST(TRIM(info3) AS STRING) AS informacao_complementar_2,
    SAFE_CAST(TRIM(valor4) AS STRING) AS valor_coplementar_3,
    SAFE_CAST(TRIM(info4) AS STRING) AS informacao_complementar_3,
    SAFE_CAST(TRIM(valor5) AS STRING) AS valor_complementar_4,
    SAFE_CAST(TRIM(info5) AS STRING) AS informacao_complementar_4,
    SAFE_CAST(TRIM(valor6) AS STRING) AS valor_complementar_5,
    SAFE_CAST(TRIM(info6) AS STRING) AS informacao_complementar_5,

    SAFE_CAST(TRIM(perc_inc_grat_funcao) AS STRING) AS perc_inc_grat_funcao,
    SAFE_CAST(TRIM(inc_grat_tabvenc) AS STRING) AS inc_grat_tabvenc,
    SAFE_CAST(TRIM(inc_grat_referencia) AS STRING) AS inc_grat_referencia,
    SAFE_CAST(TRIM(incorp_extra_tipofreq_1) AS STRING) AS incorp_extra_tipofreq_1,
    SAFE_CAST(TRIM(quant_extra_1) AS STRING) AS quant_extra_1,
    SAFE_CAST(TRIM(incorp_extra_tipofreq_2) AS STRING) AS incorp_extra_tipofreq_2,
    SAFE_CAST(TRIM(quant_extra_2) AS STRING) AS quant_extra_2,
    SAFE_CAST(TRIM(id_proc_pes) AS STRING) AS id_proc_pes,



    SAFE_CAST(TRIM(flex_campo_01) AS STRING) AS flex_campo_01,
    SAFE_CAST(TRIM(flex_campo_02) AS STRING) AS flex_campo_02,
    SAFE_CAST(TRIM(flex_campo_03) AS STRING) AS flex_campo_03,
    SAFE_CAST(TRIM(flex_campo_04) AS STRING) AS flex_campo_04,
    SAFE_CAST(TRIM(flex_campo_05) AS STRING) AS flex_campo_05,
    SAFE_CAST(TRIM(flex_campo_06) AS STRING) AS flex_campo_06,
    SAFE_CAST(TRIM(flex_campo_07) AS STRING) AS flex_campo_07,
    SAFE_CAST(TRIM(flex_campo_08) AS STRING) AS flex_campo_08,
    SAFE_CAST(TRIM(flex_campo_09) AS STRING) AS flex_campo_09,
    SAFE_CAST(TRIM(flex_campo_10) AS STRING) AS flex_campo_10,
    SAFE_CAST(TRIM(flex_campo_11) AS STRING) AS flex_campo_11,
    SAFE_CAST(TRIM(flex_campo_12) AS STRING) AS flex_campo_12,
    SAFE_CAST(TRIM(flex_campo_13) AS STRING) AS flex_campo_13,
    SAFE_CAST(TRIM(flex_campo_14) AS STRING) AS flex_campo_14,
    SAFE_CAST(TRIM(flex_campo_15) AS STRING) AS flex_campo_15,
    SAFE_CAST(TRIM(flex_campo_16) AS STRING) AS flex_campo_16,
    SAFE_CAST(TRIM(flex_campo_17) AS STRING) AS flex_campo_17,
    SAFE_CAST(TRIM(flex_campo_18) AS STRING) AS flex_campo_18,
    SAFE_CAST(TRIM(flex_campo_19) AS STRING) AS flex_campo_19,
    SAFE_CAST(TRIM(flex_campo_20) AS STRING) AS flex_campo_20,
    SAFE_CAST(TRIM(flex_campo_21) AS STRING) AS flex_campo_21,
    SAFE_CAST(TRIM(flex_campo_22) AS STRING) AS flex_campo_22,
    SAFE_CAST(TRIM(flex_campo_23) AS STRING) AS flex_campo_23,
    SAFE_CAST(TRIM(flex_campo_24) AS STRING) AS flex_campo_24,
    SAFE_CAST(TRIM(flex_campo_25) AS STRING) AS flex_campo_25,
    SAFE_CAST(TRIM(flex_campo_26) AS STRING) AS flex_campo_26,
    SAFE_CAST(TRIM(flex_campo_27) AS STRING) AS flex_campo_27,
    SAFE_CAST(TRIM(flex_campo_28) AS STRING) AS flex_campo_28,
    SAFE_CAST(TRIM(flex_campo_29) AS STRING) AS flex_campo_29,
    SAFE_CAST(TRIM(flex_campo_30) AS STRING) AS flex_campo_30,
FROM rj-smfp.recursos_humanos_ergon_comlurb_staging.vantagens AS t





