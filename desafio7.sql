SELECT AR.artista, AL.album, COUNT(US.seguindo_artistas) AS 'seguidores'
FROM SpotifyClone.artistas AS AR
INNER JOIN SpotifyClone.info_album AS AL
ON AR.artista_id = AL.artista_id
INNER JOIN SpotifyClone.usuario_seguindo_artistas AS US
ON AL.artista_id = US.artista_id
GROUP BY AR.artista, AL.album
ORDER BY seguidores DESC, artista ASC, AL.album ASC;

--Source: https://www.devmedia.com.br/sql-order-by/41225#:~:text=SQL%3A%20Order%20by-,ORDER%20BY%20organiza%20os%20resultados%20de%20acordo%20com%20uma%20ou,(ASC)%2C%20por%20padr%C3%A3o. -- 