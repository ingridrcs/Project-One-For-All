SELECT H.historico_de_reproducoes AS nome, COUNT(U.usuario_id) AS 'reproducoes'
FROM SpotifyClone.historicos AS H
INNER JOIN SpotifyClone.usuarios AS U
ON H.usuario_id = U.usuario_id
WHERE planos_id = 1 OR planos_id = 4
GROUP BY nome
ORDER BY nome;