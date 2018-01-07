alter view getProfileInformation as
select PROFILES.vorname, profiles.nachname, profiles.twitter_handle, profiles.geschlecht, HATE_LVL.NAME as hateLevel from PROFILES 
join POSTS on 
posts.FK_PROFILES = PROFILES.id
join POST_TAG on fk_post = posts.id,
hate_lvl;


select * from getProfileInformation;


alter view getPostsByTag as
select tags.name, posts.PATH from posts join post_tag
on posts.id = post_tag.FK_POST
join tags on tags.ID = POST_TAG.FK_TAG;

select * from getPostsByTag;