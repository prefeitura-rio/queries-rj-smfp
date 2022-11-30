WITH first_level_treatment AS (
    SELECT
        SAFE_CAST(exercicio AS INT64) ano_competencia,
        SAFE_CAST(valor_lancado AS FLOAT64) valor_lancado,
        SAFE_CAST(valor_pago AS FLOAT64) valor_pago,
        SAFE_CAST(valor_devido AS FLOAT64) valor_devido,
        SAFE_CAST(tipoguia AS STRING) tipo_guia,
        `rj-smfp.iptu_inadimplentes_staging`.tradutor_bairro(SAFE_CAST(bairro AS STRING)) bairro,
        SAFE_CAST(statuslancamentoiptu AS STRING) status_lancamento_iptu,
        SAFE_CAST(areaplanejamento AS STRING) area_planejamento,
        SAFE_CAST(geo_zona AS STRING) zona_cidade,
        SAFE_CAST(geo_regiaoadmin AS STRING) regiao_administrativa,
        SAFE_CAST(geo_regiaofiscal AS STRING) regiao_fiscal,
        SAFE_CAST(idadeano AS INT64) ano_construcao_imovel,
        `rj-smfp.iptu_inadimplentes_staging`.tradutor_situacao_terreno(SAFE_CAST(situacaoterreno AS STRING)) situacao_terreno,
        SAFE_CAST(tipologia AS STRING) tipologia,
        SAFE_CAST(utilizacaoprincipal AS STRING) utilizacao_principal,
        SAFE_CAST(areatributadanaoresidencial AS FLOAT64) area_tributada_nao_residencial,
        SAFE_CAST(areatributadaresidencial AS FLOAT64) area_tributada_residencial,
        SAFE_CAST(areatributadaterritorial AS FLOAT64) area_tributada_territorial,
        SAFE_CAST(areaterreno AS FLOAT64) area_terreno,
        SAFE_CAST(val_isentoiptu_isencao AS FLOAT64) valor_isento_iptu,
        SAFE_CAST(tributacao AS STRING) tributacao,
        SAFE_CAST(arearesidencial AS FLOAT64) area_residencial,
        SAFE_CAST(areanaoresidencial AS FLOAT64) area_nao_residencial,
        SAFE_CAST(inscimobiliaria AS STRING) inscricao_imobiliaria,
    FROM `rj-smfp.iptu_inadimplentes_staging.perfil_inadimplente`
)

SELECT
    iptu.ano_competencia,
    iptu.valor_lancado,
    iptu.valor_pago,
    iptu.valor_devido,
    iptu.tipo_guia,
    b.id_bairro,
    iptu.bairro,
    b.geometria as bairro_geometria,
    b.id_area_planejamento,
    b.id_regiao_planejamento,
    b.id_regiao_administrativa,
    b.nome_regiao_administrativa,
    b.subprefeitura,
    iptu.status_lancamento_iptu,
    iptu.area_planejamento,
    iptu.zona_cidade,
    iptu.regiao_administrativa,
    iptu.regiao_fiscal,
    iptu.ano_construcao_imovel,
    iptu.situacao_terreno,
    iptu.tipologia,
    iptu.utilizacao_principal,
    iptu.area_tributada_nao_residencial,
    iptu.area_tributada_residencial,
    iptu.area_tributada_territorial,
    iptu.area_terreno,
    iptu.valor_isento_iptu,
    iptu.tributacao,
    iptu.area_residencial,
    iptu.area_nao_residencial,
    iptu.inscricao_imobiliaria,
FROM first_level_treatment as iptu
LEFT JOIN `datario.dados_mestres.bairro` as b
  ON LOWER(TRIM(iptu.bairro)) = `rj-smfp.iptu_inadimplentes_staging`.remove_accents(LOWER(TRIM(b.nome)))