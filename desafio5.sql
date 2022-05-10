SELECT C.cancoes AS 'cancao', COUNT(H.historico_de_reproducoes) AS 'reproducoes'
FROM SpotifyClone.info_cancoes AS C
INNER JOIN SpotifyClone.historicos AS H
ON C.cancoes_id = H.cancoes_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;