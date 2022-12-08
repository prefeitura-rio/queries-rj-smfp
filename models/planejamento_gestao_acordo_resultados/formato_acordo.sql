SELECT
    SAFE_CAST(ano AS INT64) as ano,
    SAFE_CAST(formato_acordo AS STRING) as formato,
    CASE
        WHEN performance = "TRUE" THEN TRUE
        WHEN performance = "FALSE" THEN FALSE 
        WHEN performance = "VERDADEIRO" THEN TRUE
        WHEN performance = "FALSO" THEN FALSE
        ELSE NULL         
    END as indicador_performance,
    SAFE_CAST(SAFE_CAST(ano_pagamento AS FLOAT64) AS INT64) as ano_pagamento,
    SAFE_CAST(justificativa_da_falta_de_pagamento AS STRING) as justificativa_pagamento,
    SAFE_CAST(REPLACE(nota_minima_para_bonificacao, ",", ".") AS FLOAT64) as nota_minima_bonificacao,
    SAFE_CAST(REPLACE(bonificacao_minima_sem_auditoria, ",", ".") AS FLOAT64) as bonificacao_minima,
    SAFE_CAST(REPLACE(bonificacao_maxima_sem_auditoria, ",", ".") AS FLOAT64) as bonificacao_maxima
FROM `rj-smfp.planejamento_gestao_acordo_resultados_staging.formato_acordo`