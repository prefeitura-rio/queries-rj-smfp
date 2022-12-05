SELECT
    SAFE_CAST(ano AS INT64) as ano,
    SAFE_CAST(codchance AS INT64) as codigo_chance,
    SAFE_CAST(corchance AS STRING) as cor_chance,
    SAFE_CAST(descricao_ar AS STRING) as legenda_chance_ar,    
    SAFE_CAST(descricao_unificada_pe_ar AS STRING) as legenda_chance_unificada,
    SAFE_CAST(caso AS INT64) as caso
FROM `planejamento_gestao_acordo_resultados_staging.avaliacao_meta`