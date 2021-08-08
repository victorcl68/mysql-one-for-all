CREATE VIEW perfil_artistas AS
SELECT a.artista AS 'artista', l.album AS album, COUNT(ua.usuario_id) AS 'seguidores'
FROM SpotifyClone.usuarios_artistas ua
INNER JOIN SpotifyClone.artistas a ON ua.artista_id = a.artista_id
INNER JOIN SpotifyClone.albuns l ON ua.artista_id = l.artista_id
GROUP BY artista, album
ORDER BY seguidores DESC, artista;
