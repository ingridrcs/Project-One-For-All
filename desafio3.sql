SELECT U.usuario, COUNT(ID.usuario_id) AS "qtde_musicas_ouvidas", 
ROUND(SUM(DU.duracao_segundos)/60,2) AS 'total_minutos'
FROM SpotifyClone.usuarios AS U
INNER JOIN
SpotifyClone.historicos AS ID
ON U.usuario_id = ID.usuario_id
INNER JOIN SpotifyClone.info_cancoes AS DU
ON ID.cancoes_id = DU.cancoes_id
GROUP BY ID.usuario_id
ORDER BY U.usuario;