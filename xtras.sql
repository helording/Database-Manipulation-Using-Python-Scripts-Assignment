-- COMP3311 20T3 Ass3 ... extra database definitions
-- add any views or functions you need to this file

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

create or replace function 
	bioyear(name text, birth_year int) 
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
		where n.name ~* $1 and n.birth_year = $2

	union

		select m.title as movie, m.start_year as year, cr.role as role, 'c' as rType, p.ordering as order1
		from Names n
		join crew_roles cr on (n.id = cr.name_id)
		join movies m on (cr.movie_id = m.id)
		natural join Principals p
		where n.name ~* $1 and n.birth_year = $2
		
	) results
	order by year, movie, rType, order1, role;

$$ language sql;







