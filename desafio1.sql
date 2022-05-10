DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.artistas(
    artista_id INT PRIMARY KEY AUTO_INCREMENT,
    artista VARCHAR(50) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.info_planos(
    planos_id INT PRIMARY KEY AUTO_INCREMENT,
    planos VARCHAR(50),
    valor_plano DECIMAL(5,2) NOT NULL 
) engine = InnoDB;


CREATE TABLE SpotifyClone.usuarios(
    usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    usuario VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    planos_id INT,
    FOREIGN KEY (planos_id) REFERENCES info_planos(planos_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.info_album(
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    album VARCHAR(50) NOT NULL,
    artista_id INT,
    ano_lancamento INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.plano_assinatura(
    plano_usuario INT PRIMARY KEY AUTO_INCREMENT,
    planos_id INT,
    data_assinatura VARCHAR(50) NOT NULL,
    usuario_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
    FOREIGN KEY (planos_id) REFERENCES info_planos(planos_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.usuario_seguindo_artistas(
    seguindo_artistas VARCHAR(50) NOT NULL,
    usuario_id INT,
    artista_id INT,
    CONSTRAINT PRIMARY KEY(usuario_id, artista_id),
    FOREIGN KEY (artista_id) REFERENCES artistas (artista_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.info_cancoes(
    cancoes_id INT PRIMARY KEY AUTO_INCREMENT,
    cancoes VARCHAR(50) NOT NULL,
    duracao_segundos INT(50) NOT NULL,
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES info_album(album_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.historicos(
    historico_de_reproducoes VARCHAR(50) NOT NULL,
    data_reproducao VARCHAR(50) NOT NULL,
    usuario_id INT,
    cancoes_id INT,
    CONSTRAINT PRIMARY KEY(usuario_id, cancoes_id),
    FOREIGN KEY (cancoes_id) REFERENCES info_cancoes(cancoes_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.artistas (artista)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon'),
  ('Tyler Isle'),
  ('Fog');

INSERT INTO SpotifyClone.info_album (album, artista_id, ano_lancamento)
VALUES
  ('Envious', 1, 1990),
  ('Exuberant', 1, 1993),
  ('Hallowed Steam', 2, 1995),
  ('Incandescent', 3, 1998),
  ('Temporary Culture', 4, 2001),
  ('Library of liberty', 4, 2003),
  ('Chained Down', 5, 2007),
  ('Cabinet of fools', 5, 2012),
  ('No guarantees', 5, 2015),
  ('Apparatus', 6, 2015);

INSERT INTO SpotifyClone.info_planos (planos, valor_plano)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99),
  ('pessoal', 6.99);

INSERT INTO SpotifyClone.usuarios (usuario, idade, planos_id )
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 4),
  ('Norman', 58, 4),
  ('Patrick', 33, 2),
  ('Vivian', 26, 3),
  ('Carol', 19, 3),
  ('Angelina', 42, 2),
  ('Paul', 46, 2);

INSERT INTO SpotifyClone.plano_assinatura (usuario_id, planos_id, data_assinatura)
VALUES
  (1, 1, 2019-10-20),
  (2, 2, 2017-12-30),
  (3, 3, 2019-06-05),
  (4, 4, 2020-05-13),
  (5, 4, 2017-02-17),
  (6, 2, 2017-01-06),
  (7, 3, 2018-01-05),
  (8, 3, 2018-02-14),
  (9, 2, 2018-04-29),
  (10, 2, 2017-01-17);

INSERT INTO SpotifyClone.usuario_seguindo_artistas (usuario_id, seguindo_artistas, artista_id)
VALUES
  (1, 'Walter Phoenix', 1),
  (1, 'Freedie Shannon', 4),
  (1, 'Lance Day', 3),
  (2, 'Walter Phoenix', 1),
  (2, 'Lance Day', 3),
  (3, 'Peter Strong', 2),
  (3, 'Walter Phoenix', 1),
  (4, 'Freedie Shannon', 4),
  (5, 'Tyler Isle', 5),
  (5, 'Fog', 6),
  (6, 'Fog', 6),
  (6, 'Lance Day', 3),
  (6, 'Walter Phoenix', 1),
  (7, 'Peter Strong', 2),
  (7, 'Tyler Isle', 5),
  (8, 'Walter Phoenix', 1),
  (8, 'Tyler Isle', 5),
  (9, 'Fog', 6),
  (9, 'Freedie Shannon', 4),
  (9, 'Lance Day', 3),
  (10, 'Peter Strong', 2),
  (10, 'Fog', 6);

INSERT INTO SpotifyClone.info_cancoes (cancoes, duracao_segundos, album_id)
VALUES
  ('Soul For Us', 200, 1),
  ('Reflections Of Magic', 163, 1),
  ('Dance With Her Own', 116, 1),
  ('Troubles Of My Inner Fire', 203, 2),
  ('Time Fireworks', 152, 2),
  ('Magic Circus', 105, 3),
  ('Honey, So Do I', 207, 3),
  ("Sweetie, Let's Go Wild", 139, 3),
  ('She Knows', 244, 3),
  ('Fantasy For Me', 100,  4),
  ('Celebration Of More', 146,  4),
  ('Rock His Everything', 223,  4),
  ('Home Forever', 231,  4),
  ('Diamond Power', 241,  4),
  ("Let's Be Silly", 132,  4),
  ('Thang Of Thunder', 240,  5),
  ('Words Of Her Life', 185,  5),
  ('Without My Streets', 176,  5),
  ('Need Of The Evening', 190,  6),
  ('History Of My Roses', 222,  6),
  ('Without My Love', 111, 6),
  ('Walking And Game', 123,  6),
  ('Young And Father', 197,  6),
  ('Finding My Traditions', 179,  7),
  ('Walking And Man', 229,  7),
  ('Hard And Time', 135, 7),
  ("Honey, I'm A Lone Wolf", 150,  7),
  ("She Thinks I Won't Stay Tonight", 166,  8),
  ("He Heard You're Bad For Me", 154, 8),
  ("He Hopes We Can't Stay", 210, 8),
  ('I Know I Know', 117,  8),
  ("He's Walking Away", 159,  9),
  ("He's Trouble", 138,  9),
  ('I Heard I Want To Bo Alone', 120,  9),
  ('I Ride Alone', 151,  9),
  ('Honey', 79,  10),
  ('You Cheated On Me', 95,  10),
  ("Wouldn't It Be Nice", 213,  10),
  ('Baby', 136,  10),
  ('You Make Me Feel So..', 83,  10);

INSERT INTO SpotifyClone.historicos (usuario_id, historico_de_reproducoes, data_reproducao, cancoes_id)
VALUES
  (1, 'Honey', '2020-02-28 10:45:55', 36),
  (1, 'Walking And Man', '2020-05-02 05:30:35', 25),
  (1, 'Young And Father', '2020-03-06 11:22:33', 23),
  (1, 'Diamond Power', '2020-08-05 08:05:17', 14),
  (1, 'Lets Be Silly', '2020-09-14 16:32:22', 15),
  (2, 'I Heard I Want To Bo Alone', '2020-01-02 07:40:33', 34),
  (2, 'Finding My Traditions', '2020-05-16 06:16:22', 24),
  (2, 'Without My Love', '2020-10-09 12:27:48', 21),
  (2, 'Baby', '2020-09-21 13:14:46', 39),
  (3, 'Magic Circus', '2020-11-13 16:55:13', 6),
  (3, 'Dance With Her Own', '2020-12-05 18:38:30', 3),
  (3, 'Hard And Time', '2020-07-30 10:00:00', 26),
  (4, 'Reflections Of Magic', '2021-08-15 17:10:10', 2),
  (4, 'I Ride Alone', '2021-07-10 15:20:30', 35),
  (4, 'Honey, Im A Lone Wolf', '2021-01-09 01:44:33', 27),
  (5, 'Honey, So Do I', '2020-07-03 19:33:28', 7),
  (5, 'Rock His Everything', '2017-02-24 21:14:22', 12),
  (5, 'Diamond Power', '2020-08-06 15:23:43', 14),
  (5, 'Soul For Us', '2020-11-10 13:52:27', 1),
  (6, "Wouldn't It Be Nice", '2019-02-07 20:33:48', 38),
  (6, "He Heard You're Bad For Me", '2017-01-24 00:31:17', 29),
  (6, "He Hopes We Can't Stay", '2017-10-12 12:35:20', 30),
  (6, 'Walking And Game', '2018-05-29 14:56:41', 25),
  (7, 'Time Fireworks', '2018-05-09 22:30:49', 5),
  (7, 'Troubles Of My Inner Fire', '2020-07-27 12:52:58', 4),
  (7, 'Celebration Of More', '2018-01-16 18:40:43', 11),
  (8, 'Baby', '2018-03-21 16:56:40', 39),
  (8, 'You Make Me Feel So..', '2020-10-18 13:38:05', 40),
  (8, 'He"s Walking Away', '2019-05-25 08:14:03', 32),
  (8, 'He"s Trouble', '2021-08-15 21:37:09', 33),
  (9, 'Thang Of Thunder', '2021-05-24 17:23:45', 16),
  (9, 'Words Of Her Life', '2018-12-07 22:48:52', 17),
  (9, "Sweetie, Let's Go Wild", '2021-03-14 06:14:26', 8),
  (9, 'She Knows', '2020-04-01 03:36:00', 9),
  (10, 'History Of My Roses', '2017-02-06 08:21:34', 20),
  (10, 'Without My Love', '2017-12-04 05:33:43', 21),
  (10, 'Rock His Everything', '2017-07-27 05:24:49', 12),
  (10, 'Home Forever', '2017-12-25 01:03:57', 13);