create schema if not exists public;
--CREATING DATABASE
create DATABASE COURSE_MANAGEMENT with OWNER postgres;
alter SCHEMA public OWNER TO postgres;
--SCHEMA
create table course
(
    id     serial,
    title   varchar(10),
    status varchar(10),
    primary key (id)
);
create table users(
    id         serial,
    first_name varchar(10),
    last_name  varchar(10),
    email      varchar(15),
    user_role  varchar(10),
    status     varchar(10),
    course_id  int,
    primary key (id),
    foreign key (course_id)
        references course (id)
);
alter table users  owner to postgres;
alter table course owner to postgres;
create table home_work
(
    id    serial,
    title varchar(15),
    text text,
    file_path varchar(50),
    course_id int,
    primary key (id),
    foreign key (course_id)
        references course (id)
    );
alter table home_work owner to postgres;
create table solution
(
    id serial,
    text text,
    status varchar(10),
    mark int,
    user_id int,
    home_work_id int,
    primary key (id),
    foreign key (user_id)
        references users (id),
    foreign key (home_work_id)
        references home_work (id)
    );
alter table solution owner to postgres;