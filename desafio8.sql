SELECT AR.artista, AL.album
FROM SpotifyClone.artistas AS AR
INNER JOIN SpotifyClone.info_album AS AL
ON AR.artista_id = AL.artista_id
WHERE AR.artista_id = 1;