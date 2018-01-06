USE SocialJustice;  
GO  

--uspGetProfileInfo
IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[uspGetProfileInfo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
DROP PROCEDURE uspGetProfileInfo
END

CREATE PROCEDURE uspGetProfileInfo
    @TwitterHandle nvarchar(50)
AS
    SET NOCOUNT ON;  
    SELECT VORNAME, NACHNAME, GESCHLECHT
    FROM PROFILES
    WHERE TWITTER_HANDLE = @TwitterHandle;
GO  

--uspChangeUserScore
IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[uspChangeUserScore]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
DROP PROCEDURE uspChangeUserScore
END

CREATE PROCEDURE uspChangeUserScore
    @Username nvarchar(50),
	@ScoreChange Integer
AS
    SET NOCOUNT ON; 
    UPDATE USERS
	SET SCORE = SCORE + @ScoreChange
    WHERE USERNAME = @Username;
GO  

--uspCreateUser
IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[uspCreateUser]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
DROP PROCEDURE uspCreateUser
END

CREATE PROCEDURE uspCreateUser
	@Username nvarchar(50)
AS
BEGIN
    SET NOCOUNT ON; 
	DECLARE @NewId int;
	SELECT @NewId = FLOOR(RAND()*(9999999-1000000)+1000000);
	INSERT INTO USERS (ID, USERNAME, SCORE) VALUES (@NewId, @Username, 0);
END
GO

--uspCreateProfile
IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[uspCreateProfile]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
DROP PROCEDURE uspCreateProfile
END

CREATE PROCEDURE uspCreateProfile
    @TwitterHandle nvarchar(50),
	@Vorname nvarchar(50),
	@Nachname nvarchar(50),
	@Geschlecht char(1),
	@Job nvarchar(50)
AS
    SET NOCOUNT ON; 
	DECLARE @NewId int;
	SELECT @NewId = FLOOR(RAND()*(9999999-1000000)+1000000);
	INSERT INTO PROFILES VALUES (@NewId, @Vorname, @Nachname, @Geschlecht, 0, @TwitterHandle, @Job);
GO 