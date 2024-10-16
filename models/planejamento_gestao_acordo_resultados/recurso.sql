SELECT
    SAFE_CAST(SAFE_CAST(SAFE_CAST(cod_recurso AS FLOAT64) AS INT64) AS STRING) as id_recurso,
    SAFE_CAST(ano_do_acordo_a_que_se_refere_o_recurso AS INT64) as ano,
    SAFE_CAST(orgao_solicitante AS STRING) as orgao,
    SAFE_CAST(SAFE_CAST(SAFE_CAST(cod_meta AS FLOAT64) AS INT64) AS STRING) as codigo_meta,
    SAFE_CAST(orgao_acordo_egpweb AS STRING) as orgao_egpweb,    
    SAFE_CAST(oficio AS STRING) as oficio,
    SAFE_CAST(codigo_processorio AS STRING) as codigo_processorio,
    SAFE_CAST(data_solicitacao AS DATE FORMAT 'DD/MM/YYYY') as data_solicitacao,
    SAFE_CAST(meta AS STRING) as descricao_meta,
    SAFE_CAST(pedido AS STRING) as pedido_recurso,
    SAFE_CAST(recomendacao_egp AS STRING) as recomendacao_egp,
    SAFE_CAST(avaliacao_egp AS BOOL) as avaliacao_egp,
    SAFE_CAST(SAFE_CAST(tipo_do_recurso AS FLOAT64) AS INT64) as tipo_recurso,
    SAFE_CAST(decisao_do_prefeito AS BOOL) as indicador_decisao_recurso
FROM rj-smfp.planejamento_gestao_acordo_resultados_staging.recurso
