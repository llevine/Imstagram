drop table if exists members cascade;
drop table if exists photos cascade;
drop table if exists tags cascade;
drop table if exists photos_tags;

create table members(
	id serial primary key,
	owner varchar(255) not null,
	name varchar(255),
	img_url text,
	-- DATE - format YYYY-MM-DD
	birthday date,
	location varchar(255),
	breed varchar(255),
	activities text,
	toys text,
	created_at timestamp
);

create table photos(
	id serial primary key,
	title varchar(255),
	img_url text,
	location varchar(255),
	created_at timestamp,
	caption varchar(255),
	member_id integer references members
);

create table tags(
	id serial primary key,
	name varchar
);

create table photos_tags(
	photo_id integer references photos,
	tag_id integer references tags
);