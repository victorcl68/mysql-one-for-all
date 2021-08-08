CREATE VIEW top_2_hits_do_momento AS
SELECT ac.cancoes AS cancao, COUNT(*) AS reproducoes
FROM SpotifyClone.albuns_cancoes ac
INNER JOIN SpotifyClone.usuarios_historico ua ON ac.cancoes = ua.historico_de_reproducoes
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;
