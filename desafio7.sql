SELECT AR.artista, AL.album, COUNT(US.seguindo_artistas) AS 'seguidores'
FROM SpotifyClone.artistas AS AR
INNER JOIN SpotifyClone.info_album AS AL
ON AR.artista_id = AL.artista_id
INNER JOIN SpotifyClone.usuario_seguindo_artistas AS US
ON AL.artista_id = US.artista_id
GROUP BY AR.artista, AL.album
ORDER BY seguidores DESC, artista ASC;