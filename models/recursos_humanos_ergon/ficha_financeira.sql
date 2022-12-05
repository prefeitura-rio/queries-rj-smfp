
{{
    config(
        materialized='incremental',
        partition_by={
            "field": "data_particao",
            "data_type": "date",
            "granularity": "month",
        }
    )
}}

SELECT 
    SAFE_CAST(DATE(mes_ano_folha) AS DATE) AS data_folha,
    SAFE_CAST(REGEXP_REPLACE(TRIM(num_folha), r'\.0$', '') AS INT64) AS numero_folha,
    SAFE_CAST(REGEXP_REPLACE(TRIM(numfunc), r'\.0$', '') AS STRING) AS id_funcionario,
    SAFE_CAST(REGEXP_REPLACE(TRIM(numvinc), r'\.0$', '') AS STRING) AS id_vinculo,
    SAFE_CAST(REGEXP_REPLACE(TRIM(numpens), r'\.0$', '') AS INT64) AS numero_pensionista,
    SAFE_CAST(TRIM(mes_ano_direito) AS STRING) AS data_pagamento,
    SAFE_CAST(TRIM(rubrica) AS STRING) AS rubrica,
    SAFE_CAST(TRIM(tipo_rubr) AS STRING) AS tipo_rubrica,
    SAFE_CAST(TRIM(desc_vant) AS STRING) AS desconto,
    SAFE_CAST(TRIM(complemento) AS STRING) AS complemento_rubrica,
    SAFE_CAST(REGEXP_REPLACE(valor, r',', '.') AS FLOAT64) AS valor_rubrica,    SAFE_CAST(REGEXP_REPLACE(correcao, r',', '.') AS FLOAT64) AS correcao,    SAFE_CAST(REGEXP_REPLACE(TRIM(emp_codigo), r'\.0$', '') AS STRING) AS id_empresa,
    SAFE_CAST(data_particao AS DATE) data_particao,
FROM rj-smfp.recursos_humanos_ergon_staging.ficha_financeira AS t
WHERE
    data_particao < CURRENT_DATE('America/Sao_Paulo')

{% if is_incremental() %}

{% set max_partition = run_query("SELECT gr FROM (SELECT IF(max(data_particao) > CURRENT_DATE('America/Sao_Paulo'), CURRENT_DATE('America/Sao_Paulo'), max(data_particao)) as gr FROM " ~ this ~ ")").columns[0].values()[0] %}

AND
    data_particao > ("{{ max_partition }}")

{% endif %}