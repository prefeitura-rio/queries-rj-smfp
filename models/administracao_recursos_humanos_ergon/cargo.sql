SELECT 
    SAFE_CAST(REGEXP_REPLACE(cargo, r'\.0$', '') AS STRING) AS id_cargo,
    SAFE_CAST(nome AS STRING) AS nome,
    SAFE_CAST(categoria AS STRING) AS categoria,
    SAFE_CAST(subcategoria AS STRING) AS subcategoria,
    SAFE_CAST(controle_vaga AS STRING) AS tipo_controle_vaga,
    SAFE_CAST(REGEXP_REPLACE(escolaridade, r'\.0$', '') AS STRING) AS escolaridade,
    SAFE_CAST(e_aglutinador AS STRING) AS aglutinador,
FROM rj-smfp.administracao_recursos_humanos_ergon_staging.cargo AS t