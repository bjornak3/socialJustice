--HATE_LVL
insert into HATE_LVL VALUES 
	(0, 'Innocent'),
	(1, 'Slightly Bitchy'),
	(2, 'Calm down!'),
	(3, 'Monster'),
	(4, 'Trump');
select * from HATE_LVL;

--TAGS reasons
insert into TAGS VALUES
	(0, 'ethnicity'),
	(1, 'sexism'),
	(2, 'disability'),
	(3, 'language'),
	(4, 'nationality'),
	(5, 'physical appearance'),
	(6, 'religion'),
	(7, 'gender'),
	(8, 'sexal orientation');
--TAGS type
insert into TAGS VALUES
	(100, 'bias incidents'),
	(101, 'bullying'),
	(102, 'harassment'),
	(103, 'verbal abuse'),
	(104, 'insults'),
	(105, 'mate crime'),
	(106, 'graffiti'),
	(107, 'hate mail');
select * from TAGS;

--PROFILES examples
insert into PROFILES VALUES 
	(69, 'Donald J.', 'Trump', 'm', 4, 'realdonaldtrump', 'POTUS'),
	(666, 'Stephen', 'Bannon', 'm', 4, 'stephenbannon', 'Auto-Fellatist'),
	(88, 'Heinz Christian', 'Strache', 'm', 3, 'hcstrachefp', 'Witz-Kanzler'),
	(18, 'Norbert Gerald', 'Hofer', 'm', 2, 'norbertghofer', null);
select * from PROFILES;

--USERS examples
insert into USERS VALUES
	(0, 'FeJo', 0, 'fejo'),
	(2, 'Bjorna', 0, 'bjorna'),
	(3, 'Andrè', 0, 'andre');

alter table posts alter column path varchar(255);
--POSTS examples
insert into POSTS VALUES
	(13241, 69, 0, 'https://twitter.com/realDonaldTrump/status/949498795074736129');
select * from POSTS;


--POST_TAG
insert into POST_TAG VALUES
	(13241, 3),
	(13241, 103);

--POSTS examples
insert into POSTS VALUES
	(13241, 69, 0, 'https://twitter.com/realDonaldTrump/status/949498795074736129'),
	(5555, 69, 0, 'https://twitter.com/realDonaldTrump/status/949303089416294401');
select * from POSTS;

--POST_TAG
insert into POST_TAG VALUES
	(5555, 3),
	(5555, 102);