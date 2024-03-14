create database c1122_student;
use c1122_student;
create table giao_vien(
	ma_gv varchar(255) primary key,
    ten varchar(255),
    trinh_do varchar(255)
);

create table lop(
	ma_lop varchar(255) primary key,
    khoa varchar(255),
    so_hv int,
    ma_gv varchar(255),
    
    foreign key (ma_gv) references giao_vien(ma_gv)
);

create table mon_hoc(
	ma_mh varchar(255) primary key,
    ten varchar(255),
    so_gio int
);

create table hoc_vien(
	ma_hv varchar(255) primary key,
    ten varchar(255),
    ngay_sinh date not null,
    dia_chi varchar(255),
    ma_lop varchar(255),
    
    foreign key (ma_lop) references lop(ma_lop)
);
create table bang_cap(
	ma_bc varchar(255) primary key,
    ngay_cap date,
    ten varchar(255),
    ma_hv varchar(255),
    
    foreign key (ma_hv) references hoc_vien(ma_hv)
);

create table hoc_vien_mon_hoc(
	ma_hv varchar(255),
    ma_mh varchar(255),
    diem_so int,
    
    check (diem_so>5),
    primary key (ma_hv, ma_mh),
    foreign key (ma_hv) references hoc_vien(ma_hv),
    foreign key (ma_mh) references mon_hoc(ma_mh)
);
