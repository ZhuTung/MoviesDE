CREATE DATABASE MovieDB

--TEAM DIMENSION
IF NOT EXISTS(
	SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'D_Team' AND TABLE_SCHEMA = 'dbo'
)
BEGIN
	CREATE TABLE D_Team(
		TeamID varchar(10) PRIMARY KEY,
		Companies varchar(max),
		Countries varchar(max),
		Director varchar(max),
		Star1 varchar(50),
		Star2 varchar(50),
		Star3 varchar(50),
		Star4 varchar(50),
		Writer varchar(max),
		PhotoDirector varchar(max),
		Producers varchar(max),
		MusicComposers varchar(max),
		CastList varchar(max)
	)
END

--MOVIE DIMENSION
IF NOT EXISTS(
	SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'D_Movie' AND TABLE_SCHEMA = 'dbo'
)
BEGIN
	CREATE TABLE D_Movie(
		MovieID varchar(10) PRIMARY KEY,
		Title varchar(max),
		OriginalTitle varchar(40),
		Runtime int,
		Adult varchar(3),
		Overview varchar(max),
		Tagline varchar(max),
		SpokenLang varchar(max),
		Keywords varchar(max),
		GenresList varchar(max)
	)
END

--IMDB DIMENSION
IF NOT EXISTS(
	SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'D_Imdb' AND TABLE_SCHEMA = 'dbo'
)
BEGIN
	CREATE TABLE D_Imdb(
		ImdbID varchar(10) PRIMARY KEY,
		voteAvg decimal(15,2),
		voteCount int,
		Popularity decimal(15,4),
		ratingAvg decimal(15,2),
		imdbRate decimal(15,2),
		MetaScore decimal(15,2)
	)
END

--DATE DIMENSION
IF NOT EXISTS(
	SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'D_Date' AND TABLE_SCHEMA = 'dbo'
)
BEGIN
	CREATE TABLE D_Date(
		DateID varchar(10) PRIMARY KEY,
		ReleaseDate date,
		ReleaseYear int,
		ProduceDate Date,
		ProductionDuration int
	)
END

--PRODUCTION FACT TABLE
IF NOT EXISTS(
	SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'F_Production' AND TABLE_SCHEMA = 'dbo'
)
BEGIN
	CREATE TABLE F_Production(
		ProductionID varchar(10) PRIMARY KEY,
		DateID varchar(10) FOREIGN KEY REFERENCES D_Date(DateID),
		MovieID varchar(10) FOREIGN KEY REFERENCES D_Movie(MovieID),
		TeamID varchar(10) FOREIGN KEY REFERENCES D_Team(TeamID),
		ImdbID varchar(10) FOREIGN KEY REFERENCES D_Imdb(ImdbID),
		Pstatus varchar(20),
		Budget decimal(18,2),
		Revenue decimal(18,2)
	)
END