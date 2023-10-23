{{ 
    config( alias='funcionario',schema='recursos_humanos_ergon_comlurb') 
}}

SELECT 
    SAFE_CAST(TRIM(flex_campo_10) AS STRING) AS emissor_rne,
    SAFE_CAST(PARSE_DATE("%d/%m/%Y",REGEXP_REPLACE(flex_campo_11, "//", "/")) AS DATE) AS data_expedicao_rne,
    SAFE_CAST(PARSE_DATE("%d/%m/%Y",REGEXP_REPLACE(flex_campo_12, "//", "/")) AS DATE) AS data_chegada_brasil,
    SAFE_CAST(PARSE_DATE("%d/%m/%Y",REGEXP_REPLACE(flex_campo_13, "//", "/")) AS DATE) AS data_naturalizacao,
    SAFE_CAST(TRIM(flex_campo_14) AS STRING) AS casado_brasileiro,
    SAFE_CAST(TRIM(flex_campo_15) AS STRING) AS filho_brasileiro,
    SAFE_CAST(TRIM(flex_campo_90) AS STRING) AS email_alternativo,
    SAFE_CAST(REGEXP_REPLACE(TRIM(numero), r'\.0$', '') AS STRING) AS id_vinculo,
    SAFE_CAST(TRIM(nome) AS STRING) AS nome,
    SAFE_CAST(TRIM(flex_campo_03) AS STRING) AS nome_complementar,
    SAFE_CAST(TRIM(sexo) AS STRING) AS sexo,
    SAFE_CAST(DATE(dtnasc) AS DATE) AS data_nascimento,
    SAFE_CAST(TRIM(flex_campo_16) AS STRING) AS trabalho_voluntario,
    SAFE_CAST(TRIM(flex_campo_17) AS STRING) AS interesse_trabalho_voluntario,
    SAFE_CAST(TRIM(flex_campo_18) AS STRING) AS interesse_projeto_olimpico,
    SAFE_CAST(TRIM(flex_campo_19) AS STRING) AS interesse_projeto_social,
    SAFE_CAST(TRIM(flex_campo_20) AS STRING) AS login_facebook,
    SAFE_CAST(TRIM(flex_campo_21) AS STRING) AS login_twitter,
    SAFE_CAST(TRIM(flex_campo_22) AS STRING) AS login_google_plus,
    SAFE_CAST(TRIM(flex_campo_23) AS STRING) AS login_instagram,
    SAFE_CAST(TRIM(flex_campo_24) AS STRING) AS login_linkedin,
    SAFE_CAST(TRIM(flex_campo_25) AS STRING) AS login_myspace,
    SAFE_CAST(TRIM(flex_campo_26) AS STRING) AS emissor_cnh,
    SAFE_CAST(PARSE_DATE("%d/%m/%Y",REGEXP_REPLACE(flex_campo_27, "//", "/")) AS DATE) AS data_expedicao_cnh,
    SAFE_CAST(PARSE_DATE("%d/%m/%Y",REGEXP_REPLACE(flex_campo_28, "//", "/")) AS DATE) AS data_expedicao_orgao_classe,
    SAFE_CAST(TRIM(flex_campo_30) AS STRING) AS emissor_orgao_classe,
    SAFE_CAST(PARSE_DATE("%d/%m/%Y",REGEXP_REPLACE(flex_campo_36, "//", "/")) AS DATE) AS data_ultima_atualizaca_bancaria,
    SAFE_CAST(REGEXP_REPLACE(TRIM(flex_campo_40), r'\.0$', '') AS STRING) AS id_nis,
    SAFE_CAST(TRIM(raca) AS STRING) AS raca_cor,
    SAFE_CAST(TRIM(deficiente) AS STRING) AS deficiente,
    SAFE_CAST(TRIM(uf_cart) AS STRING) AS sigla_uf_cartorio_certidao_civil,
    SAFE_CAST(TRIM(cidnasc) AS STRING) AS municipio_nascimento,
    SAFE_CAST(TRIM(ufnasc) AS STRING) AS sigla_uf_nascimento,
    SAFE_CAST(TRIM(g_sanguineo) AS STRING) AS grupo_sanguineo,
    SAFE_CAST(TRIM(pai) AS STRING) AS nome_pai,
    SAFE_CAST(TRIM(mae) AS STRING) AS nome_mae,
    SAFE_CAST(REGEXP_REPLACE(TRIM(chegbrasil), r'\.0$', '') AS INT64) AS ano_chegada_brasil,
    SAFE_CAST(TRIM(ufempant) AS STRING) AS sigla_uf_emprego_anterior,
    SAFE_CAST(REGEXP_REPLACE(TRIM(anoprimemp), r'\.0$', '') AS INT64) AS ano_primeiro_emprego,
    SAFE_CAST(REGEXP_REPLACE(TRIM(identprof), r'\.0$', '') AS STRING) AS id_identidade_profissional,
    SAFE_CAST(TRIM(catmili) AS STRING) AS categoria_documento_militar,
    SAFE_CAST(TRIM(municipio_cart_cod) AS STRING) AS municipio_certidao_civil,
    SAFE_CAST(TRIM(cidadeender_cod) AS STRING) AS municipio_logradouro,
    SAFE_CAST(REGEXP_REPLACE(TRIM(flex_campo_06), r'\.0$', '') AS STRING) AS id_ric,
    SAFE_CAST(TRIM(flex_campo_07) AS STRING) AS orgao_ric,
    SAFE_CAST(PARSE_DATE("%d/%m/%Y",REGEXP_REPLACE(flex_campo_08, "//", "/")) AS DATE) AS data_ric,
    SAFE_CAST(REGEXP_REPLACE(TRIM(flex_campo_09), r'\.0$', '') AS STRING) AS id_rne,
    SAFE_CAST(REGEXP_REPLACE(TRIM(numrg), r'\.0$', '') AS STRING) AS id_rg,
    SAFE_CAST(TRIM(tiporg) AS STRING) AS tipo_rg,
    SAFE_CAST(TRIM(orgaorg) AS STRING) AS emissor_rg,
    SAFE_CAST(TRIM(municipio_cart) AS STRING) AS municipio_cartorio_certidao_civil,
    SAFE_CAST(TRIM(tipodoc_cert) AS STRING) AS tipo_certidao_civil,
    SAFE_CAST(TRIM(uf_identprof) AS STRING) AS sigla_uf_orgao_classe,
    SAFE_CAST(DATE(expedrg) AS DATE) AS data_expedicao_rg,
    SAFE_CAST(TRIM(orgaomili) AS STRING) AS emissor_documento_militar,
    SAFE_CAST(TRIM(ufdocmili) AS STRING) AS sigla_uf_documento_militar,
    SAFE_CAST(TRIM(tipodefic) AS STRING) AS tipo_deficiencia,
    SAFE_CAST(TRIM(matricula_cert) AS STRING) AS matricula_certidao,
    SAFE_CAST(TRIM(flex_campo_51) AS STRING) AS deficiencia_fisica,
    SAFE_CAST(TRIM(flex_campo_52) AS STRING) AS deficiencia_visual,
    SAFE_CAST(TRIM(flex_campo_53) AS STRING) AS deficiencia_auditiva,
    SAFE_CAST(TRIM(flex_campo_54) AS STRING) AS deficiencia_mental,
    SAFE_CAST(TRIM(flex_campo_55) AS STRING) AS deficiencia_intelectual,
    SAFE_CAST(TRIM(flex_campo_56) AS STRING) AS recebe_beneficio_previdenciario,
    SAFE_CAST(TRIM(flex_campo_58) AS STRING) AS nome_posse,
    SAFE_CAST(TRIM(flex_campo_59) AS STRING) AS sexo_posse,
    SAFE_CAST(PARSE_DATE("%d/%m/%Y",REGEXP_REPLACE(flex_campo_60, "//", "/")) AS DATE) AS data_alteracao_sexo,
    SAFE_CAST(TRIM(flex_campo_69) AS STRING) AS pais_nascimento,
    SAFE_CAST(PARSE_DATE("%d/%m/%Y",REGEXP_REPLACE(flex_campo_70, "//", "/")) AS DATE) AS data_primeiro_emprego,
    SAFE_CAST(PARSE_DATE("%d/%m/%Y",REGEXP_REPLACE(flex_campo_80, "//", "/")) AS DATE) AS data_primeira_cnh,
    SAFE_CAST(TRIM(flex_campo_89) AS STRING) AS cep_exterior,
    SAFE_CAST(TRIM(estcivil) AS STRING) AS estado_civil,
    SAFE_CAST(TRIM(escolaridade) AS STRING) AS escolaridade,
    SAFE_CAST(TRIM(nacionalidade) AS STRING) AS nacionalidade,
    SAFE_CAST(TRIM(ufrg) AS STRING) AS sigla_uf_emissor_rg,
    SAFE_CAST(REGEXP_REPLACE(TRIM(cpf), r'\.0$', '') AS STRING) AS id_cpf,
    SAFE_CAST(REGEXP_REPLACE(TRIM(numcartpro), r'\.0$', '') AS STRING) AS id_ctps,
    SAFE_CAST(TRIM(sercartpro) AS STRING) AS serie_ctps,
    SAFE_CAST(TRIM(ufcartpro) AS STRING) AS sigla_uf_ctps,
    SAFE_CAST(REGEXP_REPLACE(TRIM(numtitel), r'\.0$', '') AS STRING) AS id_titulo_eleitor,
    SAFE_CAST(TRIM(zonatitel) AS STRING) AS zona_eleitoral,
    SAFE_CAST(TRIM(sectitel) AS STRING) AS secao_eleitoral,
    SAFE_CAST(TRIM(uftitel) AS STRING) AS sigla_uf_titulo_eleitor,
    SAFE_CAST(REGEXP_REPLACE(TRIM(numdocmili), r'\.0$', '') AS STRING) AS id_documento_militar,
    SAFE_CAST(TRIM(serdocmili) AS STRING) AS serie_documento_militar,
    SAFE_CAST(REGEXP_REPLACE(TRIM(cnh), r'\.0$', '') AS STRING) AS id_cnh,
    SAFE_CAST(TRIM(catcnh) AS STRING) AS categoria_cnh,
    SAFE_CAST(DATE(validcnh) AS DATE) AS validade_cnh,
    SAFE_CAST(TRIM(ufcnh) AS STRING) AS sigla_uf_cnh,
    SAFE_CAST(REGEXP_REPLACE(TRIM(pispasep), r'\.0$', '') AS STRING) AS id_pispasep,
    SAFE_CAST(DATE(datapis) AS DATE) AS data_inicio_nis,
    SAFE_CAST(TRIM(bancopis) AS STRING) AS numero_banco_nis,
    SAFE_CAST(TRIM(tipoidprof) AS STRING) AS tipo_identidade_profissional,
    SAFE_CAST(TRIM(tipologender) AS STRING) AS tipo_logradouro,
    SAFE_CAST(TRIM(nomelogender) AS STRING) AS logradouro,
    SAFE_CAST(REGEXP_REPLACE(TRIM(numender), r'\.0$', '') AS INT64) AS numero_porta,
    SAFE_CAST(TRIM(complender) AS STRING) AS complemento_numero_porta,
    SAFE_CAST(TRIM(bairroender) AS STRING) AS bairro,
    SAFE_CAST(TRIM(cidadeender) AS STRING) AS municipio,
    SAFE_CAST(TRIM(ufender) AS STRING) AS sigla_uf,
    SAFE_CAST(TRIM(cepender) AS STRING) AS cep,
    SAFE_CAST(TRIM(telefone) AS STRING) AS telefone,
    SAFE_CAST(TRIM(banco) AS STRING) AS banco,
    SAFE_CAST(TRIM(agencia) AS STRING) AS agencia,
    SAFE_CAST(TRIM(conta) AS STRING) AS conta,
    SAFE_CAST(TRIM(num_cert) AS STRING) AS numero_certidao,
    SAFE_CAST(TRIM(livro_a_cert) AS STRING) AS livro_certidao,
    SAFE_CAST(TRIM(folha_cert) AS STRING) AS folha_certidao,
    SAFE_CAST(TRIM(cartorio_cert) AS STRING) AS cartorio_certidao,
    SAFE_CAST(TRIM(ramal) AS STRING) AS ramal,
    SAFE_CAST(TRIM(tratamento) AS STRING) AS nome_tratamento,
    SAFE_CAST(TRIM(e_mail) AS STRING) AS email,
    SAFE_CAST(TRIM(numtel_celular) AS STRING) AS celular,
    SAFE_CAST(TRIM(flex_campo_02) AS STRING) AS impedimento,
    SAFE_CAST(REGEXP_REPLACE(id_reg, r'\.0$', '') AS STRING) AS id_registro,
    SAFE_CAST(REGEXP_REPLACE(id_pessoa, r'\.0$', '') AS STRING) AS id_pessoa,
    SAFE_CAST(TRIM(nome_busca) AS STRING) AS nome_busca,
    SAFE_CAST(DATE(TRIM(dt_recadast)) AS DATE) AS data_recadastramento,




    -- review this fields
    SAFE_CAST(TRIM(informarbb) AS STRING) AS informarbb,
    SAFE_CAST(TRIM(tipopag) AS STRING) AS tipopag,
    SAFE_CAST(TRIM(foto) AS STRING) AS foto,
    SAFE_CAST(TRIM(pontpubl) AS STRING) AS pontpubl,
    SAFE_CAST(TRIM(flag_web) AS STRING) AS flag_web,
    SAFE_CAST(TRIM(tipodoc_cert_fim) AS STRING) AS tipodoc_cert_fim,
    SAFE_CAST(TRIM(dt_cert_fim) AS STRING) AS dt_cert_fim,
    SAFE_CAST(TRIM(num_cert_fim) AS STRING) AS num_cert_fim,
    SAFE_CAST(TRIM(livro_cert_fim) AS STRING) AS livro_cert_fim,
    SAFE_CAST(TRIM(folha_cert_fim) AS STRING) AS folha_cert_fim,
    SAFE_CAST(TRIM(cartorio_cert_fim) AS STRING) AS cartorio_cert_fim,
    SAFE_CAST(TRIM(uf_cart_fim) AS STRING) AS uf_cart_fim,
    SAFE_CAST(TRIM(municipio_cart_fim) AS STRING) AS municipio_cart_fim,
    SAFE_CAST(TRIM(gera_pasep) AS STRING) AS gera_pasep,
    SAFE_CAST(TRIM(matricula_cert_fim) AS STRING) AS matricula_cert_fim,
    SAFE_CAST(TRIM(municipio_cart_fim_cod) AS STRING) AS municipio_cart_fim_cod,
    SAFE_CAST(TRIM(pontarqs) AS STRING) AS pontarqs,






    SAFE_CAST(TRIM(flex_campo_01) AS STRING) AS flex_campo_01,
    SAFE_CAST(TRIM(flex_campo_04) AS STRING) AS flex_campo_04,
    SAFE_CAST(TRIM(flex_campo_05) AS STRING) AS flex_campo_05,
    SAFE_CAST(TRIM(flex_campo_29) AS STRING) AS flex_campo_29,
    SAFE_CAST(TRIM(flex_campo_31) AS STRING) AS flex_campo_31,
    SAFE_CAST(TRIM(flex_campo_32) AS STRING) AS flex_campo_32,
    SAFE_CAST(TRIM(flex_campo_33) AS STRING) AS flex_campo_33,
    SAFE_CAST(TRIM(flex_campo_34) AS STRING) AS flex_campo_34,
    SAFE_CAST(TRIM(flex_campo_35) AS STRING) AS flex_campo_35,
    SAFE_CAST(TRIM(flex_campo_37) AS STRING) AS flex_campo_37,
    SAFE_CAST(TRIM(flex_campo_38) AS STRING) AS flex_campo_38,
    SAFE_CAST(TRIM(flex_campo_39) AS STRING) AS flex_campo_39,
    SAFE_CAST(TRIM(flex_campo_41) AS STRING) AS flex_campo_41,
    SAFE_CAST(TRIM(flex_campo_42) AS STRING) AS flex_campo_42,
    SAFE_CAST(TRIM(flex_campo_43) AS STRING) AS flex_campo_43,
    SAFE_CAST(TRIM(flex_campo_44) AS STRING) AS flex_campo_44,
    SAFE_CAST(TRIM(flex_campo_45) AS STRING) AS flex_campo_45,
    SAFE_CAST(TRIM(flex_campo_46) AS STRING) AS flex_campo_46,
    SAFE_CAST(TRIM(flex_campo_47) AS STRING) AS flex_campo_47,
    SAFE_CAST(TRIM(flex_campo_48) AS STRING) AS flex_campo_48,
    SAFE_CAST(TRIM(flex_campo_49) AS STRING) AS flex_campo_49,
    SAFE_CAST(TRIM(flex_campo_50) AS STRING) AS flex_campo_50,
    SAFE_CAST(TRIM(flex_campo_57) AS STRING) AS flex_campo_57,
    SAFE_CAST(TRIM(flex_campo_61) AS STRING) AS flex_campo_61,
    SAFE_CAST(TRIM(flex_campo_62) AS STRING) AS flex_campo_62,
    SAFE_CAST(TRIM(flex_campo_63) AS STRING) AS flex_campo_63,
    SAFE_CAST(TRIM(flex_campo_64) AS STRING) AS flex_campo_64,
    SAFE_CAST(TRIM(flex_campo_65) AS STRING) AS flex_campo_65,
    SAFE_CAST(TRIM(flex_campo_66) AS STRING) AS flex_campo_66,
    SAFE_CAST(TRIM(flex_campo_67) AS STRING) AS flex_campo_67,
    SAFE_CAST(TRIM(flex_campo_68) AS STRING) AS flex_campo_68,
    SAFE_CAST(TRIM(flex_campo_71) AS STRING) AS flex_campo_71,
    SAFE_CAST(TRIM(flex_campo_72) AS STRING) AS flex_campo_72,
    SAFE_CAST(TRIM(flex_campo_73) AS STRING) AS flex_campo_73,
    SAFE_CAST(TRIM(flex_campo_74) AS STRING) AS flex_campo_74,
    SAFE_CAST(TRIM(flex_campo_75) AS STRING) AS flex_campo_75,
    SAFE_CAST(TRIM(flex_campo_76) AS STRING) AS flex_campo_76,
    SAFE_CAST(TRIM(flex_campo_77) AS STRING) AS flex_campo_77,
    SAFE_CAST(TRIM(flex_campo_78) AS STRING) AS flex_campo_78,
    SAFE_CAST(TRIM(flex_campo_79) AS STRING) AS flex_campo_79,
    SAFE_CAST(TRIM(flex_campo_81) AS STRING) AS flex_campo_81,
    SAFE_CAST(TRIM(flex_campo_82) AS STRING) AS flex_campo_82,
    SAFE_CAST(TRIM(flex_campo_83) AS STRING) AS flex_campo_83,
    SAFE_CAST(TRIM(flex_campo_84) AS STRING) AS flex_campo_84,
    SAFE_CAST(TRIM(flex_campo_85) AS STRING) AS flex_campo_85,
    SAFE_CAST(TRIM(flex_campo_86) AS STRING) AS flex_campo_86,
    SAFE_CAST(TRIM(flex_campo_87) AS STRING) AS flex_campo_87,
    SAFE_CAST(TRIM(flex_campo_88) AS STRING) AS flex_campo_88,
    SAFE_CAST(TRIM(flex_campo_91) AS STRING) AS flex_campo_91,
    SAFE_CAST(TRIM(flex_campo_92) AS STRING) AS flex_campo_92,
    SAFE_CAST(TRIM(flex_campo_93) AS STRING) AS flex_campo_93,
    SAFE_CAST(TRIM(flex_campo_94) AS STRING) AS flex_campo_94,
    SAFE_CAST(TRIM(flex_campo_95) AS STRING) AS flex_campo_95,
    SAFE_CAST(TRIM(flex_campo_96) AS STRING) AS flex_campo_96,
    SAFE_CAST(TRIM(flex_campo_97) AS STRING) AS flex_campo_97,
    SAFE_CAST(TRIM(flex_campo_98) AS STRING) AS flex_campo_98,
    SAFE_CAST(TRIM(flex_campo_99) AS STRING) AS flex_campo_99,
    SAFE_CAST(TRIM(flex_campo_100) AS STRING) AS flex_campo_100,





FROM rj-smfp.recursos_humanos_ergon_comlurb_staging.funcionario AS t