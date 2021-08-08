CREATE VIEW historico_reproducao_usuarios AS
SELECT u.usuario AS usuario, h.historico_de_reproducoes AS nome 
FROM SpotifyClone.usuarios u
INNER JOIN usuarios_historico h ON h.usuario_id = u.usuario_id
ORDER BY usuario, nome;
