---Datenbank erstellen

USE Master

IF EXISTS(SELECT * FROM sysdatabases WHERE name = 'SocialJustice')
  DROP DATABASE SocialJustice
GO

CREATE DATABASE SocialJustice

ON PRIMARY (
  Name = 'SocialJustice_DATA',
  Filename='O:\FH\DB_projekt\DATA\SocialJustice_DATA.mdf',
  Size = 10MB,
  Filegrowth = 10%
)
LOG ON (
  Name = 'SocialJustice_LOG',
  Filename='O:\FH\DB_projekt\DATA\SocialJustice_LOG.ldf',
  Size = 10MB,
  Filegrowth = 10%
)