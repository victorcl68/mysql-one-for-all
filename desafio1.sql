DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE artistas (
  artista_id INT NOT NULL AUTO_INCREMENT,
  artista VARCHAR(30),
  PRIMARY KEY (artista_id)
) ENGINE=InnoDB;

CREATE TABLE planos (
  plano_id INT NOT NULL AUTO_INCREMENT,
  plano VARCHAR(25),
  valor_plano DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (plano_id)
) ENGINE=InnoDB;

CREATE TABLE albuns (
  album_id INT NOT NULL AUTO_INCREMENT,
  album VARCHAR(30),
  artista_id INT NOT NULL,
  PRIMARY KEY (album_id),
  FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) ENGINE=InnoDB;

CREATE TABLE usuarios (
  usuario_id INT NOT NULL AUTO_INCREMENT,
  usuario VARCHAR(15),
  idade INT,
  plano_id INT NOT NULL,
  PRIMARY KEY (usuario_id),
  FOREIGN KEY (plano_id) REFERENCES planos(plano_id)
) ENGINE=InnoDB;

CREATE TABLE albuns_cancoes (
  album_id INT NOT NULL,
  cancoes VARCHAR(35),
  PRIMARY KEY (cancoes),
  FOREIGN KEY (album_id) REFERENCES albuns (album_id)
) ENGINE=InnoDB;

CREATE TABLE usuarios_artistas (
  usuario_id INT NOT NULL,
  artista_id INT NOT NULL,
  PRIMARY KEY (usuario_id, artista_id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id),
  FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
) ENGINE=InnoDB;

CREATE TABLE usuarios_historico (
  usuario_id INT NOT NULL,
  historico_de_reproducoes VARCHAR(35),
  PRIMARY KEY (usuario_id, historico_de_reproducoes),
  FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id),
  FOREIGN KEY (historico_de_reproducoes) REFERENCES albuns_cancoes (cancoes)
) ENGINE=InnoDB;

INSERT INTO artistas (artista_id, artista)
VALUES 
(1, 'Walter Phoenix'),
(2, 'Peter Strong'),
(3, 'Lance Day'),
(4, 'Freedie Shannon');

INSERT INTO planos (plano_id, plano, valor_plano)
VALUES
(1, 'gratuito', 0),
(2, 'familiar', 7.99),
(3, 'universitario', 5.99);

INSERT INTO albuns (album_id, album, artista_id)
VALUES
(1, 'Envious', 1),
(2, 'Exuberant', 1),
(3, 'Hallowed Steam', 2),
(4, 'Incandescent', 3),
(5, 'Temporary Culture', 4);

INSERT INTO usuarios (usuario_id, usuario, idade, plano_id)
VALUES
(1, 'Thati', 23, 1),
(2, 'Cintia', 35, 2),
(3, 'Bill', 20, 3),
(4, 'Roger', 45, 1);
    
INSERT INTO albuns_cancoes (album_id, cancoes)
VALUES
(1, 'Soul For Us'),
(1, 'Reflections Of Magic'),
(1, 'Dance With Her Own'),
(2, 'Troubles Of My Inner Fire'),
(2, 'Time Fireworks'),
(3, 'Magic Circus'),
(3, 'Honey, So Do I'),
(3, "Sweetie, Let's Go Wild"),
(3, 'She Knows'),
(4, 'Fantasy For Me'),
(4, 'Celebration Of More'),
(4, 'Rock His Everything'),
(4, 'Home Forever'),
(4, 'Diamond Power'),
(4, "Honey, Let's Be Silly"),
(5, 'Thang Of Thunder'),
(5, 'Words Of Her Life'),
(5, 'Without My Streets');
    
INSERT INTO usuarios_artistas (usuario_id, artista_id)
VALUES
(1, 1),
(2, 1),
(3, 1),
(3, 2),
(1, 3),
(2, 3),
(1, 4),
(4, 4);
    
INSERT INTO usuarios_historico (usuario_id, historico_de_reproducoes)
VALUES
(1, 'Soul For Us'),
(1, 'Magic Circus'),
(1, 'Diamond Power'),
(1, 'Thang Of Thunder'),
(2, 'Home Forever'),
(2, 'Words Of Her Life'),
(2, 'Reflections Of Magic'),
(2, 'Honey, Let\'s Be Silly'),
(3, 'Troubles Of My Inner Fire'),
(3, 'Thang Of Thunder'),
(3, 'Magic Circus'),
(4, 'Dance With Her Own'),
(4, 'Without My Streets'),
(4, 'Celebration Of More');
