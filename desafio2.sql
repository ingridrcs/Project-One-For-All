SELECT COUNT(DISTINCT CA.cancoes_id) AS 'cancoes', COUNT(DISTINCT AR.artista_id) AS artistas, COUNT(DISTINCT AL.album_id) AS 'albuns'
FROM SpotifyClone.info_cancoes AS CA
INNER JOIN
SpotifyClone.artistas AS AR
ON CA.artista_id = AR.artista_id
INNER JOIN 
SpotifyClone.info_album AS AL
ON CA.album_id = AL.album_id;

-- Source: https://elias.praciano.com/2015/08/use-distinct-para-eliminar-redundancias-no-mysql/#:~:text=O%20DISTINCT%20pode%20ser%20usado,DISTINCT)%20para%20cont%C3%A1%2Dlos.--