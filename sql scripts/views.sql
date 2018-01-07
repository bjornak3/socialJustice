alter view getProfileInformation as
select PROFILES.vorname, profiles.nachname, profiles.twitter_handle, profiles.geschlecht, HATE_LVL.NAME as hateLevel from PROFILES 
join POSTS on 
posts.FK_PROFILES = PROFILES.id
join POST_TAG on fk_post = posts.id,
hate_lvl;


select * from getProfileInformation;
select profiles.vorname, profiles.NACHNAME, profiles.GESCHLECHT, PROFILES.job, HATE_LVL.NAME
from profiles, HATE_LVL
where TWITTER_HANDLE = 'realdonaldtrump' and HATE_LVL.ID = (select PROFILES.FK_HATE_ID from PROFILES where TWITTER_HANDLE = 'realdonaldtrump');

alter view getPostsByTag as
select tags.name, posts.PATH from posts join post_tag
on posts.id = post_tag.FK_POST
join tags on tags.ID = POST_TAG.FK_TAG;

select * from getPostsByTag;

create view getPostsByTwitterHandle as
select posts.PATH, PROFILES.TWITTER_HANDLE from posts 
join PROFILES on PROFILES.ID = posts.FK_PROFILES; 

select * from getPostsByTwitterHandle where TWITTER_HANDLE = 'realdonaldtrump';
select posts.PATH, PROFILES.TWITTER_HANDLE from posts join PROFILES on PROFILES.ID = posts.FK_PROFILES where TWITTER_HANDLE = 'realdonaldtrump'