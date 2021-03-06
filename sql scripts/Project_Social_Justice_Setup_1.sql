


---Tabellen erstellen

USE SocialJustice

--PROFILES Table 
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PROFILES'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'PROFILES'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [PROFILES]
END 
GO
CREATE TABLE 
[PROFILES]
(
   [ID] numeric(38, 0)  NOT NULL,
   [VORNAME] varchar(50)  NULL,
   [NACHNAME] varchar(50)  NULL,
   [GESCHLECHT] char(1)  NULL,
   [FK_HATE_ID] numeric(38, 0) NOT NULL,
   [TWITTER_HANDLE] varchar(50)  NOT NULL UNIQUE,
   [JOB] varchar(50)  NULL
)
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PROFILES_PK' AND type in (N'PK'))
ALTER TABLE [PROFILES] DROP CONSTRAINT [PROFILES_PK]
 GO
ALTER TABLE [PROFILES]
 ADD CONSTRAINT [PROFILES_PK]
 PRIMARY KEY 
   CLUSTERED ([ID] ASC)

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PROFILES_GESCHLECHT'  AND sc.name=N'dbo'  AND type in (N'C'))
ALTER TABLE [dbo].[PROFILES] DROP CONSTRAINT [PROFILES_GESCHLECHT]
 GO

ALTER TABLE [dbo].[PROFILES]
 ADD CONSTRAINT [PROFILES_GESCHLECHT]
 CHECK (GESCHLECHT IN ( 'w', 'm' ))

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'UNIQUE_TWITTER_HANDLE' AND type in (N'PK'))
ALTER TABLE [PROFILES] DROP CONSTRAINT [UNIQUE_TWITTER_HANDLE]
 GO
ALTER TABLE [PROFILES]
 ADD CONSTRAINT [UNIQUE_TWITTER_HANDLE]
	UNIQUE ([TWITTER_HANDLE])

GO

--Tags Table
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'TAGS'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'TAGS'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [TAGS]
END 
GO
CREATE TABLE 
[TAGS]
(
   [ID] numeric(38, 0)  NOT NULL,
   [NAME] varchar(50)  NOT NULL
)
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'TAGS_PK' AND type in (N'PK'))
ALTER TABLE [TAGS] DROP CONSTRAINT [TAGS_PK]
 GO
ALTER TABLE [TAGS]
 ADD CONSTRAINT [TAGS_PK]
 PRIMARY KEY 
   CLUSTERED ([ID] ASC)

GO

-- USERS Tabelle

IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'USERS'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'USERS'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [USERS]
END 
GO
CREATE TABLE 
[USERS]
(
   [ID] numeric(38, 0)  NOT NULL,
   [USERNAME] varchar(50)  NOT NULL UNIQUE,
   [PASSWORD] varchar(50)  NOT NULL,
   [SCORE] numeric(38, 0)  NOT NULL,
)
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'USERS_PK' AND type in (N'PK'))
ALTER TABLE [USERS] DROP CONSTRAINT [USERS_PK]
 GO
ALTER TABLE [USERS]
 ADD CONSTRAINT [USERS_PK]
 PRIMARY KEY 
   CLUSTERED ([ID] ASC)

GO


-- Post Tabelle

IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'POSTS'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'POSTS'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [POSTS]
END 
GO
CREATE TABLE 
[POSTS]
(
   [ID] numeric(38, 0)  NOT NULL,
   [FK_PROFILES] numeric(38, 0)  NOT NULL,
   [FK_USERS] numeric(38, 0)  NOT NULL,
   [PATH] varchar(255)  NOT NULL,
   [REPORT_COUNT] numeric(38, 0)  NOT NULL,
   [SCORE] numeric(38, 0)  NOT NULL,
)
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'POST_PK' AND type in (N'PK'))
ALTER TABLE [POSTS] DROP CONSTRAINT [POST_PK]
 GO
ALTER TABLE [POSTS]
 ADD CONSTRAINT [POST_PK]
 PRIMARY KEY 
   CLUSTERED ([ID] ASC)
GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'POST_PROFILES_FK'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[POSTS] DROP CONSTRAINT [POST_PROFILES_FK]
 GO

ALTER TABLE [dbo].[POSTS]
 ADD CONSTRAINT [POST_PROFILES_FK]
 FOREIGN KEY 
   ([FK_PROFILES])
 REFERENCES 
   [dbo].[PROFILES]     ([ID])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'POST_USERS_FK'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[POSTS] DROP CONSTRAINT [POST_USERS_FK]
 GO

ALTER TABLE [dbo].[POSTS]
 ADD CONSTRAINT [POST_USERS_FK]
 FOREIGN KEY 
   ([FK_USERS])
 REFERENCES 
   [dbo].[USERS]     ([ID])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'POST_USERS_SCORE'  AND sc.name=N'dbo')
ALTER TABLE [dbo].[POSTS] DROP CONSTRAINT [POST_USERS_SCORE]
 GO

CREATE TRIGGER POST_USERS_SCORE
ON [POSTS]
AFTER UPDATE
AS
UPDATE [USERS]
SET SCORE -= (SELECT deleted.SCORE FROM deleted)
WHERE [USERS].ID = (SELECT inserted.[FK_USERS] from inserted);
UPDATE [USERS]
SET SCORE += (SELECT inserted.SCORE FROM inserted)
WHERE [USERS].ID = (SELECT inserted.[FK_USERS] from inserted);
GO


IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'POST_USERS_SCORE_DELETED'  AND sc.name=N'dbo')
ALTER TABLE [dbo].[POSTS] DROP CONSTRAINT [POST_USERS_SCORE_DELETED]
 GO

CREATE TRIGGER POST_USERS_SCORE_DELETED
ON [POSTS]
AFTER DELETE
AS
UPDATE [USERS]
SET SCORE -= (SELECT deleted.[SCORE] from deleted)
WHERE [USERS].ID = (SELECT deleted.[FK_USERS] from deleted)
GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'POST_PROFILE_HATE_LEVELE'  AND sc.name=N'dbo')
ALTER TABLE [dbo].[POSTS] DROP CONSTRAINT [POST_PROFILE_HATE_LEVEL]
 GO

CREATE TRIGGER POST_PROFILE_HATE_LEVEL
ON [POSTS]
AFTER INSERT, UPDATE
AS
DECLARE @LEVEL int;
DECLARE @COUNT int;
SELECT @COUNT = COUNT(*) FROM PROFILES as pr JOIN POSTS as po ON pr.ID = po.FK_PROFILES WHERE pr.ID = (SELECT inserted.FK_PROFILES from inserted)
IF(@COUNT <= 5)
	SET @LEVEL = 0;
ELSE IF(@COUNT <= 10)
	SET @LEVEL = 1;
ELSE IF(@COUNT <= 25)
	SET @LEVEL = 2;
ELSE IF(@COUNT <= 50)
	SET @LEVEL = 3;
ELSE 
	SET @LEVEL = 4;
UPDATE PROFILES
SET FK_HATE_ID = @LEVEL
WHERE [PROFILES].ID = (SELECT inserted.FK_PROFILES from inserted)
GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'POST_REPORT_COUNT_DELETE'  AND sc.name=N'dbo')
ALTER TABLE [dbo].[POSTS] DROP CONSTRAINT [POST_REPORT_COUNT_DELETE]
 GO

CREATE TRIGGER POST_REPORT_COUNT_DELETE
ON [POSTS]
AFTER UPDATE
AS
IF(SELECT inserted.[REPORT_COUNT] from inserted) >= 10
	DELETE FROM [POSTS] WHERE [POSTS].ID = (SELECT inserted.ID from inserted);
GO

-- Kommentar

IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'COMMENTS'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'COMMENTS'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [COMMENTS]
END 
GO
CREATE TABLE 
[COMMENTS]
(
   [ID] numeric(38, 0)  NOT NULL,
   [FK_POST] numeric(38, 0)  NOT NULL,
   [FK_USERS] numeric(38, 0)  NOT NULL,
   [TEXT] varchar(140) NOT NULL
)
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'COMMENTS_PK' AND type in (N'PK'))
ALTER TABLE [COMMENTS] DROP CONSTRAINT [COMMENTS_PK]
 GO
ALTER TABLE [COMMENTS]
 ADD CONSTRAINT [COMMENTS_PK]
 PRIMARY KEY 
   CLUSTERED ([ID] ASC)

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'COMMENT_POST_FK'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[COMMENTS] DROP CONSTRAINT [COMMENT_POST_FK]
 GO

ALTER TABLE [dbo].[COMMENTS]
 ADD CONSTRAINT [COMMENT_POST_FK]
 FOREIGN KEY 
   ([FK_POST])
 REFERENCES 
   [dbo].[POSTS]     ([ID])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'COMMENT_USERS_FK'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[COMMENTS] DROP CONSTRAINT [COMMENT_USERS_FK]
 GO

ALTER TABLE [dbo].[COMMENTS]
 ADD CONSTRAINT [COMMENT_USERS_FK]
 FOREIGN KEY 
   ([FK_USERS])
 REFERENCES 
   [dbo].[USERS]     ([ID])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

-- HATE LVL

IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'HATE_LVL'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'HATE_LVL'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [HATE_LVL]
END 
GO
CREATE TABLE 
[HATE_LVL]
(
   [ID] numeric(38, 0)  NOT NULL,
   [NAME] varchar(50)  NOT NULL
)
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'HATE_LVL_PK' AND type in (N'PK'))
ALTER TABLE [HATE_LVL] DROP CONSTRAINT [HATE_LVL_PK]
 GO
ALTER TABLE [HATE_LVL]
 ADD CONSTRAINT [HATE_LVL_PK]
 PRIMARY KEY 
   CLUSTERED ([ID] ASC)

GO

-- Login Log

IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'LOG'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'LOG'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [LOG]
END 
GO
CREATE TABLE 
[LOG]
(
   [ID] numeric(38, 0)  NOT NULL,
   [DATE] DATETIME  NOT NULL,
   [USER] varchar(50) NOT NULL,
   [AKTION] varchar(50) NOT NULL,
)
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'LOG_PK' AND type in (N'PK'))
ALTER TABLE [LOG] DROP CONSTRAINT [LOG_PK]
 GO
ALTER TABLE [LOG]
 ADD CONSTRAINT [LOG_PK]
 PRIMARY KEY 
   CLUSTERED ([ID] ASC)

GO

-- POST_TAG

IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'POST_TAG'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'POST_TAG'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [POST_TAG]
END 
GO
CREATE TABLE 
[POST_TAG]
(
   [FK_POST] numeric(38, 0)  NOT NULL,
   [FK_TAG] numeric(38, 0)  NOT NULL
)
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'UNIQUE_POST_TAG' AND type in (N'PK'))
ALTER TABLE [POST_TAG] DROP CONSTRAINT [UNIQUE_POST_TAG]
 GO
ALTER TABLE [POST_TAG]
 ADD CONSTRAINT [UNIQUE_POST_TAG]
	UNIQUE ([FK_POST], [FK_TAG])

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'POST_TAG_POST_FK'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[POST_TAG] DROP CONSTRAINT [POST_TAG_POST_FK]
 GO

ALTER TABLE [dbo].[POST_TAG]
 ADD CONSTRAINT [POST_TAG_POST_FK]
 FOREIGN KEY 
   ([FK_POST])
 REFERENCES 
   [dbo].[POSTS]     ([ID])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'POST_TAG_TAG_FK'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[POST_TAG] DROP CONSTRAINT [POST_TAG_TAG_FK]
 GO

ALTER TABLE [dbo].[POST_TAG]
 ADD CONSTRAINT [POST_TAG_TAG_FK]
 FOREIGN KEY 
   ([FK_TAG])
 REFERENCES 
   [dbo].[TAGS]     ([ID])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

-- Profil Hate Level FK

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PROFILES_HATE_LEVEL_FK'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[PROFILES] DROP CONSTRAINT [PROFILES_HATE_LEVEL_FK]
 GO

ALTER TABLE [dbo].[PROFILES]
 ADD CONSTRAINT [PROFILES_HATE_LEVEL_FK]
 FOREIGN KEY 
   ([FK_HATE_ID])
 REFERENCES 
   [dbo].[HATE_LVL]     ([ID])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO
