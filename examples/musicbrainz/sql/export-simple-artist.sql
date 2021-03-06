-- COPY (SELECT * FROM artist) TO stdout CSV HEADER DELIMITER E'\t';
COPY(
    SELECT
        a.id AS pk,
        a.gid AS mbid,
        n.name AS name,
        a.begin_date_year,
        a.end_date_year,
        atype.name AS type,
        c.iso_code AS country,
        g.name AS gender,
        a.comment,
        a.ended
    FROM artist a
    JOIN artist_name n ON a.name=n.id
    LEFT JOIN artist_type atype ON a.type=atype.id
    LEFT JOIN country c ON a.country=c.id
    LEFT JOIN gender g ON a.gender=g.id
)
TO stdout CSV HEADER DELIMITER E'\t';
