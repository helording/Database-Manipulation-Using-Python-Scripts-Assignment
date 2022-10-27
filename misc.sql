-- EVERY BIT OF TRASH FROM ASS3

select rating, title, start_year
from Movies 
order by rating desc limit 5;


select title, start_year, id
from Movies
where title ~* 'mothra'
order by start_year, title;

select ordering, local_title, region, language, extra_info
from Aliases
where movie_id = 10062622
order by ordering;


select title, start_year, id
from Movies
where title ~* 'the ring' and start_year = 1965
order by start_year, title;

select *
from crew_roles cr
join names n on (cr.name_id = n.id)

select *
from acting_roles ar
join names n on (ar.name_id = n.id)
natural join principals
where movie_id = 10062622;

select *
from crew_roles cr
join names n on (cr.name_id = n.id)
natural join principals
where movie_id = 10062622;

select name, played
from acting_roles ar
join names n on (ar.name_id = n.id)
natural join principals
where movie_id = 10062622
order by ordering, played;

select name, role
from crew_roles cr
join names n on (cr.name_id = n.id)
natural join principals
where movie_id = 10062622
order by ordering, role;


======== Last question =========

select * 
from Names n
join Principals p on (n.id = p.name_id)
join Movies m on (p.movie_id = m.id)
where n.name ~* 'spike lee' and m.title ~* 'School Daze'
order by ordering;


	select m.title as movie, m.start_year as year, ar.played as role, 'a' as rType
	from Names n
	join acting_roles ar on (n.id = ar.name_id)
	join movies m on (ar.movie_id = m.id)
	natural join Principals p
	where n.name ~* 'spike lee'
	order by m.start_year, m.title, p.ordering, ar.played;
	
	
	select m.title as movie, m.start_year as year, cr.role as role, 'c' as rType 
	from Names n
	join crew_roles cr on (n.id = cr.name_id)
	join movies m on (cr.movie_id = m.id)
	natural join Principals p
	where n.name ~* 'spike lee'
	order by m.start_year, m.title, p.ordering, cr.role;



create or replace function 
	bio(name text) 
		returns table (movie text, year int, role text, rType text, ordering int)
as $$
	select movie, year, role, rType, order1
	from
	(
		select m.title as movie, m.start_year as year, ar.played as role, 'a' as rType, p.ordering as order1
		from Names n
		join acting_roles ar on (n.id = ar.name_id)
		join movies m on (ar.movie_id = m.id)
		natural join Principals p
		where n.name ~* $1

	union

		select m.title as movie, m.start_year as year, cr.role as role, 'c' as rType, p.ordering as order1
		from Names n
		join crew_roles cr on (n.id = cr.name_id)
		join movies m on (cr.movie_id = m.id)
		natural join Principals p
		where n.name ~* $1
		
	) results
	order by year, movie, rType, order1, role;

$$ language sql;


select *
from Names
where name ~* 'rooney'
order by name;

select name, birth_year, death_year
from Names
where name ~* 'belushi'
order by name;

	select m.title as movie, m.start_year as year, ar.played as role, 'a' as rType, p.ordering as order1
		from Names n
		join acting_roles ar on (n.id = ar.name_id)
		join movies m on (ar.movie_id = m.id)
		natural join Principals p
		where n.name ~* 'belushi' and n.birth_year = 1954

	union

		select m.title as movie, m.start_year as year, cr.role as role, 'c' as rType, p.ordering as order1
		from Names n
		join crew_roles cr on (n.id = cr.name_id)
		join movies m on (cr.movie_id = m.id)
		natural join Principals p
		where n.name ~* 'belushi' and n.birth_year = 1954;


