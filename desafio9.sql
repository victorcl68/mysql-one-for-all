DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nome VARCHAR(50))
BEGIN
SELECT a.artista as 'artista',
l.album AS 'album'
FROM SpotifyClone.artistas a
INNER JOIN SpotifyClone.albuns  l ON l.artista_id = a.artista_id
WHERE nome = a.artista
ORDER BY l.album;
END $$

DELIMITER ;
