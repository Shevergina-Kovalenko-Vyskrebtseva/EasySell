create table images (
    id integer not null auto_increment,
    is_preview_image bit,
    product_id integer,
    size bigint,
    content_type varchar(255),
    name varchar(255),
    original_file_name varchar(255),
    bytes longblob,
    primary key (id)
) engine=InnoDB;

create table products (
    id integer not null auto_increment,
    preview_image_id integer not null,
    price integer,
    user_id integer,
    date_of_created datetime(6),
    city varchar(255),
    description text,
    title varchar(255),
    primary key (id)
) engine=InnoDB;

create table user_role (
    user_id integer not null,
    roles enum ('ROLE_USER','ROLE_ADMIN')
) engine=InnoDB;

create table users (
    active bit,
    id integer not null auto_increment,
    image_id integer,
    date_of_created datetime(6),
    password varchar(1000),
    activation_code varchar(255),
    email varchar(255),
    name varchar(255),
    phone_number varchar(255),
    primary key (id)
) engine=InnoDB;

alter table users add constraint UK_94dj9ry3k3tmcsyg8eatp7vvn unique (image_id);
alter table users add constraint UK_6dotkott2kjsp8vw4d0m25fb7 unique (email);
alter table users add constraint UK_9q63snka3mdh91as4io72espi unique (phone_number);
alter table images add constraint images_products_fk foreign key (product_id) references products (id);
alter table products add constraint products_users_fk foreign key (user_id) references users (id);
alter table user_role add constraint user_role_users_fk foreign key (user_id) references users (id);
alter table users add constraint users_images_fk foreign key (image_id) references images (id);