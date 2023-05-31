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
    SAFE_CAST(mes_ano AS DATE) data_folha,
    SAFE_CAST(numfunc||numvinc AS STRING) id_funcao,
    SAFE_CAST(valorvan AS FLOAT64) valor_bruto,
    SAFE_CAST(emp_codigo AS INT64) id_empresa,
    SAFE_CAST(setor AS INT64) id_setor,
    SAFE_CAST(data_particao AS DATE) data_particao
FROM rj-smfp.recursos_humanos_ergon_comlurb_staging.fita_banco AS t 
WHERE EXTRACT(year FROM SAFE_CAST(mes_ano AS date)) >= 2021
        AND emp_codigo = '1'
        AND data_particao < CURRENT_DATE('America/Sao_Paulo')

{% if is_incremental() %}

{% set max_partition = run_query("SELECT gr FROM (SELECT IF(max(data_particao) > CURRENT_DATE('America/Sao_Paulo'), CURRENT_DATE('America/Sao_Paulo'), max(data_particao)) as gr FROM " ~ this ~ ")").columns[0].values()[0] %}

AND
    data_particao > ("{{ max_partition }}")

{% endif %}