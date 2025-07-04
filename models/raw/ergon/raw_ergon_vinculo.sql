{{
    config(
        alias='vinculo',
        schema='recursos_humanos_ergon'
    )
}}

SELECT
    SAFE_CAST(REGEXP_REPLACE(CAST(NUMFUNC AS STRING), r'\.0$', '') AS STRING) AS id_funcionario,
    SAFE_CAST(REGEXP_REPLACE(CAST(NUMERO AS STRING), r'\.0$', '') AS STRING) AS id_vinculo,
    SAFE_CAST(TIPOVINC AS STRING) AS tipo,
    SAFE_CAST(SAFE.PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%E*S',DTNOM) AS DATE) AS data_nomeacao,
    SAFE_CAST(SAFE.PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%E*S',DTPOSSE) AS DATE) AS data_posse,
    SAFE_CAST(SAFE.PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%E*S',DTEXERC) AS DATE) AS data_exercicio,
    SAFE_CAST(REGIMEJUR AS STRING) AS regime_juridico,
    SAFE_CAST(CATEGORIA AS STRING) AS categoria,
    SAFE_CAST(DESCONTA_IR AS STRING) AS desconta_ir,
    SAFE_CAST(MOTIVO AS STRING) AS descricao_provimento,
    SAFE_CAST(REGEXP_REPLACE(CAST(CLASSIFCONC AS STRING), r'\.0$', '') AS STRING) AS classificacao_concurso,
    SAFE_CAST(SAFE.PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%E*S',DTINI_CESSAO) AS DATE) AS data_inicio_cessao,
    SAFE_CAST(SAFE.PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%E*S',DTFIM_CESSAO) AS DATE) AS data_fim_cessao,
    SAFE_CAST(SAFE.PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%E*S',DTCONC) AS DATE) AS data_concurso,
    SAFE_CAST(SAFE.PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%E*S',DTOPFGTS) AS DATE) AS data_fgts,
    SAFE_CAST(SAFE.PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%E*S',DTINICONTR) AS DATE) AS data_inicio_contrato,
    SAFE_CAST(SAFE.PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%E*S',DTFIMCONTR) AS DATE) AS data_fim_contrato,
    SAFE_CAST(SAFE.PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%E*S',DTPRORROGCONTR) AS DATE) AS data_prorrogacao_contrato,
    SAFE_CAST(SAFE.PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%E*S',DTAPOSENT) AS DATE) AS data_aposentadoria,
    SAFE_CAST(TIPOAPOS AS STRING) AS tipo_aposentadoria,
    SAFE_CAST(SAFE.PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%E*S',DTVAC) AS DATE) AS data_vacancia,
    SAFE_CAST(FORMAVAC AS STRING) AS id_vacancia,
    SAFE_CAST(REGEXP_REPLACE(CAST(NUMVINCANT AS STRING), r'\.0$', '') AS STRING) AS id_vinculo_anterior,
    SAFE_CAST(REGEXP_REPLACE(CAST(NUMVINCPOS AS STRING), r'\.0$', '') AS STRING) AS id_vinculo_posterior,
    SAFE_CAST(TIPOORG_REQ AS STRING) AS tipo_orgao_origem,
    SAFE_CAST(FUNCAO_REQ AS STRING) AS funcao_origem_requisicao,
    SAFE_CAST(FONE_REQ AS STRING) AS telefone_requisicao,
    SAFE_CAST(MOTIVOVAC AS STRING) AS motivo_vacancia,
    SAFE_CAST(MATRIC AS STRING) AS id_matricula_vinculo,
    SAFE_CAST(ORGAO_EXT_REQ AS STRING) AS orgao_origem_requisicao,
    SAFE_CAST(TIPO_ONUS_REQ AS STRING) AS tipo_onus_requisicao,
    SAFE_CAST(TIPO_RESSARC_REQ AS STRING) AS tipo_ressarcimento_requisicao,
    SAFE_CAST(TIPO_REQ AS STRING) AS tipo_requisicao,
    SAFE_CAST(SAFE.PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%E*S',DT_PGTO_ATE) AS DATE) AS data_pagamento_requisicao,
    SAFE_CAST(FLEX_CAMPO_01 AS STRING) AS origem_servidor_cedido,
    SAFE_CAST(FLEX_CAMPO_05 AS STRING) AS id_processo_origem,
    SAFE_CAST(FLEX_CAMPO_09 AS STRING) AS contrato_suspenso,
    SAFE_CAST(FLEX_CAMPO_17 AS STRING) AS professor,
    SAFE_CAST(FLEX_CAMPO_18 AS STRING) AS cota,
    SAFE_CAST(REGEXP_REPLACE(CAST(EMP_CODIGO AS STRING), r'\.0$', '') AS STRING) AS id_empresa,
    SAFE_CAST(SAFE.PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%E*S',DT_HOMOLOG) AS DATE) AS data_homologacao_aposentadoria,

    -- Colunas novas do schema
    _airbyte_extracted_at AS updated_at,
    SAFE_CAST(REGEXP_REPLACE(CAST(BANCO AS STRING), r'\.0$', '') AS STRING) AS banco,
    SAFE_CAST(CONTA AS STRING) AS conta,
    SAFE_CAST(REGEXP_REPLACE(CAST(ID_REG AS STRING), r'\.0$', '') AS STRING) AS id_reg,
    SAFE_CAST(AGENCIA AS STRING) AS agencia,
    SAFE_CAST(CORREIO AS STRING) AS correio,
    SAFE_CAST(REGEXP_REPLACE(CAST(PONTLEI AS STRING), r'\.0$', '') AS STRING) AS pontlei,
    SAFE_CAST(TIPOPAG AS STRING) AS tipopag,
    SAFE_CAST(PONTPROC AS STRING) AS pontproc,
    SAFE_CAST(REGEXP_REPLACE(CAST(PONTPUBL AS STRING), r'\.0$', '') AS STRING) AS pontpubl,
    SAFE_CAST(REGEXP_REPLACE(CAST(BANCOFGTS AS STRING), r'\.0$', '') AS STRING) AS bancofgts,
    SAFE_CAST(CONTAFGTS AS STRING) AS contafgts,
    SAFE_CAST(MATRICULA AS STRING) AS matricula,
    SAFE_CAST(ORGAO_REQ AS STRING) AS orgao_req,
    SAFE_CAST(SAFE.PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%E*S',DTADM_RAIS) AS DATE) AS dtadm_rais,
    SAFE_CAST(SAFE.PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%E*S',DTFIMEXERC) AS DATE) AS dtfimexerc,
    SAFE_CAST(SAFE.PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%E*S',DTINIEXERC) AS DATE) AS dtiniexerc,
    SAFE_CAST(SAFE.PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%E*S',DTRETRFGTS) AS DATE) AS dtretrfgts,
    SAFE_CAST(MATRICULA1 AS STRING) AS matricula1,
    SAFE_CAST(MATRICULA2 AS STRING) AS matricula2,
    SAFE_CAST(MATRICULA3 AS STRING) AS matricula3,
    SAFE_CAST(AGENCIAFGTS AS STRING) AS agenciafgts,
    SAFE_CAST(SAFE.PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%E*S',DTFIMCLASSE) AS DATE) AS dtfimclasse,
    SAFE_CAST(SAFE.PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%E*S',DTINICLASSE) AS DATE) AS dtiniclasse,
    SAFE_CAST(REGEXP_REPLACE(CAST(ID_INGRESSO AS STRING), r'\.0$', '') AS STRING) AS id_ingresso,
    SAFE_CAST(SAFE.PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%E*S',DT_SALDO_FGTS) AS DATE) AS dt_saldo_fgts,
    SAFE_CAST(FLEX_CAMPO_02 AS STRING) AS flex_campo_02,
    SAFE_CAST(FLEX_CAMPO_03 AS STRING) AS flex_campo_03,
    SAFE_CAST(FLEX_CAMPO_04 AS STRING) AS flex_campo_04,
    SAFE_CAST(FLEX_CAMPO_06 AS STRING) AS flex_campo_06,
    SAFE_CAST(FLEX_CAMPO_07 AS STRING) AS flex_campo_07,
    SAFE_CAST(FLEX_CAMPO_08 AS STRING) AS flex_campo_08,
    SAFE_CAST(FLEX_CAMPO_10 AS STRING) AS flex_campo_10,
    SAFE_CAST(FLEX_CAMPO_11 AS STRING) AS flex_campo_11,
    SAFE_CAST(FLEX_CAMPO_12 AS STRING) AS flex_campo_12,
    SAFE_CAST(FLEX_CAMPO_13 AS STRING) AS flex_campo_13,
    SAFE_CAST(FLEX_CAMPO_14 AS STRING) AS flex_campo_14,
    SAFE_CAST(FLEX_CAMPO_15 AS STRING) AS flex_campo_15,
    SAFE_CAST(FLEX_CAMPO_16 AS STRING) AS flex_campo_16,
    SAFE_CAST(FLEX_CAMPO_19 AS STRING) AS flex_campo_19,
    SAFE_CAST(FLEX_CAMPO_20 AS STRING) AS flex_campo_20,
    SAFE_CAST(VALOR_DEP_FGTS AS STRING) AS valor_dep_fgts,
    SAFE_CAST(REGEXP_REPLACE(CAST(NUMERO_PERMUT_1 AS STRING), r'\.0$', '') AS STRING) AS numero_permut_1,
    SAFE_CAST(REGEXP_REPLACE(CAST(NUMERO_PERMUT_2 AS STRING), r'\.0$', '') AS STRING) AS numero_permut_2,
    SAFE_CAST(REGEXP_REPLACE(CAST(NUMFUNC_PERMUT_1 AS STRING), r'\.0$', '') AS STRING) AS numfunc_permut_1,
    SAFE_CAST(REGEXP_REPLACE(CAST(NUMFUNC_PERMUT_2 AS STRING), r'\.0$', '') AS STRING) AS numfunc_permut_2,
    SAFE_CAST(REGEXP_REPLACE(CAST(PROJETO_ATIVIDADE AS STRING), r'\.0$', '') AS STRING) AS projeto_atividade,
    SAFE_CAST(FATOR_PROPORC_APOSENT AS STRING) AS fator_proporc_aposent
FROM {{ source('brutos_ergon_staging', 'VW_DLK_ERG_VINCULOS')}}