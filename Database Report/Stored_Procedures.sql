#Procedure 1
create procedure getWebsitesByCountry(in countryName varchar(40))
select websites.website_id, Website, Country_Rank
from websites join website_countries on websites.website_id = website_countries.website_id
where country_id in (select country_id
									from countries
                                    where country = countryName)
order by Country_Rank;

call getWebsitesByCountry("Turkey");

#Procedure 2
create procedure avgTrafficRankByCountry(in countryName varchar(40), out avgTrafficRank float)
select avg(Traffic_Rank)
into avgTrafficRank
from visitors join websites on visitors.website_id = websites.website_id
		join website_countries on websites.website_id = website_countries.website_id
        join countries on website_countries.country_id = countries.country_id
where country = countryName;

#call avgTrafficRankByCountry("Turkey", @avgTrafficRank);
#select @avgTrafficRank;
#drop procedure avgTrafficRankByCountry;

#Procedure 3
create procedure deleteWebsite(inout website_name varchar(45))
delete from websites
where Website = website_name;


#Procedure 4
create procedure getSocialMedia(in websiteID SMALLINT)
select websites.website_id, Facebook_likes, Twitter_mentions, Google_pluses, LinkedIn_mentions, Pinterest_pins
from websites join socialmedia on websites.website_id = socialmedia.website_id
where websites.website_id = websiteID;

call getSocialMedia(1);

#Procedure 5
create procedure getSafeWebsitesByCountry(in countryName varchar(40))
select Website
from websites join safety on websites.website_id = safety.website_id
where Trustworthiness = "Excellent" and 
			Child_Safety = "Excellent" and Privacy = "Excellent" 
            and websites.website_id in (select website_countries.website_id
											from website_countries join countries on website_countries.country_id = countries.country_id
                                            where country = countryName);
                                            
call getSafeWebsitesByCountry("Turkey");

#View 1
create view website_Info_View as
select Website, Traffic_Rank, Facebook_likes, Twitter_mentions, Google_pluses, LinkedIn_mentions, Pinterest_pins,
			Reach_day, Daily_Pageviews, StumbleUpon_views
from ((websites join visitors on websites.website_id = visitors.website_id) 
			join socialmedia on websites.website_id = socialmedia.website_id) 
            join visitors_views on socialmedia.website_id = visitors_views.website_id;

#View 2
create view website_Network_Info as
select Website, Hosted_by, Location, Registrant, Registrar, Subnetworks
from ((((websites join website_registrar on websites.website_id = website_registrar.website_id)
		join registrar on website_registrar.registrar_id = registrar.registrar_id)
        join hostages on websites.website_id = hostages.website_id)
        join website_subnetworks on websites.website_id = website_subnetworks.website_id)
        join subnetworks on website_subnetworks.subnetwork_id = subnetworks.subnetwork_id;
