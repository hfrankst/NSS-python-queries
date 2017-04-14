--shows the number of different genres
SELECT COUNT (DISTINCT GenreID) FROM Genre;
--query the entries in the Genre table 
SELECT * FROM Genre;

--using INSERT to add to the Album, Artist, and Song tables
INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('NAS', 1991);
SELECT * FROM Artist;

INSERT INTO Album(Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) 
VALUES ('Illmatic', '4/19/1994', 10, 'Columbia Records', 29, 13);
SELECT * FROM Album;

INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES ('The Genesis', '146', '4/19/1994', 13, 29, 24);
SELECT * FROM Song;
DELETE FROM Song WHERE SongId = 22;

--using the left join to show the album and artist I just added
SELECT a.Title, s.Title 
FROM Album a 
LEFT JOIN Song s 
ON s.AlbumId = a.AlbumId
WHERE s.Title = 'The Genesis';

SELECT a.Title, s.Title 
FROM Song s 
LEFT JOIN Album a 
ON s.AlbumId = a.AlbumId
WHERE a.Title = 'Illmatic';

--using a SELECT statement, with GROUP BY and COUNT() to show how many songs per album
SELECT a.Title, COUNT(a.AlbumId)
FROM Album a, Song s 
Where s.AlbumId = a.AlbumId
GROUP BY a.AlbumId;

--using a SELECT statement, with GROUP BY and COUNT() to show the number of songs per artist
SELECT a.ArtistName, COUNT(a.ArtistId)
FROM Artist a, Song s 
Where s.ArtistId = a.ArtistId
GROUP BY a.ArtistId;

--using a SELECT statement, with GROUP BY and COUNT() to show the number of songs per genre
SELECT g.Label, COUNT(g.GenreId)
FROM Genre g, Song s 
Where s.GenreId = g.GenreId
GROUP BY g.GenreId;

--use the MAX() function to show the album with the longest duration. Result: album title, duration
SELECT a.Title, MAX(AlbumLength) FROM Album a;

--use the MAX() function to show the song with the longest duration Result: song title, duration
SELECT s.Title, MAX(SongLength) FROM Song s;

--modified to show the album title as well as song title and duration
SELECT a.Title, s.Title, MAX(SongLength) FROM Album a, Song s;

