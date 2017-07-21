create table list (
  id serial primary key,
  name text not null unique
);

create table todos (
  id serial primary key,
  name text not null,
  completed boolean not null default false,
  list_id int not null references list(id)
);
