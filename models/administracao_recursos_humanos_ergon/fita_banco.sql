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
    SAFE_CAST(REGEXP_REPLACE(lancamento, r'\.0$', '') AS STRING) AS id_lancamento,
    SAFE_CAST(mes_ano AS DATE) AS data_folha,
    SAFE_CAST(dtexerc AS DATE) AS data_exercicio,
    SAFE_CAST(dtaposent AS DATE) AS data_aposentadoria,
    SAFE_CAST(dtvac AS DATE) AS data_vacancia,
    SAFE_CAST(data_credito AS DATE) AS data_credito,
    SAFE_CAST(REGEXP_REPLACE(numfunc, r'\.0$', '') AS STRING) AS id_funcao,
    SAFE_CAST(REGEXP_REPLACE(numvinc, r'\.0$', '') AS STRING) AS id_vinculo,
    SAFE_CAST(REGEXP_REPLACE(numero, r'\.0$', '') AS INT64) AS numero_folha,
    SAFE_CAST(rubrica AS STRING) AS rubrica,
    SAFE_CAST(setor AS STRING) AS setor,
    SAFE_CAST(REGEXP_REPLACE(valorvan, r',', '.') AS FLOAT64) AS valor_bruto,    
    SAFE_CAST(REGEXP_REPLACE(valordes, r',', '.') AS FLOAT64) AS valor_descontos,    
    SAFE_CAST(REGEXP_REPLACE(valorliq, r'\.0$', '') AS FLOAT64) AS valor_liquido,
    SAFE_CAST(REGEXP_REPLACE(numpens, r'\.0$', '') AS INT64) AS pensionistas,
    SAFE_CAST(REGEXP_REPLACE(numdepen, r'\.0$', '') AS INT64) AS dependente,
    SAFE_CAST(REGEXP_REPLACE(agencia, r'\.0$', '') AS INT64) AS agencia_banco,
    SAFE_CAST(REGEXP_REPLACE(banco, r'\.0$', '') AS INT64) AS banco,
    SAFE_CAST(REGEXP_REPLACE(conta, r'\.0$', '') AS INT64) AS conta_banco,
    SAFE_CAST(cargo AS STRING) AS cargo,
    SAFE_CAST(subcategoria AS STRING) AS cargo_subcategoria,
    SAFE_CAST(REGEXP_REPLACE(referencia, r'\.0$', '') AS STRING) AS id_referencia,
    SAFE_CAST(funcao AS STRING) AS funcao,
    SAFE_CAST(nome AS STRING) AS nome_fita_banco,
    SAFE_CAST(REGEXP_REPLACE(emp_codigo, r'\.0$', '') AS STRING) AS id_empresa,
    SAFE_CAST(REGEXP_REPLACE(ficha, r'\.0$', '') AS STRING) AS id_ficha,
    SAFE_CAST(REGEXP_REPLACE(regimejur, r'\.0$', '') AS STRING) AS regime_juridico,
    SAFE_CAST(tipovinc AS STRING) AS tipo_vinculo,
    SAFE_CAST(categoria AS STRING) AS categoria,
    SAFE_CAST(cpf AS STRING) AS cpf,
    SAFE_CAST(REGEXP_REPLACE(flex_campo_05, r'\.0$', '') AS STRING) AS id_lotacao,
    SAFE_CAST(REGEXP_REPLACE(jornada, r'\.0$', '') AS STRING) AS id_jornada,
    SAFE_CAST(DATE_TRUNC(DATE(data_particao), month) AS DATE) data_particao,
FROM rj-smfp.administracao_recursos_humanos_ergon_staging.fita_banco AS t

{% if is_incremental() %}
    -- TODO implement incremental with unique keys to every data_particao, replace the hole month 
    -- this filter will only be applied on an incremental run
    WHERE data_particao > (SELECT max(data_particao) FROM {{ this }})

{% endif %}