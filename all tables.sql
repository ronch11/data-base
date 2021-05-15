create table county
(
    id           int auto_increment primary key,
    country_name varchar(10) not null unique
);

create table Manufacturer
(
    id        int auto_increment primary key,
    name      nvarchar(50) not null unique,
    countryid int,
    foreign key (countryid) references county (id)
);

create table product
(
    barcode      varchar(25)              not null
        primary key,
    name         varchar(50) charset utf8 not null,
    manufacturld int                      null,
    description  varchar(50) charset utf8 null,
    unitQty      varchar(20) charset utf8 not null,
    Quantity     float                    null,
    bIsWeighted  tinyint(1)               null,
    QtyInPackage int                      null,
    ItemPrice    float                    null,
    constraint product_ibfk_1
        foreign key (manufacturld) references Manufacturer (id)
);

create table branchs
(
    ID           int(10) auto_increment primary key,
    TOWN         varchar(26) not null,
    REVENUE      int(26)     not null,
    MANAGER_NAME varchar(26) not null,
    ADDRESS      varchar(50) not null,
    AREA         int(10)     not null
);

create table product_in_branch(
    id int primary key auto_increment,
    branch_id int(10) not null,
    product_barcode varchar(25)  not null,
    amount_in_stock float default 0 not null check ( amount_in_stock >= 0 ),
    foreign key (branch_id) references branchs(ID),
    foreign key (product_barcode) references product(barcode)
);

create table employees
(
    ID        int(10) auto_increment primary key,
    JOB       varchar(26) not null,
    EMAIL     varchar(30) not null,
    SALARY    int(10)     not null,
    SENIORITY int(10)     not null,
    BARNCH_ID int         not null,
    constraint employees_EMAIL_uindex
        unique (EMAIL),
    constraint employees_ibfk_1
        foreign key (BARNCH_ID) references branchs (ID)
);

create table publicity (
    id int(10) not null primary key auto_increment,
    price int(10) not null check ( price >= 0 ),
    location nvarchar(26) not null,
    goal nvarchar(26) NOT NULL
);

create table shareholder
(
    ID         int(10) not null primary key auto_increment,
    PERCENTAGE int(10) not null check(STOCK >= 0 and STOCK <= 100),
    EMAIL      varchar(26) not null unique,
    NAME       varchar(26) not null
);

create table manufacturer_expenses(
    id int primary key auto_increment,
    manufacturer_id int not null,
    expenses float default 0 not null check ( expenses >= 0 ),
    date_of_expenses date not null,
    foreign key (manufacturer_id) references Manufacturer(id)
);