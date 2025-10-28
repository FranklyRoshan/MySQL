USE album;

SELECT * FROM album;
SELECT * FROM track;

-- JOIN (Joining Queries across the tables)
SELECT a.artist AS Artist, a.title AS Album, t.track_number AS 'Track Num', t.title AS Track, t.duration AS Seconds
	FROM album AS a
    JOIN track AS t ON a.id = t.album_id
    ORDER BY a.artist, a.title, t.track_number;
    
