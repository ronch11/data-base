create table shareholder
(
    ID         int(10) not null primary key auto_increment,
    STOCK int(10) not null check(STOCK >= 0 and STOCK <= 100),
    EMAIL      varchar(26) not null unique,
    NAME       varchar(26) not null
);