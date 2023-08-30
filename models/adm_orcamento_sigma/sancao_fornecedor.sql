SELECT
    SAFE_CAST(SAFE.PARSE_DATE("%Y%m%d",dt_sancao) AS DATE) AS data_sancao,
    SAFE_CAST(SAFE.PARSE_DATE("%Y%m%d",REGEXP_REPLACE(dt_extincao_sancao, r'\.0$', '')) AS DATE) AS data_extincao_sancao,
    CASE
        WHEN LENGTH(cpf_cnpj) = 11 THEN 'CPF'
        WHEN LENGTH(cpf_cnpj) = 14 THEN 'CNPJ'
        ELSE NULL
    END AS tipo_documento,
    SAFE_CAST(cpf_cnpj AS STRING) AS cpf_cnpj,
    CASE
        WHEN LENGTH(cpf_cnpj) = 11 THEN
        CONCAT(
            SUBSTR(cpf_cnpj, 1, 3),
            '.',
            SUBSTR(cpf_cnpj, 4, 3),
            '.',
            SUBSTR(cpf_cnpj, 7, 3),
            '-',
            SUBSTR(cpf_cnpj, 10, 2)
        )
        WHEN LENGTH(cpf_cnpj) = 14 THEN
        CONCAT(
            LEFT(cpf_cnpj, 2),
            '.',
            SUBSTR(cpf_cnpj, 3, 3),
            '.',
            SUBSTR(cpf_cnpj, 6, 3),
            '/',
            SUBSTR(cpf_cnpj, 9, 4),
            '-',
            RIGHT(cpf_cnpj, 2)
        )
        ELSE cpf_cnpj
    END AS cpf_cnpj_formatado,
    SAFE_CAST(razao_social AS STRING) AS razao_social,
    SAFE_CAST(REGEXP_REPLACE(nr_ordem, r'\.0$', '') AS STRING) AS id_ordem,
    SAFE_CAST(REGEXP_REPLACE(processo_origem, r'\.0$', '') AS STRING) AS id_processo_origem,
    SAFE_CAST(REGEXP_REPLACE(processo_instrutivo, r'\.0$', '') AS STRING) AS id_processo_instrutivo,
    SAFE_CAST(REGEXP_REPLACE(processo_fatura, r'\.0$', '') AS STRING) AS id_processo_fatura,
    SAFE_CAST(REGEXP_REPLACE(cd_sancao, r'\.0$', '') AS STRING) AS id_sancao,
    SAFE_CAST(REGEXP_REPLACE(ds_sancao, r'\.0$', '') AS STRING) AS descricao_sancao,
FROM `rj-smfp.adm_orcamento_sigma_staging.sancao_fornecedor`
