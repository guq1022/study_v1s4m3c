/**************************************************************************************************************
 * Table Name: 내스터디-카테고리 리스트 테이블
 * 필요조건 : studylist, category, member
 * 
 * cateno : 2 => 내 스터디 공지사항
 * cateno : 3 => 내 스터디 자유게시판
 * cateno : 4 => 내 스터디 자료실
 * 
 * 생성 시기 : studylist 테이블에 신규 스터디가 등록되면 해당 스터디의 stdlist_no의 값을 바탕으로 insert.
 * 
 * ex) 신규 스터디 생성. stdlist_no : 1일 때.
 *     
 *     
 *
 ***************************************************************************************************************/

-- 회원 예시 데이터 1 (by 안희홍)
INSERT INTO member(memberno, memid, mememail, mempasswd, memname, memsignkey, memconfirm, memauth, membirth, memgender, memaddress, memphone, 
memsns, memintro, memphoto, memphoto_t, memsize, mbirthvb, mgendervb, maddressvb, mphonevb, msnsvb, mintrovb, mphotovb, memdate)
VALUES((SELECT NVL(MAX(memberno), 0)+1 as memberno FROM member), 'test1', 'test1@gmail.com', '1234', '회원1', 'ascsdawe12382347',
'Y', 'B', '19891025', '여', '서울 강북구 수유동', '01012345678', '인스타그램', '안녕하세요', 'myphoto.jpg', 'myphoto_t.jpg', 0, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', sysdate);


INSERT INTO member(memberno, memid, mememail, mempasswd, memname, memsignkey, memconfirm, memauth, membirth, memgender, memaddress, memphone, 
memsns, memintro, memphoto, memphoto_t, memsize, mbirthvb, mgendervb, maddressvb, mphonevb, msnsvb, mintrovb, mphotovb, memdate)
VALUES((SELECT NVL(MAX(memberno), 0)+1 as memberno FROM member), 'test2', 'test2@gmail.com', '1234', '회원2', 'ascsdawe12382347',
'Y', 'B', '19891025', '여', '서울 강북구 수유동', '01012345678', '인스타그램', '안녕하세요', 'myphoto.jpg', 'myphoto_t.jpg', 0, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', sysdate);


INSERT INTO member(memberno, memid, mememail, mempasswd, memname, memsignkey, memconfirm, memauth, membirth, memgender, memaddress, memphone, 
memsns, memintro, memphoto, memphoto_t, memsize, mbirthvb, mgendervb, maddressvb, mphonevb, msnsvb, mintrovb, mphotovb, memdate)
VALUES((SELECT NVL(MAX(memberno), 0)+1 as memberno FROM member), 'test3', 'test3@gmail.com', '1234', '회원3', 'ascsdawe12382347',
'Y', 'B', '19891025', '여', '서울 강북구 수유동', '01012345678', '인스타그램', '안녕하세요', 'myphoto.jpg', 'myphoto_t.jpg', 0, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', sysdate);


-- 스터디 예시 데이터 1
INSERT INTO "STUDY"."STUDYLIST" (STDLIST_NO, STDLIST_TITLE, STDLIST_EMAIL, STDLIST_TOPIC, STDLIST_TIME,
STDLIST_AREA, STDLIST_DOW, STDLIST_TOT_NUM, STDLIST_CURR_NUM, STDLIST_CONTENT, STDLIST_CNT,
STDLIST_RECOM_CNT, STDLIST_DATE, MEMBERNO, CATENO) 
VALUES ('3', '영어준비반', 'lee3339@naver.com', '영어', '6시',
'서울 종로구', '월수금', '4', '1', '영어를 같이 해요!', '0',
'0', TO_DATE('2017-11-21 12:07:45', 'YYYY-MM-DD HH24:MI:SS'), '1', '10')

-- category 테이블의 insert ( 팀장:이지은 sql 참고 ) 
INSERT INTO "STUDY"."CATEGORY" (CATENO, CATENAME, CATESEQNO, CATEVISIBLE) VALUES ('1', '내스터디', '1', 'Y');
INSERT INTO "STUDY"."CATEGORY" (CATENO, CATENAME, CATESEQNO, CATEVISIBLE) VALUES ('2', '내스터디-공지사항', '2', 'Y');
INSERT INTO "STUDY"."CATEGORY" (CATENO, CATENAME, CATESEQNO, CATEVISIBLE) VALUES ('3', '내스터디-자유게시판', '3', 'Y');
INSERT INTO "STUDY"."CATEGORY" (CATENO, CATENAME, CATESEQNO, CATEVISIBLE) VALUES ('4', '내스터디-자료실', '4', 'Y');
INSERT INTO "STUDY"."CATEGORY" (CATENO, CATENAME, CATESEQNO, CATEVISIBLE) VALUES ('5', '내스터디-스터디 관리', '5', 'Y');

insert into "STUDY"."CATEGORY" (CATENO, CATENAME, CATESEQNO, CATEVISIBLE) values(10, '스터디그룹리스트', 1, 'Y');


CREATE TABLE my_std_catelist(
    mylistno                          NUMBER(10)     NOT NULL    PRIMARY KEY,
    stdlist_no                        NUMBER(10)     NULL ,
    cateno                            NUMBER(10)     NULL ,
  FOREIGN KEY (stdlist_no) REFERENCES studylist (stdlist_no),
  FOREIGN KEY (cateno) REFERENCES category (cateno)
);

COMMENT ON TABLE my_std_catelist is '내스터디-카테고리 리스트 테이블';
COMMENT ON COLUMN my_std_catelist.mylistno is '내스터디리스트 구분 번호';
COMMENT ON COLUMN my_std_catelist.stdlist_no is '스터디번호';
COMMENT ON COLUMN my_std_catelist.cateno is '카테고리번호';



-- 1번 회원이 1번 스터디를 개설한 상황.

1) 입력
-- 회원이 스터디를 개설하면 자동으로 아래의 insert문이 수행되어야 함.

-- 1번 스터디의 공지사항 번호
INSERT INTO "STUDY"."MY_STD_CATELIST" (MYLISTNO, STDLIST_NO, CATENO)
VALUES ((SELECT NVL(MAX(MYLISTNO), 0) + 1 as MYLISTNO FROM "STUDY"."MY_STD_CATELIST"), '1', '2');

-- 1번 스터디의 자유게시판 번호
INSERT INTO "STUDY"."MY_STD_CATELIST" (MYLISTNO, STDLIST_NO, CATENO)
VALUES ((SELECT NVL(MAX(MYLISTNO), 0) + 1 as MYLISTNO FROM "STUDY"."MY_STD_CATELIST"), '1', '3');

-- 1번 스터디의 자료실 번호
INSERT INTO "STUDY"."MY_STD_CATELIST" (MYLISTNO, STDLIST_NO, CATENO)
VALUES ((SELECT NVL(MAX(MYLISTNO), 0) + 1 as MYLISTNO FROM "STUDY"."MY_STD_CATELIST"), '1', '4');

-- 1번 스터디의 스터디 관리 번호
INSERT INTO "STUDY"."MY_STD_CATELIST" (MYLISTNO, STDLIST_NO, CATENO)
VALUES ((SELECT NVL(MAX(MYLISTNO), 0) + 1 as MYLISTNO FROM "STUDY"."MY_STD_CATELIST"), '1', '5');


2) 수정
UPDATE "STUDY"."MY_STD_CATELIST"
SET CATENO=5
WHERE STDLIST_NO=1 AND CATENO=4;

3) 삭제 - 스터디 삭제 시 (카테고리 정보 삭제 후 스터디 리스트 삭제 가능.)
-- 1번 스터디의 하위 카테고리 삭제
DELETE FROM "STUDY"."MY_STD_CATELIST"
WHERE STDLIST_NO=1;




/**********************************/
/* Table Name: 내 스터디 글 목록
 * 
 * 선행 테이블 : my_std_catelist, member
 * FK : mylistno(내스터디-카테고리 리스트 테이블), memberno(회원번호=글 등록자)
 *
 **********************************/
CREATE TABLE my_pds(
    pdsno                             NUMBER(10)     NOT NULL    PRIMARY KEY,
    pdstitle                          VARCHAR2(100)    NOT NULL,
    pdspasswd                         VARCHAR2(20)     NULL ,
    pdscontent                        VARCHAR2(4000)     NULL ,
    pdsfile1                          VARCHAR2(10)     NULL ,
    pdsfilesize                       NUMBER(10)     DEFAULT 0     NULL ,
    pdsthumb                          VARCHAR2(100)    NULL ,
    pdsword                           VARCHAR2(100)    NULL ,
    pdslike                           NUMBER(10)     DEFAULT 0     NULL ,
    pdscnt                            NUMBER(10)     DEFAULT 0     NULL ,
    pdsdate                           DATE     NOT NULL,
    memberno                          NUMBER(10)     NULL ,
    mylistno                          NUMBER(10)     NULL ,
  FOREIGN KEY (mylistno) REFERENCES my_std_catelist (mylistno),
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE my_pds is '내 스터디 글 목록';
COMMENT ON COLUMN my_pds.pdsno is '글 번호';
COMMENT ON COLUMN my_pds.pdstitle is '글 제목';
COMMENT ON COLUMN my_pds.pdspasswd is '글 비밀번호';
COMMENT ON COLUMN my_pds.pdscontent is '글 내용';
COMMENT ON COLUMN my_pds.pdsfile1 is '글 첨부파일명';
COMMENT ON COLUMN my_pds.pdsfilesize is '글 사진 사이즈';
COMMENT ON COLUMN my_pds.pdsthumb is '글 사진 thumb';
COMMENT ON COLUMN my_pds.pdsword is '글 검색어';
COMMENT ON COLUMN my_pds.pdslike is '글 추천수';
COMMENT ON COLUMN my_pds.pdscnt is '글 조회수';
COMMENT ON COLUMN my_pds.pdsdate is '글 작성일';
COMMENT ON COLUMN my_pds.memberno is '회원번호';
COMMENT ON COLUMN my_pds.mylistno is '내스터디리스트 구분 번호';



1) 입력
INSERT INTO my_pds(pdsno, pdstitle, pdspasswd, pdscontent, pdsfile1, pdsfilesize, pdsthumb, pdsword, pdslike, pdscnt, pdsdate, memberno, mylistno)
VALUES( (SELECT NVL(MAX(pdsno), 0) + 1 as pdsno FROM my_pds),  '공지사항 1번 글', '1234', '공지사항 입니다.', '', 0, '', '공지사항', 0, 0, sysdate, 1, 1);

INSERT INTO my_pds(pdsno, pdstitle, pdspasswd, pdscontent, pdsfile1, pdsfilesize, pdsthumb, pdsword, pdslike, pdscnt, pdsdate, memberno, mylistno)
VALUES( (SELECT NVL(MAX(pdsno), 0) + 1 as pdsno FROM my_pds),  '자유게시판 1번 글', '1234', '자유게시판 입니다.', '', 0, '', '자유게시판 1번글 내용 입니다', 0, 0, sysdate, 1, 2);

INSERT INTO my_pds(pdsno, pdstitle, pdspasswd, pdscontent, pdsfile1, pdsfilesize, pdsthumb, pdsword, pdslike, pdscnt, pdsdate, memberno, mylistno)
VALUES( (SELECT NVL(MAX(pdsno), 0) + 1 as pdsno FROM my_pds),  '자료실 1번 글', '1234', '자료실 입니다.', '', 0, '', '자료실', 0, 0, sysdate, 1, 3);

INSERT INTO my_pds(pdsno, pdstitle, pdspasswd, pdscontent, pdsfile1, pdsfilesize, pdsthumb, pdsword, pdslike, pdscnt, pdsdate, memberno, mylistno)
VALUES( (SELECT NVL(MAX(pdsno), 0) + 1 as pdsno FROM my_pds),  '공지사항 2번 글', '1234', '공지사항2 입니다.', '', 0, '', '공지사항', 0, 0, sysdate, 1, 1);

INSERT INTO my_pds(pdsno, pdstitle, pdspasswd, pdscontent, pdsfile1, pdsfilesize, pdsthumb, pdsword, pdslike, pdscnt, pdsdate, memberno, mylistno)
VALUES( (SELECT NVL(MAX(pdsno), 0) + 1 as pdsno FROM my_pds),  '자유게시판 2번 글', '1234', '자유게시판2 입니다.', '', 0, '', '자유게시판', 0, 0, sysdate, 1, 2);

INSERT INTO my_pds(pdsno, pdstitle, pdspasswd, pdscontent, pdsfile1, pdsfilesize, pdsthumb, pdsword, pdslike, pdscnt, pdsdate, memberno, mylistno)
VALUES( (SELECT NVL(MAX(pdsno), 0) + 1 as pdsno FROM my_pds),  '자료실 2번 글', '1234', '자료실2 입니다.', '', 0, '', '자료실', 0, 0, sysdate, 1, 3);

2) 조회

-- 1번 스터디의 공지사항 글 조회.
-- mylistno = stdlist_no + cateno

select *
from my_pds
where mylistno IN (
  select mylistno
  from my_std_catelist
  where stdlist_no= 1 AND cateno=2
)

-- 1번 스터디의 자유게시판 글 조회.
select *
from my_pds
where mylistno IN (
  select mylistno
  from my_std_catelist
  where stdlist_no= 1 AND cateno=3
)

-- 1번 스터디의 자료실 글 조회.
select *
from my_pds
where mylistno IN (
  select mylistno
  from my_std_catelist
  where stdlist_no= 1 AND cateno=4
)

-- 1번 스터디 관련 글 전체 조회.
select *
from my_pds
where mylistno IN (
  select mylistno
  from my_std_catelist
  where stdlist_no= 1
)


3) 수정
UPDATE my_pds
SET pdstitle = '공지사항 1번 글 (1차 수정)',
    pdscontent = '1차 수정',
    pdsfile1='',
    pdsfilesize=0,
    pdsthumb='',
    pdsword='공지'
WHERE pdsno = 1;


4) 삭제
DELETE
FROM my_pds
WHERE pdsno=1;


5) 글 조회수 증가
UPDATE my_pds
SET pdscnt=pdscnt+1
WHERE pdsno=2;


6) 글 좋아요 증가
UPDATE my_pds
SET pdslike=pdslike+1
WHERE pdsno=2;

8) 검색

SELECT pdsno, pdstitle, pdspasswd, pdscontent, pdsfile1, pdsfilesize, pdsthumb,
pdsword, pdslike, pdscnt, pdsdate, memberno, mylistno
FROM my_pds
WHERE mylistno=1 AND pdsword LIKE 'test';

/*==========================================================================================*/
9) 페이징 기본 개념

DROP TABLE PG;
 
CREATE TABLE PG(
  num NUMBER(5) NOT NULL,
  title  VARCHAR(20) NOT NULL,
  PRIMARY KEY(num)
);
 
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '01월');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '02월');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '03월');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '04월');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '05월');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '06월');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '07월');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '08월');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '09월');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '10월');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '11월');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '12월');


SELECT num, title, rownum
FROM pg;

-- 2,3월 삭제
DELETE FROM pg WHERE num=2 or num=3;

-- 페이징시는 일정한 순차값이 생성되는 rownum 값을 사용합니다.
-- rownum주의: rownum은 정렬(ORDER BY ~)보다 먼저 생성됨으로
-- 정렬을 한 후 rownum 컬럼을 사용합니다. 













/*==========================================================================================*/


/**********************************/
/* Table Name: 내스터디 댓글 */
/**********************************/
CREATE TABLE my_reply(
    mycom_no                          NUMBER(10)     NOT NULL    PRIMARY KEY,
    mycom_title                       VARCHAR2(200)    NULL ,
    mycom_content                     VARCHAR2(200)    NULL ,
    mycom_passwd                      NUMBER(10)     NULL ,
    mycom_file1                       VARCHAR2(10)     NULL ,
    mycom_size                        NUMBER(10)     NULL ,
    mycom_thumb                       VARCHAR2(100)    NULL ,
    mycom_good                        NUMBER(10)     DEFAULT 0     NULL ,
    mycom_level                       NUMBER(10)     DEFAULT 0     NULL ,
    mycom_rank                        NUMBER(10)     NULL ,
    mycom_cnt                         NUMBER(10)     DEFAULT 0     NULL ,
    mycom_date                        DATE     NULL ,
    memberno                          NUMBER(10)     NULL ,
    pdsno                             NUMBER(10)     NULL ,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (pdsno) REFERENCES my_pds (pdsno)
);

COMMENT ON TABLE my_reply is '내스터디 댓글';
COMMENT ON COLUMN my_reply.mycom_no is '내스터디댓글번호';
COMMENT ON COLUMN my_reply.mycom_title is '댓글 제목';
COMMENT ON COLUMN my_reply.mycom_content is '댓글 내용';
COMMENT ON COLUMN my_reply.mycom_passwd is '댓글 비밀번호';
COMMENT ON COLUMN my_reply.mycom_file1 is '댓글 첨부 파일명';
COMMENT ON COLUMN my_reply.mycom_size is '댓글 첨부 파일 사이즈';
COMMENT ON COLUMN my_reply.mycom_thumb is '댓글 썸 이미지명';
COMMENT ON COLUMN my_reply.mycom_good is '댓글 좋아요';
COMMENT ON COLUMN my_reply.mycom_level is '댓글 차수';
COMMENT ON COLUMN my_reply.mycom_rank is '댓글 순서';
COMMENT ON COLUMN my_reply.mycom_cnt is '댓글 조회수';
COMMENT ON COLUMN my_reply.mycom_date is '댓글 생성일';
COMMENT ON COLUMN my_reply.memberno is '회원번호';
COMMENT ON COLUMN my_reply.pdsno is '글 번호';




1) 입력
-- pdsno : pdsno는 댓글의 대댓글을 구분할 때 사용 가능.
-- mycom_level : 댓글의 차수를 의미한다. 1이 가장 최상위 댓글이다.
INSERT INTO my_reply(mycom_no, mycom_title, mycom_content, mycom_passwd, mycom_file1, mycom_size, mycom_thumb, mycom_good, mycom_level, mycom_rank, mycom_cnt, mycom_date, memberno, pdsno)
VALUES( (SELECT NVL(MAX(mycom_no), 0) + 1 as mycom_no FROM my_reply), '1번 스터디 1번 공지사항 댓글', '1번 댓글 입니다.', '1234', '', 0, '', 0, 1, 3, 0, sysdate, 1, 7);

INSERT INTO my_reply(mycom_no, mycom_title, mycom_content, mycom_passwd, mycom_file1, mycom_size, mycom_thumb, mycom_good, mycom_level, mycom_rank, mycom_cnt, mycom_date, memberno, pdsno)
VALUES( (SELECT NVL(MAX(mycom_no), 0) + 1 as mycom_no FROM my_reply), '1번 스터디 1번 공지사항 댓글', '2번 댓글 입니다.', '1234', '', 0, '', 0, 1, 2, 0, sysdate, 1, 7);

INSERT INTO my_reply(mycom_no, mycom_title, mycom_content, mycom_passwd, mycom_file1, mycom_size, mycom_thumb, mycom_good, mycom_level, mycom_rank, mycom_cnt, mycom_date, memberno, pdsno)
VALUES( (SELECT NVL(MAX(mycom_no), 0) + 1 as mycom_no FROM my_reply), '1번 스터디 1번 공지사항 댓글', '3번 댓글 입니다.', '1234', '', 0, '', 0, 1, 1, 0, sysdate, 1, 7);

INSERT INTO my_reply(mycom_no, mycom_title, mycom_content, mycom_passwd, mycom_file1, mycom_size, mycom_thumb, mycom_good, mycom_level, mycom_rank, mycom_cnt, mycom_date, memberno, pdsno)
VALUES( (SELECT NVL(MAX(mycom_no), 0) + 1 as mycom_no FROM my_reply), '1번 스터디 1번 공지사항 댓글 - 댓글', '1번 댓글 - 댓글 입니다.', '1234', '', 0, '', 0, 2, 1, 0, sysdate, 1, 7);


INSERT INTO my_reply(mycom_no, mycom_title, mycom_content, mycom_passwd, mycom_file1, mycom_size, mycom_thumb, mycom_good, mycom_level, mycom_rank, mycom_cnt, mycom_date, memberno, pdsno)
VALUES( (SELECT NVL(MAX(mycom_no), 0) + 1 as mycom_no FROM my_reply), '1번 스터디 1번 공지사항 댓글 - 댓글', '2번 댓글 - 댓글 입니다.', '1234', '', 0, '', 0, 2, 1, 0, sysdate, 1, 7);


-- 1번 스터디 공지사항 2번 글에 대한 댓글 1, 2, 3

INSERT INTO my_reply(mycom_no, mycom_title, mycom_content, mycom_passwd, mycom_file1, mycom_size, mycom_thumb, mycom_good, mycom_level, mycom_rank, mycom_cnt, mycom_date, memberno, pdsno)
VALUES( (SELECT NVL(MAX(mycom_no), 0) + 1 as mycom_no FROM my_reply), '1번 스터디 2번 공지사항 댓글', '1번 댓글', '1234', '', 0, '', 0, 1, 3, 0, sysdate, 1, 4);


INSERT INTO my_reply(mycom_no, mycom_title, mycom_content, mycom_passwd, mycom_file1, mycom_size, mycom_thumb, mycom_good, mycom_level, mycom_rank, mycom_cnt, mycom_date, memberno, pdsno)
VALUES( (SELECT NVL(MAX(mycom_no), 0) + 1 as mycom_no FROM my_reply), '1번 스터디 2번 공지사항 댓글', '2번 댓글', '1234', '', 0, '', 0, 1, 2, 0, sysdate, 1, 4);


INSERT INTO my_reply(mycom_no, mycom_title, mycom_content, mycom_passwd, mycom_file1, mycom_size, mycom_thumb, mycom_good, mycom_level, mycom_rank, mycom_cnt, mycom_date, memberno, pdsno)
VALUES( (SELECT NVL(MAX(mycom_no), 0) + 1 as mycom_no FROM my_reply), '1번 스터디 2번 공지사항 댓글', '3번 댓글', '1234', '', 0, '', 0, 1, 1, 0, sysdate, 1, 4);


2) 조회(pdsno, mycom_no)
-- my_reply에 댓글의 작성자가 memberno로 저장되어 있지만 서브쿼리를 통해 얼마든지 출력이 가능하다.
-- 단, 서브쿼리를 사용할때 서브쿼리를 통해 리턴되는 컬럼이 단수개인지 복수개인지 잘 검증을 하고 생각해야 한다.
-- SELECT 절에 서브쿼리를 사용하여 memberno를 가지고 회원의 이름을 출력하게 한다.

-- SELECT 절에서 서브쿼리는 무조건 단수개여야 한다. 도메인 원자성에 입각.
SELECT mycom_title, mycom_content, mycom_file1, mycom_size, mycom_thumb, mycom_good, mycom_cnt, mycom_date,
       (select memname
        from member
        where memberno=1
       ) as 글쓴이
FROM my_reply
WHERE mycom_no=1;


select *
FROM my_reply
WHERE pdsno=7
ORDER BY mycom_rank ASC;

3) 수정
UPDATE my_reply
SET mycom_title ='1번 스터디 1번 공지사항 댓글(1차수정)',
		mycom_content ='1번 댓글 입니다.(1차수정)',
		mycom_file1 = 'test.jpg',
		mycom_size = 123,
		mycom_thumb = 'test_t.jpg'
		
WHERE mycom_no=1;

4) 삭제
DELETE
FROM my_reply
WHERE mycom_no=2;


5) 댓글 추천 증가
UPDATE my_reply
SET mycom_good=mycom_good+1
WHERE mycom_no=1;


6) 조회 증가
UPDATE my_reply
SET mycom_cnt=mycom_cnt+1
WHERE mycom_no=1;


7) 댓글의 출력 순서 변화.
-- (최신 댓글이 가장 상단에 위치.)
-- (단, 대댓글은 pdsno와 mycom_level이 같은 조건에서 mycom_rank로 오름차순 정렬)

-- my_pds의 본문에 댓글을 작성 할 때.
UPDATE my_reply
SET mycom_rank=mycom_rank+1
WHERE pdsno=부모글 번호 AND mycom_rank > 0;

-- 작성된 댓글에 댓글을 작성할 때.
UPDATE my_reply
SET mycom_rank=mycom_rank+1
WHERE pdsno=부모글 번호 AND mycom_rank > (현재 댓글을 달고자하는 부모 댓글의 rank).

/*
 * 본문 테이블과 댓글 테이블을 분리하므로써 본문 테이블(my_pds)에는 댓글의 우선순위와 차수를 나타내는 컬럼이 없다.
 * 그러므로 본문에 댓글을 다는 경우 my_reply에서 동일한 pdsno를 가지고 있는 튜플들의 mycom_rank를 모두 +1 한다.
 * 즉, WHERE mycom_rank > 0 의 조건절을 주어 가장 최우선 자리인 '0'의 자리를 마련한다.
 * 
 * 하지만, 댓글(부모 댓글)에 댓글을 작성하는 경우(대 댓글)
 * 
 * 부모 댓글은 우선순위와 차수 컬럼을 가지고 있기에 {부모 댓글}이 지금 가지고 있는 mycom_rank를 기준으로
 * 조건절 [WHERE mycom_rank > 부모댓글의 mycom_rank]를 하여 그 다음의 공간을 마련한다.
 * 
 * 
 * 실습과는 유사한 알고리즘과 컨트롤러가 예상되지만, 어느정도 생각할 시간이 필요할 듯.
 * 
 */


/**********************************/
/* Table Name: 쪽지 테이블 */
/**********************************/
drop table message;

CREATE TABLE message(
    msn_no                            NUMBER(10)     NOT NULL    PRIMARY KEY,
    memberno_send                     NUMBER(10)     NULL ,
    memberno_rev                      NUMBER(10)     NULL ,
    msn_title                         VARCHAR2(100)    NULL ,
    msn_content                       VARCHAR2(500)    NULL ,
    msn_send_del                      VARCHAR2(10)     DEFAULT 'N'     NOT NULL,
    msn_recv_del                      VARCHAR2(10)     DEFAULT 'N'     NOT NULL,
    msn_confirm                       VARCHAR2(10)     DEFAULT 'N'     NOT NULL ,
    msn_rev_date                      DATE     NULL ,
    msn_date                          DATE     NULL ,
  FOREIGN KEY (memberno_send) REFERENCES member (memberno),
  FOREIGN KEY (memberno_rev) REFERENCES member (memberno)
);

COMMENT ON TABLE message is '쪽지 테이블';
COMMENT ON COLUMN message.msn_no is '쪽지 번호';
COMMENT ON COLUMN message.memberno_send is '보낸이(회원번호)';
COMMENT ON COLUMN message.memberno_rev is '받는이(회원번호)';
COMMENT ON COLUMN message.msn_title is '쪽지 제목';
COMMENT ON COLUMN message.msn_content is '쪽지 내용';
COMMENT ON COLUMN message.msn_send_del is '발신자 삭제여부';
COMMENT ON COLUMN message.msn_recv_del is '수신자 삭제여부';
COMMENT ON COLUMN message.msn_confirm is '쪽지 수신 여부';
COMMENT ON COLUMN message.msn_rev_date is '쪽지 수신일';
COMMENT ON COLUMN message.msn_date is '쪽지 전송일';



1) 입력
 -- 1번 회원이 2번 회원에게 쪽지 전송
INSERT INTO message( msn_no, memberno_send, 
memberno_rev, msn_title, msn_content, msn_file, msn_size, msn_confirm, msn_date, msn_rev_date)
VALUES((SELECT NVL(MAX(msn_no), 0) + 1 as msn_no FROM message), 1, 2, '스터디 문의드려요~', '안녕하세요.', '', 0, 'Y', sysdate, sysdate);

-- 2번 회원이 1번 회원에게 전송
INSERT INTO message( msn_no, memberno_send, 
memberno_rev, msn_title, msn_content, msn_file, msn_size, msn_confirm, msn_date, msn_rev_date)
VALUES((SELECT NVL(MAX(msn_no), 0) + 1 as msn_no FROM message), 2, 1, '[답변]스터디 문의드려요~', '안녕하세요.', '', 0, 'Y', sysdate, sysdate);

2) 조회
 -- 내가 보낸 쪽지 조회
SELECT *
FROM message
WHERE memberno_send='내 아이디';

2-1) 내가 받은 쪽지 조회
SELECT *
FROM message
WHERE memberno_rev='내 아이디';

-- (전체)상대가 읽지않은 쪽지 조회.
SELECT *
FROM message
WHERE memberno_send='내 아이디번호' AND confirm='N';

-- (전체)상대가 읽은 쪽지 목록 조회
SELECT *
FROM message
WHERE memberno_send='내 아이디번호' AND confirm='Y'

-- 특정 상대가 읽지 않은 쪽지 조회
SELECT *
FROM message
WHERE memberno_send='내 아이디번호' AND memberno_rev='상대 아이디번호' AND confirm='N'

3) 상대가 메세지를 읽었을 때. confirm -> 'Y', msn_rev_date -> '읽은 시간'
UPDATE message
SET confirm='Y', msn_rev_date='읽은시간'
WHERE msn_no='1'

3) 삭제
DELETE
FROM message
WHERE msn_no=1;


/**********************************/
/* Table Name: 쪽지 송신 내역 테이블 */
/**********************************/
CREATE TABLE msgsend(
    msend_no                          NUMBER(10)     NOT NULL    PRIMARY KEY,
    memberno_send                     NUMBER(10)     NOT NULL,
    msg_no                            NUMBER(10)     NULL ,
  FOREIGN KEY (memberno_send) REFERENCES member (memberno),
  FOREIGN KEY (msg_no) REFERENCES message (msg_no)
);

COMMENT ON TABLE msgsend is '쪽지 송신 내역 테이블';
COMMENT ON COLUMN msgsend.msend_no is '송신번호';
COMMENT ON COLUMN msgsend.memberno_send is '송신자 번호';
COMMENT ON COLUMN msgsend.msg_no is '쪽지 번호';


/**********************************/
/* Table Name: 쪽지 수신 내역 테이블 */
/**********************************/
CREATE TABLE msgrecv(
    mrecv_no                          NUMBER(10)     NOT NULL    PRIMARY KEY,
    memberno_recv                     NUMBER(10)     NOT NULL,
    msg_no                            NUMBER(10)     NULL ,
  FOREIGN KEY (memberno_recv) REFERENCES member (memberno),
  FOREIGN KEY (msg_no) REFERENCES message (msg_no)
);

COMMENT ON TABLE msgrecv is '쪽지 수신 내역 테이블';
COMMENT ON COLUMN msgrecv.mrecv_no is '수신번호';
COMMENT ON COLUMN msgrecv.memberno_recv is '수신자 번호';
COMMENT ON COLUMN msgrecv.msg_no is '쪽지 번호';


/**********************************/
/* Table Name: 쪽지보관함 */
/**********************************/ 
CREATE TABLE msg_repo(
    msg_repono                        NUMBER(10)     NOT NULL    PRIMARY KEY,
    memberno                          NUMBER(10)     NOT NULL,
    msg_no                            NUMBER(10)     NULL ,
  FOREIGN KEY (msg_no) REFERENCES message (msg_no),
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE msg_repo is '쪽지보관함';
COMMENT ON COLUMN msg_repo.msg_repono is '쪽지보관번호';
COMMENT ON COLUMN msg_repo.memberno is '회원번호';
COMMENT ON COLUMN msg_repo.msg_no is '쪽지 번호';


/* [시나리오]
 * 받은 쪽지 or 보낸 쪽지를 보관함에 저장하는 기능
 * 
 * 1. [보관하기 버튼 클릭] -> read상태에서는 msg_no, memberno(현재 회원 번호)-세션을 모두 사용가능.
 * 2. AJAX 호출시 msg_no를 넘긴다.
 * 3. Controller에서 msg_no와 세션에 있는 memberno(현재 회원 번호)를 바탕으로 DB에 해당 번호들 저장
 * 
 * 
 */




