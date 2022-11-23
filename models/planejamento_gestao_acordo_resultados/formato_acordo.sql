SELECT
    SAFE_CAST(ano AS INT64) as ano,
    SAFE_CAST(formato_acordo AS STRING) as formato,
    SAFE_CAST(performance AS BOOL) as performance,
    SAFE_CAST(ano_pagamento AS INT64) as ano_pagamento,
    SAFE_CAST(justificativa_da_falta_de_pagamento AS STRING) as justificativa_pagamento,
    SAFE_CAST(nota_minima_para_bonificacao AS FLOAT64) as nota_minima_bonificacao,
    SAFE_CAST(bonificacao_minima_sem_auditoria AS FLOAT64) as bonificação_minima,
    SAFE_CAST(bonificacao_minima_sem_auditoria1 AS FLOAT64) as bonificação_maxima
FROM `planejamento_gestao_acordo_resultados_staging.formato_acordo`