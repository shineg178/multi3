drop table UserInfo;
--사용자 정보 테이블
create table UserInfo(
    userNum number(8) primary key,--회원번호
    userName varchar2(20) not null,--회원이름
    userId varchar2(30) not null,--회원아이디
    userNick varchar2(20)--닉네임
);

drop table donationOrg;
--기부단체 테이블 
create table donationOrg(--기부단체
    donOrgNum number(8) primary key,--기부단체번호
    donOrgInfo varchar2(1000),--기부단체설명
    donBankAccount number(8),--기부단체계좌번호
    donBankName varchar2(50)--기부단체은행명
);

drop table donation;
--기부 테이블
create table donation(
    donNum number(8) primary key,--기부번호
    userNum_fk number(8)references userInfo(userNum),--회원번호
    donOrgNum_fk number(8) references donationOrg(donOrgNum),--기부단체번호
    donAmount number(8) not null--기부금액
);



select * from userInfo;
select * from donationOrg;
select * from donation;

insert into userInfo values(1001, '김회원', 'kim1001', '김회원닉네임');
insert into userInfo values(1002, '이회원', 'lee1002', '이회원닉네임');
insert into userInfo values(1003, '박지은', 'park1003', '박지은닉네임');
insert into userInfo values(1004, '최승철', 'choi1004', '최승철닉네임');
insert into userInfo values(1005, '홍은지', 'hong1005', '홍은지닉네임');
insert into userInfo values(1006, '장예은', 'jang1006', '장예은닉네임');

insert into donationOrg values(2001, '서울어린이병원', 12345678, '서울은행');
insert into donationOrg
values(2002, '사랑의재단은 사회의 극빈층과 빈곤한 이웃을 위해서 자원봉사하던 젊은이들이 성인이되면 어려운 이웃을 위한 삶을 살자던 약속을 지키기 위해서 뜻을 모아 설립한 시민 NGO단체입니다', '4444', '사랑은행');
insert into donationOrg
values(2003, '두드림은 스스로 꿈을 꾸고 이루어가기 어려운 장애가정청소년의 홀로서기를 지원하며 미래를 함께하는 장기적인 인적투자 프로젝트의 한국장애인재활협회입니다', 3333, '두드림은행');

insert into donation values(1, 1001, 2001, 100000);
insert into donation values(2, 1002, 2001, 200000);
insert into donation values(3, 1001, 2001, 10000);
insert into donation values(4, 1001, 2001, 100000);
insert into donation values(5, 1003, 2001, 100);
insert into donation values(6, 1004, 2002, 1000);
insert into donation values(7, 1005, 2003, 10000);
insert into donation values(8, 1006, 2001, 2000);
insert into donation values(9, 1003, 2001, 18000);
insert into donation values(10, 1006, 2002, 5000);
commit;