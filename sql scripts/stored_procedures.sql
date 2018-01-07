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
    SELECT VORNAME, NACHNAME, GESCHLECHT, JOB
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

--getPostComments
IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[getPostComments]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
DROP PROCEDURE uspCreateProfile
END

CREATE PROCEDURE getPostComments
    @PostId integer
AS
    SET NOCOUNT ON; 
	Select TEXT 
	FROM COMMENTS
	WHERE FK_POST = @PostId;
GO


CREATE PROCEDURE signUp 
	@username varchar(50), @password varchar(50)
as
begin
	DECLARE @NewId int;
	SELECT @NewId = FLOOR(RAND()*(9999999-1000000)+1000000);
	insert into USERS (id, USERNAME,SCORE, [password]) values (@NewId, @username, 0, @password); 
end

exec signUp 'test','test';

select * from USERS where USERNAME = 'miel';

select * from PROFILES
select * from getProfileInformation;
select * from getProfileInformation where TWITTER_HANDLE = 'realdonaldtrump';


alter procedure uspLoginUsr
@username varchar(50),
@password varchar(255) output
as 
begin 
select @password = PASSWORD from USERS where USERNAME = @username; 
end


select * from log
alter procedure uspLogInfo
@timestamp datetime, @username varchar(255), @action varchar(255)
as begin
DECLARE @NewId int;
SELECT @NewId = FLOOR(RAND()*(9999999-1000000)+1000000);
insert into log
values(@NewId,@timestamp, @username, @action);
end 

execute uspLogInfo '2016-12-01 12:32:00.000', 'bjorna', 'logout';