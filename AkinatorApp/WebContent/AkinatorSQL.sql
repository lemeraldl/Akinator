CREATE TABLE UserBoard(
   usernum number NOT NULL,
   id varchar2(20),
   pass varchar2(100),
   name varchar2(20),
   email varchar2(40),
   phonenum varchar2(20),
   juminnum number,
   profileimage varchar2(20),
   constraint pk_usernum   primary key(usernum)
);

drop table UserBoard cascade constraint;

alter table userboard add(
	interest1_smallCate varchar2(20), 
	interest1_keyword varchar2(20),
	interest2_smallCate varchar2(20), 
	interest2_keyword varchar2(20),
	interest3_smallCate varchar2(20), 
	interest3_keyword varchar2(20)
);

select * from productboard where id='sssssttt';

delete  from userboard where usernum =86;

select * from userboard;
select * from productboard where id='dongli';

create sequence usernum;
insert into userBoard values(usernum.nextVal,'admin1','1','admin','admin@admin.admin','admin','1111','null','null','null','null','null','null','null');	--관리자가입
delete from USERBOARD where id='admin1';

--인증정보 테이블
CREATE TABLE AUTHINFO(
	phonenum varchar2(20),
	authcomplete varchar2(10),	
   authno varchar2(30));


create table followBoard(
   usernum      number,
   follownum    number,
   followfriend varchar2(20),
   followme		varchar2(20),
   productnum	number,
   constraint pk_follownum   primary key(follownum)
);
create sequence follownum;

create table productBoard(
   goodsName varchar2(50),
   productnum number,      --s_no
   usernum   number,         --userid비슷   
   price   number,
   countnum number,
   useddegree varchar2(50),   --goodsCondition
   bigCategory varchar2(50),
   smallCategory varchar2(50),
   sepaycheck   varchar2(50),   --chk1
   delipaycheck varchar2(50),   --chk2
   tradecheck   varchar2(50),   --chk3
   quantity   number,
   id      varchar2(50),
   tag         varchar2(50),
   productcontents   varchar2(500),   --contents
   regdate    date,
   buydate      varchar2(50),   --새로운것
   zzimnum      number,
   producimg1   varchar2(50),
   producimg2   varchar2(50),
   producimg3   varchar2(50),
   producimg4   varchar2(50),
   producimg5   varchar2(50),
   producimg6   varchar2(50),
   constraint pk_productnum primary key(productnum)
);
create sequence productnum;

create table replyBoard(
replynum   number,
usernum   number,
contents varchar2(50),
pass   number,
id			varchar(50),
replypos	number,
repregdate date,
productnum number,
constraint pk_replynum primary key(replynum)
);
create sequence replynum;

create table zzimnumber(
zzimnum number,
productnum number,
constraint zzimnumber_pk primary key(zzimnum)
);
create sequence zzimnum;

create table zziminteresting(
zzim number,
productnum number,
usernum number,
constraint zzimin_pk primary key(zzim)
);
create sequence zzim;

create table cummunity(
cummunitynum   number,
usernum number,
subject         varchar2(50),
contents      varchar2(4000),
commucount      number,
commuregdate   varchar2(40),
cummupernum      number,
constraint cummunity_pk primary key(cummunitynum)
);
create sequence cummunitynum;

create table ord(
ordnum      number,
ordname      varchar2(10),
buynumber   number,
ordbank      varchar2(10),
ordaccountnum varchar2(10),
orddate      varchar2(20),
price      number,
usernum      number,
constraint ord_pk primary key(ordnum)
);
create sequence ordnum;

CREATE TABLE tblBoard(
	num			number,				-- 글번호
	usernum		number,				-- 참조키
	name		varchar2(20),		-- 작성자
	email		varchar2(50),		
	homepage	varchar2(50),
	phone 		varchar2(20),
	subject		varchar2(50),		-- 글 제목
	content		varchar2(4000),		-- 글 내용
	pass		varchar2(10),
	count		number,				-- 조회수
	ip			varchar2(50),		-- 작성자 ip주소
	regdate		date,				-- 등록일
	pos			number,				-- 답변의 위치
	depth		number,				-- 답변의 레벨
	constraint pk_num	primary key(num)	
);
CREATE SEQUENCE seq_numboard; -- 게시판 시퀀스

CREATE TABLE replyTest(
	num			number,
	subject		varchar2(10),
	pos			number,
	depth		number
);

select * from PRODUCTBOARD;

------------------------------------------------------

select * from followBoard;
drop table userboard cascade constraint;
drop table followBoard cascade constraint;
drop table productBoard cascade constraint;
drop table replyBoard cascade constraint;
drop table zzimnumber cascade constraint;
drop table zziminteresting cascade constraint;
drop table cummunity cascade constraint;
drop table ord cascade constraint;
drop table tblboard cascade constraint;

alter table productboard add productnum 
alter table userboard modify phonenum varchar2(20);
select * from userboard
insert into USERBOARD values('1004','mokaka','1','mokhwan','mok@m.c','0101111111','8912191111111','hi');
alter table userboard drop column phonenum;
ALTER TABLE userboard ADD phonenum varchar2(20);
ALTER TABLE tblboard ADD usernum number;
ALTER TABLE followboard ADD productnum number;

select * from productBoard a full outer join userboard b on (a.usernum=b.usernum) group by regDate order by regDate DESC;   
--요기 해보기!
delete from userboard where usernum=1;

select *
from (select * from userboard b full outer join productBoard a on (a.usernum=b.usernum)) order by regDate DESC
 
delete from userboard
where id=(select id from userboard where usernum='21') cascade constraint;
alter table 

delete from Userboard;
drop table Userboard;


drop table followboard cascade constraint;

alter table followBoard add constraint constraint UserBoard_fk foreign key(usernum)
   REFERENCES UserBoard(usernum) on delete cascade;

select * from replyBoard where productnum=45 order by replypos;
select * from productBoard a full outer join userboard b on (a.usernum=b.usernum) order by regDate DESC
select * from productBoard a full outer join userboard b on (a.usernum=b.usernum) where smallCategory='"+cate+"' group by a.regDate;


select * from productboard order by regDate, countnum desc;


alter table productBoard add constraint Userpr_fk foreign key(usernum) references userboard(usernum) on delete cascade;


alter table productBoard drop column regdate;
alter table productBoard ADD regdate date;
alter table productBoard ADD id varchar(50);

delete from productboard;
drop table productboard cascade constraint;

alter table productBoard add(countnum number);
drop table productBoard;
select * from PRODUCTBOARD;
--시퀀스체크
select * from user_sequences;


alter table replyboard add id varchar(50);
select * from replyboard;
alter table replyboard add replypos number;
alter table replyBoard modify(repregdate date);
drop table replyBoard;

