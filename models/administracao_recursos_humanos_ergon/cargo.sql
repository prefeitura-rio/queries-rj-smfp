SELECT 
    SAFE_CAST(REGEXP_REPLACE(CARGO, r'\.0$', '') AS STRING) AS id_cargo,
    SAFE_CAST(NOME AS STRING) AS nome,
    SAFE_CAST(CATEGORIA AS STRING) AS categoria,
    SAFE_CAST(SUBCATEGORIA AS STRING) AS subcategoria,
    SAFE_CAST(CONTROLE_VAGA AS STRING) AS tipo_controle_vaga,
    SAFE_CAST(REGEXP_REPLACE(ESCOLARIDADE, r'\.0$', '') AS STRING) AS escolaridade,
    SAFE_CAST(E_AGLUTINADOR AS STRING) AS aglutinador,
FROM rj-smfp.administracao_recursos_humanos_ergon_staging.cargo AS t