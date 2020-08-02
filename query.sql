
##Which are the top ten Jazz bands?


select Ar.Name , count(G.genreid) as num 
from Artist Ar 
join Album Al
on Ar.ArtistId = Al.ArtistId
join Track T
on Al.AlbumId = T.AlbumId
join Genre G
on T.genreid = G.genreid
where g.name = 'Jazz'
GROUP by Ar.Name
order by 2 DESC
limit 10;


##which are the top ten albums by the Sales ($)?


select Al.Title , sum(i.total) as sales
from Album Al
join Track T
on Al.Albumid = T.Albumid 
join InvoiceLine il
on T.TrackId = il.TrackId 
join Invoice i
on il.InvoiceId = i.InvoiceId
GROUP by Al.Title
order by 2 DESC
limit 10;


##What are the total sales per each country?


Select c.country , sum (i.Total) as the_sales_$
from customer c
join invoice i 
on c.CustomerId = i.CustomerId
GROUP by c.country
order by 2 DESC
limit 10;

##Which track did the music store have the greatest sales in 2010?


SELECT T.Name , sum(i.total) as sales 
from Track T
join InvoiceLine il
on t.TrackId = il.TrackId
join invoice i
on il.InvoiceId = i.InvoiceId
where  i.InvoiceDate between '2010-01-01' and '2010-12-31'
group by T.Name 
order by 2 desc 
limit 10
;
