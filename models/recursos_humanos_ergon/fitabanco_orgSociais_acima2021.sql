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
    SAFE_CAST(mes_ano_folha AS DATE) data_folha,
    SAFE_CAST(numfunc||numvinc AS STRING) id_funcao,
    SUM(SAFE_CAST(valor AS FLOAT64)) valor_bruto,
    SAFE_CAST(emp_codigo AS INT64) id_empresa,
    SAFE_CAST(data_particao AS DATE) data_particao
FROM rj-smfp.recursos_humanos_ergon_staging.ficha_financeira_contabil AS t
JOIN (
    SELECT SAFE_CAST(id_empresa AS INT64) empresa,
      nome_empresa
    FROM `rj-smfp.recursos_humanos_ergon.empresas`
    ORDER BY CAST(id_empresa AS INT64) 
)sel1
    ON SAFE_CAST(ffc.emp_codigo AS INT64) = sel1.empresa
WHERE EXTRACT(year FROM SAFE_CAST(mes_ano_folha AS date)) >= 2021
    AND sel1.empresa >= 80
    AND desc_vant = '1'
    AND data_particao < CURRENT_DATE('America/Sao_Paulo')
GROUP BY id_empresa,
    data_folha,
    id_funcao

{% if is_incremental() %}

{% set max_partition = run_query("SELECT gr FROM (SELECT IF(max(data_particao) > CURRENT_DATE('America/Sao_Paulo'), CURRENT_DATE('America/Sao_Paulo'), max(data_particao)) as gr FROM " ~ this ~ ")").columns[0].values()[0] %}

AND
    data_particao > ("{{ max_partition }}")

{% endif %}