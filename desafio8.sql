DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.usuarios
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.usuarios_artistas
WHERE OLD.usuario_id = SpotifyClone.usuarios_artistas.usuario_id;
DELETE FROM SpotifyClone.usuarios_historico 
WHERE OLD.usuario_id = SpotifyClone.usuarios_historico.usuario_id;
END $$

DELIMITER ;