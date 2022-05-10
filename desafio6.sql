SELECT MIN(I.valor_plano) AS 'faturamento_minimo', ROUND(MAX(I.valor_plano), 2) AS 'faturamento_maximo', ROUND(AVG(I.valor_plano), 2) AS 'faturamento_medio',
SUM(valor_plano) AS 'faturamento_total'
FROM SpotifyClone.info_planos AS I
INNER JOIN SpotifyClone.usuarios AS U
ON I.planos_id = U.planos_id;