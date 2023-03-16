 # Find the 5 oldest users of the Instagram from the database provided?
 select username
from users
order by created_at 
limit 5;
    
# Find the users who have never posted a single photo on Instagram?
select username , id
from users
left join likes
on likes.user_id = users.id
where likes.created_at is null
    
#  Identify the winner of the contest and provide their details to the team
select username, photos.id,photos.image_url,count(*) as max_likes 
from photos
inner join likes 
on likes.photo_id = photos.id
inner join users
on photos.user_id = users.id
group by photos.id
order by max_likes desc;

# Identify and suggest the top 5 most commonly used hashtags on the platform ?
select tags.tag_name, 
count(*) as max_tags
from photo_tags
join tags
on tags.id=photo_tags.tag_id
group by tags.id
order by max_tags desc

# What day of the week do most users register on? Provide insights on when to schedule an ad campaign?
select DAYNAME(created_at) as week_day,
count(*) as max_acc
from users
group by week_day
order by max_acc desc;

# Provide how many times does average user posts on Instagram. Also, provide the total number of photos on Instagram/total number of users?
select(select count(created_dat) from photos)/(select count(created_at) from users)photos


#Provide data on users (bots) who have liked every single photo on the site?
select username,
count(*) as total_likes
from users
inner join likes
on users.id = likes.user_id
group by likes.user_id
having total_likes=(select count(*) from photos)




