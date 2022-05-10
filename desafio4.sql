SELECT U.usuario,
IF(MAX(YEAR(D.data_reproducao)) = '2021', 'Usuário ativo', 'Usuário inativo') AS 'condicao_usuario'
FROM SpotifyClone.usuarios AS U
INNER JOIN SpotifyClone.historicos AS D
ON U.usuario_id = D.usuario_id
GROUP BY U.usuario
ORDER BY U.usuario;