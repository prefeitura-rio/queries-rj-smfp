WITH orgao_ar AS (
  SELECT DISTINCT 
    id_orgao,
    orgao_sigla
  FROM `rj-smfp.planejamento_gestao_acordo_resultados.meta`
  CROSS JOIN UNNEST(SPLIT(sigla_orgao, '/')) AS orgao_sigla
),

orgao_pe AS (
  SELECT 
    *
  FROM `rj-smfp.planejamento_gestao_dashboard_metas_staging.orgaos`
)

SELECT  
  CASE WHEN orgao_sigla IS NULL THEN sigla ELSE orgao_sigla END orgao_sigla,
  orgao,
  ordem_secretariado_e_relatorios,
  ordem_ar2021,
  ordem_ar2022,
  coluna_antiga_ordem,
FROM orgao_pe 
FULL OUTER JOIN orgao_ar
  ON orgao_sigla = sigla
ORDER BY orgao_sigla