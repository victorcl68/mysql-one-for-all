CREATE VIEW top_3_artistas AS
SELECT a.artista AS 'artista', COUNT(ua.usuario_id) AS 'seguidores'
FROM SpotifyClone.usuarios_artistas ua
INNER JOIN SpotifyClone.artistas a ON ua.artista_id = a.artista_id
GROUP BY artista
ORDER BY seguidores DESC, artista
LIMIT 3;
