show variables like "secure_file_priv";

load data 
infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\website3.csv"
into table denormalized 
columns terminated by ';'
ESCAPED BY '\\';

load data 
infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\subnetworks.csv"
into table subnetworks
columns terminated by ';'
ESCAPED BY '\\';

load data 
infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\registrar.csv"
into table registrar
columns terminated by ';'
ESCAPED BY '\\';

insert into websites (website_id, Website)
select distinct website_id, Website
from denormalized;

insert into website_subnetworks (website_id, subnetwork_id)
select distinct website_id, subnetwork_id
from denormalized;

insert into website_registrar (website_id, registrar_id)
select distinct website_id, registrar_id
from denormalized;

insert into visitors_percentage (website_id, Reach_Day_percentage, Month_Average_Daily_Reach_percentage, Daily_Pageviews_percentage, Month_Average_Daily_Pageviews_percentage, Daily_Pageviews_per_user_percentage)
select distinct website_id, Reach_Day_percentage, Month_Average_Daily_Reach_percentage, Daily_Pageviews_percentage, Month_Average_Daily_Pageviews_percentage, Daily_Pageviews_per_user_percentage
from denormalized;

insert into socialmedia (website_id, Facebook_likes, Twitter_mentions, Google_pluses, LinkedIn_mentions, Pinterest_pins)
select distinct website_id, Facebook_likes, Twitter_mentions, Google_pluses, LinkedIn_mentions, Pinterest_pins
from denormalized;

insert into safety (website_id, Trustworthiness, Child_Safety, Privacy, Status)
select distinct website_id, Trustworthiness, Child_Safety, Privacy, Status
from denormalized;

insert into website_countries (website_id, country_id, Country_Rank)
select distinct website_id, country_id, Country_Rank
from denormalized;

insert into countries (country_id, country)
select distinct country_id, country
from denormalized;

insert into hostages (Hosted_id, website_id, Location, Hosted_by, Registrant)
select distinct Hosted_id, website_id, Location, Hosted_by, Registrant
from denormalized;

insert into visitors_views (website_id, Daily_Pageviews, Month_Average_Daily_Pageviews, Daily_Pageviews_per_user, Avg_Daily_Pageviews, StumbleUpon_views)
select distinct website_id, Daily_Pageviews, Month_Average_Daily_Pageviews, Daily_Pageviews_per_user, Avg_Daily_Pageviews, StumbleUpon_views
from denormalized;

insert into visitors (website_id, Traffic_Rank, Reach_day, Month_Average_Daily_Reach, Avg_Daily_Visitors)
select distinct website_id, Traffic_Rank, Reach_day, Month_Average_Daily_Reach, Avg_Daily_Visitors
from denormalized;