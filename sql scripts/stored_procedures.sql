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


select * from comments; 
select * from getPostsByTag;
insert into comments values (2, 5555, 2, 'haha');

create procedure addComment
@postId int, @userId int, @text varchar(255)
as begin
DECLARE @NewId int;
SELECT @NewId = FLOOR(RAND()*(9999999-1000000)+1000000);
insert into comments values(@NewId, @postId, @userId, @text); 
end

select * from users;

alter procedure uspUpdateCounter
@postID int
as begin
declare @reportCount int;
select @reportCount = REPORT_COUNT from POSTS where ID = @postID;
update POSTS set REPORT_COUNT = @reportCount+1 where ID = @postID; 
end

alter procedure uspAddNewPost 
@path varchar(255), @twitterHandle varchar(255), @tag varchar(255)
as begin
DECLARE @NewId int;
SELECT @NewId = FLOOR(RAND()*(9999999-1000000)+1000000);

declare @profilID int; 
select @profilID = ID from PROFILES where TWITTER_HANDLE = @twitterHandle;
declare @tagID int; 
select @tagID = TAGS.ID from TAGS where NAME = @tag;
insert into posts values (@NewId, @profilID,0,@path, 0, 0);
insert into POST_TAG values (@NewId, @tagID);
end

delete from tags where ID between 100 and 102
select * from POST_TAG;


alter table posts
add constraint confirst unique (PATH)

