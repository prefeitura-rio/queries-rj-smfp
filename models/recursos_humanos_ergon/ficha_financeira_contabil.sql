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
    SAFE_CAST(REGEXP_REPLACE(TRIM(numfunc), r'.0$', '') AS STRING) AS id_funcionario,
    SAFE_CAST(REGEXP_REPLACE(TRIM(numvinc), r'.0$', '') AS STRING) AS id_vinculo,
    SAFE_CAST(REGEXP_REPLACE(TRIM(numpens), r'.0$', '') AS INT64) AS numero_pensionista,
    SAFE_CAST(TRIM(num_folha) AS STRING) AS numero_folha,
    SAFE_CAST(REGEXP_REPLACE(TRIM(setor), r'.0$', '') AS STRING) AS id_setor,
    SAFE_CAST(TRIM(secretaria) AS STRING) AS secretaria,
    SAFE_CAST(TRIM(tipo_func) AS STRING) AS tipo_funcionario,
    SAFE_CAST(TRIM(detalha) AS STRING) AS detalhamento,
    SAFE_CAST(TRIM(rubrica) AS STRING) AS rubrica,
    SAFE_CAST(TRIM(tipo_rubrica) AS STRING) AS tipo_rubrica,
    SAFE_CAST(TRIM(mes_ano_direito) AS STRING) AS competencia_direito,
    SAFE_CAST(TRIM(desc_vant) AS STRING) AS descricao_vantagem,
    SAFE_CAST(REGEXP_REPLACE(valor, r',', '.') AS FLOAT64) AS valor,
    SAFE_CAST(TRIM(complemento) AS STRING) AS complemento,
    SAFE_CAST(TRIM(tipo_classif) AS STRING) AS tipo_classificacao,
    SAFE_CAST(TRIM(classificacao) AS STRING) AS classificacao,
    SAFE_CAST(REGEXP_REPLACE(TRIM(emp_codigo), r'.0$', '') AS STRING) AS id_empresa,
    SAFE_CAST(data_particao AS DATE) data_particao,
FROM rj-smfp.recursos_humanos_ergon_staging.ficha_financeira_contabil AS t
WHERE
    data_particao < CURRENT_DATE('America/Sao_Paulo')

{% if is_incremental() %}

{% set max_partition = run_query("SELECT gr FROM (SELECT IF(max(data_particao) > CURRENT_DATE('America/Sao_Paulo'), CURRENT_DATE('America/Sao_Paulo'), max(data_particao)) as gr FROM " ~ this ~ ")").columns[0].values()[0] %}

AND
    data_particao > ("{{ max_partition }}")

{% endif %}
