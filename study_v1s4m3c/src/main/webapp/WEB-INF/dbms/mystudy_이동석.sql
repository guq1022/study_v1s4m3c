/**************************************************************************************************************
 * Table Name: �����͵�-ī�װ� ����Ʈ ���̺�
 * �ʿ����� : studylist, category, member
 * 
 * cateno : 2 => �� ���͵� ��������
 * cateno : 3 => �� ���͵� �����Խ���
 * cateno : 4 => �� ���͵� �ڷ��
 * 
 * ���� �ñ� : studylist ���̺� �ű� ���͵� ��ϵǸ� �ش� ���͵��� stdlist_no�� ���� �������� insert.
 * 
 * ex) �ű� ���͵� ����. stdlist_no : 1�� ��.
 *     
 *     
 *
 ***************************************************************************************************************/

-- ȸ�� ���� ������ 1 (by ����ȫ)
INSERT INTO member(memberno, memid, mememail, mempasswd, memname, memsignkey, memconfirm, memauth, membirth, memgender, memaddress, memphone, 
memsns, memintro, memphoto, memphoto_t, memsize, mbirthvb, mgendervb, maddressvb, mphonevb, msnsvb, mintrovb, mphotovb, memdate)
VALUES((SELECT NVL(MAX(memberno), 0)+1 as memberno FROM member), 'test1', 'test1@gmail.com', '1234', 'ȸ��1', 'ascsdawe12382347',
'Y', 'B', '19891025', '��', '���� ���ϱ� ������', '01012345678', '�ν�Ÿ�׷�', '�ȳ��ϼ���', 'myphoto.jpg', 'myphoto_t.jpg', 0, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', sysdate);


INSERT INTO member(memberno, memid, mememail, mempasswd, memname, memsignkey, memconfirm, memauth, membirth, memgender, memaddress, memphone, 
memsns, memintro, memphoto, memphoto_t, memsize, mbirthvb, mgendervb, maddressvb, mphonevb, msnsvb, mintrovb, mphotovb, memdate)
VALUES((SELECT NVL(MAX(memberno), 0)+1 as memberno FROM member), 'test2', 'test2@gmail.com', '1234', 'ȸ��2', 'ascsdawe12382347',
'Y', 'B', '19891025', '��', '���� ���ϱ� ������', '01012345678', '�ν�Ÿ�׷�', '�ȳ��ϼ���', 'myphoto.jpg', 'myphoto_t.jpg', 0, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', sysdate);


INSERT INTO member(memberno, memid, mememail, mempasswd, memname, memsignkey, memconfirm, memauth, membirth, memgender, memaddress, memphone, 
memsns, memintro, memphoto, memphoto_t, memsize, mbirthvb, mgendervb, maddressvb, mphonevb, msnsvb, mintrovb, mphotovb, memdate)
VALUES((SELECT NVL(MAX(memberno), 0)+1 as memberno FROM member), 'test3', 'test3@gmail.com', '1234', 'ȸ��3', 'ascsdawe12382347',
'Y', 'B', '19891025', '��', '���� ���ϱ� ������', '01012345678', '�ν�Ÿ�׷�', '�ȳ��ϼ���', 'myphoto.jpg', 'myphoto_t.jpg', 0, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', sysdate);


-- ���͵� ���� ������ 1
INSERT INTO "STUDY"."STUDYLIST" (STDLIST_NO, STDLIST_TITLE, STDLIST_EMAIL, STDLIST_TOPIC, STDLIST_TIME,
STDLIST_AREA, STDLIST_DOW, STDLIST_TOT_NUM, STDLIST_CURR_NUM, STDLIST_CONTENT, STDLIST_CNT,
STDLIST_RECOM_CNT, STDLIST_DATE, MEMBERNO, CATENO) 
VALUES ('3', '�����غ��', 'lee3339@naver.com', '����', '6��',
'���� ���α�', '������', '4', '1', '��� ���� �ؿ�!', '0',
'0', TO_DATE('2017-11-21 12:07:45', 'YYYY-MM-DD HH24:MI:SS'), '1', '10')

-- category ���̺��� insert ( ����:������ sql ���� ) 
INSERT INTO "STUDY"."CATEGORY" (CATENO, CATENAME, CATESEQNO, CATEVISIBLE) VALUES ('1', '�����͵�', '1', 'Y');
INSERT INTO "STUDY"."CATEGORY" (CATENO, CATENAME, CATESEQNO, CATEVISIBLE) VALUES ('2', '�����͵�-��������', '2', 'Y');
INSERT INTO "STUDY"."CATEGORY" (CATENO, CATENAME, CATESEQNO, CATEVISIBLE) VALUES ('3', '�����͵�-�����Խ���', '3', 'Y');
INSERT INTO "STUDY"."CATEGORY" (CATENO, CATENAME, CATESEQNO, CATEVISIBLE) VALUES ('4', '�����͵�-�ڷ��', '4', 'Y');
INSERT INTO "STUDY"."CATEGORY" (CATENO, CATENAME, CATESEQNO, CATEVISIBLE) VALUES ('5', '�����͵�-���͵� ����', '5', 'Y');

insert into "STUDY"."CATEGORY" (CATENO, CATENAME, CATESEQNO, CATEVISIBLE) values(10, '���͵�׷츮��Ʈ', 1, 'Y');


CREATE TABLE my_std_catelist(
    mylistno                          NUMBER(10)     NOT NULL    PRIMARY KEY,
    stdlist_no                        NUMBER(10)     NULL ,
    cateno                            NUMBER(10)     NULL ,
  FOREIGN KEY (stdlist_no) REFERENCES studylist (stdlist_no),
  FOREIGN KEY (cateno) REFERENCES category (cateno)
);

COMMENT ON TABLE my_std_catelist is '�����͵�-ī�װ� ����Ʈ ���̺�';
COMMENT ON COLUMN my_std_catelist.mylistno is '�����͵𸮽�Ʈ ���� ��ȣ';
COMMENT ON COLUMN my_std_catelist.stdlist_no is '���͵��ȣ';
COMMENT ON COLUMN my_std_catelist.cateno is 'ī�װ���ȣ';



-- 1�� ȸ���� 1�� ���͵� ������ ��Ȳ.

1) �Է�
-- ȸ���� ���͵� �����ϸ� �ڵ����� �Ʒ��� insert���� ����Ǿ�� ��.

-- 1�� ���͵��� �������� ��ȣ
INSERT INTO "STUDY"."MY_STD_CATELIST" (MYLISTNO, STDLIST_NO, CATENO)
VALUES ((SELECT NVL(MAX(MYLISTNO), 0) + 1 as MYLISTNO FROM "STUDY"."MY_STD_CATELIST"), '1', '2');

-- 1�� ���͵��� �����Խ��� ��ȣ
INSERT INTO "STUDY"."MY_STD_CATELIST" (MYLISTNO, STDLIST_NO, CATENO)
VALUES ((SELECT NVL(MAX(MYLISTNO), 0) + 1 as MYLISTNO FROM "STUDY"."MY_STD_CATELIST"), '1', '3');

-- 1�� ���͵��� �ڷ�� ��ȣ
INSERT INTO "STUDY"."MY_STD_CATELIST" (MYLISTNO, STDLIST_NO, CATENO)
VALUES ((SELECT NVL(MAX(MYLISTNO), 0) + 1 as MYLISTNO FROM "STUDY"."MY_STD_CATELIST"), '1', '4');

-- 1�� ���͵��� ���͵� ���� ��ȣ
INSERT INTO "STUDY"."MY_STD_CATELIST" (MYLISTNO, STDLIST_NO, CATENO)
VALUES ((SELECT NVL(MAX(MYLISTNO), 0) + 1 as MYLISTNO FROM "STUDY"."MY_STD_CATELIST"), '1', '5');


2) ����
UPDATE "STUDY"."MY_STD_CATELIST"
SET CATENO=5
WHERE STDLIST_NO=1 AND CATENO=4;

3) ���� - ���͵� ���� �� (ī�װ� ���� ���� �� ���͵� ����Ʈ ���� ����.)
-- 1�� ���͵��� ���� ī�װ� ����
DELETE FROM "STUDY"."MY_STD_CATELIST"
WHERE STDLIST_NO=1;




/**********************************/
/* Table Name: �� ���͵� �� ���
 * 
 * ���� ���̺� : my_std_catelist, member
 * FK : mylistno(�����͵�-ī�װ� ����Ʈ ���̺�), memberno(ȸ����ȣ=�� �����)
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

COMMENT ON TABLE my_pds is '�� ���͵� �� ���';
COMMENT ON COLUMN my_pds.pdsno is '�� ��ȣ';
COMMENT ON COLUMN my_pds.pdstitle is '�� ����';
COMMENT ON COLUMN my_pds.pdspasswd is '�� ��й�ȣ';
COMMENT ON COLUMN my_pds.pdscontent is '�� ����';
COMMENT ON COLUMN my_pds.pdsfile1 is '�� ÷�����ϸ�';
COMMENT ON COLUMN my_pds.pdsfilesize is '�� ���� ������';
COMMENT ON COLUMN my_pds.pdsthumb is '�� ���� thumb';
COMMENT ON COLUMN my_pds.pdsword is '�� �˻���';
COMMENT ON COLUMN my_pds.pdslike is '�� ��õ��';
COMMENT ON COLUMN my_pds.pdscnt is '�� ��ȸ��';
COMMENT ON COLUMN my_pds.pdsdate is '�� �ۼ���';
COMMENT ON COLUMN my_pds.memberno is 'ȸ����ȣ';
COMMENT ON COLUMN my_pds.mylistno is '�����͵𸮽�Ʈ ���� ��ȣ';



1) �Է�
INSERT INTO my_pds(pdsno, pdstitle, pdspasswd, pdscontent, pdsfile1, pdsfilesize, pdsthumb, pdsword, pdslike, pdscnt, pdsdate, memberno, mylistno)
VALUES( (SELECT NVL(MAX(pdsno), 0) + 1 as pdsno FROM my_pds),  '�������� 1�� ��', '1234', '�������� �Դϴ�.', '', 0, '', '��������', 0, 0, sysdate, 1, 1);

INSERT INTO my_pds(pdsno, pdstitle, pdspasswd, pdscontent, pdsfile1, pdsfilesize, pdsthumb, pdsword, pdslike, pdscnt, pdsdate, memberno, mylistno)
VALUES( (SELECT NVL(MAX(pdsno), 0) + 1 as pdsno FROM my_pds),  '�����Խ��� 1�� ��', '1234', '�����Խ��� �Դϴ�.', '', 0, '', '�����Խ��� 1���� ���� �Դϴ�', 0, 0, sysdate, 1, 2);

INSERT INTO my_pds(pdsno, pdstitle, pdspasswd, pdscontent, pdsfile1, pdsfilesize, pdsthumb, pdsword, pdslike, pdscnt, pdsdate, memberno, mylistno)
VALUES( (SELECT NVL(MAX(pdsno), 0) + 1 as pdsno FROM my_pds),  '�ڷ�� 1�� ��', '1234', '�ڷ�� �Դϴ�.', '', 0, '', '�ڷ��', 0, 0, sysdate, 1, 3);

INSERT INTO my_pds(pdsno, pdstitle, pdspasswd, pdscontent, pdsfile1, pdsfilesize, pdsthumb, pdsword, pdslike, pdscnt, pdsdate, memberno, mylistno)
VALUES( (SELECT NVL(MAX(pdsno), 0) + 1 as pdsno FROM my_pds),  '�������� 2�� ��', '1234', '��������2 �Դϴ�.', '', 0, '', '��������', 0, 0, sysdate, 1, 1);

INSERT INTO my_pds(pdsno, pdstitle, pdspasswd, pdscontent, pdsfile1, pdsfilesize, pdsthumb, pdsword, pdslike, pdscnt, pdsdate, memberno, mylistno)
VALUES( (SELECT NVL(MAX(pdsno), 0) + 1 as pdsno FROM my_pds),  '�����Խ��� 2�� ��', '1234', '�����Խ���2 �Դϴ�.', '', 0, '', '�����Խ���', 0, 0, sysdate, 1, 2);

INSERT INTO my_pds(pdsno, pdstitle, pdspasswd, pdscontent, pdsfile1, pdsfilesize, pdsthumb, pdsword, pdslike, pdscnt, pdsdate, memberno, mylistno)
VALUES( (SELECT NVL(MAX(pdsno), 0) + 1 as pdsno FROM my_pds),  '�ڷ�� 2�� ��', '1234', '�ڷ��2 �Դϴ�.', '', 0, '', '�ڷ��', 0, 0, sysdate, 1, 3);

2) ��ȸ

-- 1�� ���͵��� �������� �� ��ȸ.
-- mylistno = stdlist_no + cateno

select *
from my_pds
where mylistno IN (
  select mylistno
  from my_std_catelist
  where stdlist_no= 1 AND cateno=2
)

-- 1�� ���͵��� �����Խ��� �� ��ȸ.
select *
from my_pds
where mylistno IN (
  select mylistno
  from my_std_catelist
  where stdlist_no= 1 AND cateno=3
)

-- 1�� ���͵��� �ڷ�� �� ��ȸ.
select *
from my_pds
where mylistno IN (
  select mylistno
  from my_std_catelist
  where stdlist_no= 1 AND cateno=4
)

-- 1�� ���͵� ���� �� ��ü ��ȸ.
select *
from my_pds
where mylistno IN (
  select mylistno
  from my_std_catelist
  where stdlist_no= 1
)


3) ����
UPDATE my_pds
SET pdstitle = '�������� 1�� �� (1�� ����)',
    pdscontent = '1�� ����',
    pdsfile1='',
    pdsfilesize=0,
    pdsthumb='',
    pdsword='����'
WHERE pdsno = 1;


4) ����
DELETE
FROM my_pds
WHERE pdsno=1;


5) �� ��ȸ�� ����
UPDATE my_pds
SET pdscnt=pdscnt+1
WHERE pdsno=2;


6) �� ���ƿ� ����
UPDATE my_pds
SET pdslike=pdslike+1
WHERE pdsno=2;

8) �˻�

SELECT pdsno, pdstitle, pdspasswd, pdscontent, pdsfile1, pdsfilesize, pdsthumb,
pdsword, pdslike, pdscnt, pdsdate, memberno, mylistno
FROM my_pds
WHERE mylistno=1 AND pdsword LIKE 'test';

/*==========================================================================================*/
9) ����¡ �⺻ ����

DROP TABLE PG;
 
CREATE TABLE PG(
  num NUMBER(5) NOT NULL,
  title  VARCHAR(20) NOT NULL,
  PRIMARY KEY(num)
);
 
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '01��');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '02��');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '03��');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '04��');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '05��');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '06��');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '07��');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '08��');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '09��');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '10��');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '11��');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '12��');


SELECT num, title, rownum
FROM pg;

-- 2,3�� ����
DELETE FROM pg WHERE num=2 or num=3;

-- ����¡�ô� ������ �������� �����Ǵ� rownum ���� ����մϴ�.
-- rownum����: rownum�� ����(ORDER BY ~)���� ���� ����������
-- ������ �� �� rownum �÷��� ����մϴ�. 













/*==========================================================================================*/


/**********************************/
/* Table Name: �����͵� ��� */
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

COMMENT ON TABLE my_reply is '�����͵� ���';
COMMENT ON COLUMN my_reply.mycom_no is '�����͵��۹�ȣ';
COMMENT ON COLUMN my_reply.mycom_title is '��� ����';
COMMENT ON COLUMN my_reply.mycom_content is '��� ����';
COMMENT ON COLUMN my_reply.mycom_passwd is '��� ��й�ȣ';
COMMENT ON COLUMN my_reply.mycom_file1 is '��� ÷�� ���ϸ�';
COMMENT ON COLUMN my_reply.mycom_size is '��� ÷�� ���� ������';
COMMENT ON COLUMN my_reply.mycom_thumb is '��� �� �̹�����';
COMMENT ON COLUMN my_reply.mycom_good is '��� ���ƿ�';
COMMENT ON COLUMN my_reply.mycom_level is '��� ����';
COMMENT ON COLUMN my_reply.mycom_rank is '��� ����';
COMMENT ON COLUMN my_reply.mycom_cnt is '��� ��ȸ��';
COMMENT ON COLUMN my_reply.mycom_date is '��� ������';
COMMENT ON COLUMN my_reply.memberno is 'ȸ����ȣ';
COMMENT ON COLUMN my_reply.pdsno is '�� ��ȣ';




1) �Է�
-- pdsno : pdsno�� ����� ������ ������ �� ��� ����.
-- mycom_level : ����� ������ �ǹ��Ѵ�. 1�� ���� �ֻ��� ����̴�.
INSERT INTO my_reply(mycom_no, mycom_title, mycom_content, mycom_passwd, mycom_file1, mycom_size, mycom_thumb, mycom_good, mycom_level, mycom_rank, mycom_cnt, mycom_date, memberno, pdsno)
VALUES( (SELECT NVL(MAX(mycom_no), 0) + 1 as mycom_no FROM my_reply), '1�� ���͵� 1�� �������� ���', '1�� ��� �Դϴ�.', '1234', '', 0, '', 0, 1, 3, 0, sysdate, 1, 7);

INSERT INTO my_reply(mycom_no, mycom_title, mycom_content, mycom_passwd, mycom_file1, mycom_size, mycom_thumb, mycom_good, mycom_level, mycom_rank, mycom_cnt, mycom_date, memberno, pdsno)
VALUES( (SELECT NVL(MAX(mycom_no), 0) + 1 as mycom_no FROM my_reply), '1�� ���͵� 1�� �������� ���', '2�� ��� �Դϴ�.', '1234', '', 0, '', 0, 1, 2, 0, sysdate, 1, 7);

INSERT INTO my_reply(mycom_no, mycom_title, mycom_content, mycom_passwd, mycom_file1, mycom_size, mycom_thumb, mycom_good, mycom_level, mycom_rank, mycom_cnt, mycom_date, memberno, pdsno)
VALUES( (SELECT NVL(MAX(mycom_no), 0) + 1 as mycom_no FROM my_reply), '1�� ���͵� 1�� �������� ���', '3�� ��� �Դϴ�.', '1234', '', 0, '', 0, 1, 1, 0, sysdate, 1, 7);

INSERT INTO my_reply(mycom_no, mycom_title, mycom_content, mycom_passwd, mycom_file1, mycom_size, mycom_thumb, mycom_good, mycom_level, mycom_rank, mycom_cnt, mycom_date, memberno, pdsno)
VALUES( (SELECT NVL(MAX(mycom_no), 0) + 1 as mycom_no FROM my_reply), '1�� ���͵� 1�� �������� ��� - ���', '1�� ��� - ��� �Դϴ�.', '1234', '', 0, '', 0, 2, 1, 0, sysdate, 1, 7);


INSERT INTO my_reply(mycom_no, mycom_title, mycom_content, mycom_passwd, mycom_file1, mycom_size, mycom_thumb, mycom_good, mycom_level, mycom_rank, mycom_cnt, mycom_date, memberno, pdsno)
VALUES( (SELECT NVL(MAX(mycom_no), 0) + 1 as mycom_no FROM my_reply), '1�� ���͵� 1�� �������� ��� - ���', '2�� ��� - ��� �Դϴ�.', '1234', '', 0, '', 0, 2, 1, 0, sysdate, 1, 7);


-- 1�� ���͵� �������� 2�� �ۿ� ���� ��� 1, 2, 3

INSERT INTO my_reply(mycom_no, mycom_title, mycom_content, mycom_passwd, mycom_file1, mycom_size, mycom_thumb, mycom_good, mycom_level, mycom_rank, mycom_cnt, mycom_date, memberno, pdsno)
VALUES( (SELECT NVL(MAX(mycom_no), 0) + 1 as mycom_no FROM my_reply), '1�� ���͵� 2�� �������� ���', '1�� ���', '1234', '', 0, '', 0, 1, 3, 0, sysdate, 1, 4);


INSERT INTO my_reply(mycom_no, mycom_title, mycom_content, mycom_passwd, mycom_file1, mycom_size, mycom_thumb, mycom_good, mycom_level, mycom_rank, mycom_cnt, mycom_date, memberno, pdsno)
VALUES( (SELECT NVL(MAX(mycom_no), 0) + 1 as mycom_no FROM my_reply), '1�� ���͵� 2�� �������� ���', '2�� ���', '1234', '', 0, '', 0, 1, 2, 0, sysdate, 1, 4);


INSERT INTO my_reply(mycom_no, mycom_title, mycom_content, mycom_passwd, mycom_file1, mycom_size, mycom_thumb, mycom_good, mycom_level, mycom_rank, mycom_cnt, mycom_date, memberno, pdsno)
VALUES( (SELECT NVL(MAX(mycom_no), 0) + 1 as mycom_no FROM my_reply), '1�� ���͵� 2�� �������� ���', '3�� ���', '1234', '', 0, '', 0, 1, 1, 0, sysdate, 1, 4);


2) ��ȸ(pdsno, mycom_no)
-- my_reply�� ����� �ۼ��ڰ� memberno�� ����Ǿ� ������ ���������� ���� �󸶵��� ����� �����ϴ�.
-- ��, ���������� ����Ҷ� ���������� ���� ���ϵǴ� �÷��� �ܼ������� ���������� �� ������ �ϰ� �����ؾ� �Ѵ�.
-- SELECT ���� ���������� ����Ͽ� memberno�� ������ ȸ���� �̸��� ����ϰ� �Ѵ�.

-- SELECT ������ ���������� ������ �ܼ������� �Ѵ�. ������ ���ڼ��� �԰�.
SELECT mycom_title, mycom_content, mycom_file1, mycom_size, mycom_thumb, mycom_good, mycom_cnt, mycom_date,
       (select memname
        from member
        where memberno=1
       ) as �۾���
FROM my_reply
WHERE mycom_no=1;


select *
FROM my_reply
WHERE pdsno=7
ORDER BY mycom_rank ASC;

3) ����
UPDATE my_reply
SET mycom_title ='1�� ���͵� 1�� �������� ���(1������)',
		mycom_content ='1�� ��� �Դϴ�.(1������)',
		mycom_file1 = 'test.jpg',
		mycom_size = 123,
		mycom_thumb = 'test_t.jpg'
		
WHERE mycom_no=1;

4) ����
DELETE
FROM my_reply
WHERE mycom_no=2;


5) ��� ��õ ����
UPDATE my_reply
SET mycom_good=mycom_good+1
WHERE mycom_no=1;


6) ��ȸ ����
UPDATE my_reply
SET mycom_cnt=mycom_cnt+1
WHERE mycom_no=1;


7) ����� ��� ���� ��ȭ.
-- (�ֽ� ����� ���� ��ܿ� ��ġ.)
-- (��, ������ pdsno�� mycom_level�� ���� ���ǿ��� mycom_rank�� �������� ����)

-- my_pds�� ������ ����� �ۼ� �� ��.
UPDATE my_reply
SET mycom_rank=mycom_rank+1
WHERE pdsno=�θ�� ��ȣ AND mycom_rank > 0;

-- �ۼ��� ��ۿ� ����� �ۼ��� ��.
UPDATE my_reply
SET mycom_rank=mycom_rank+1
WHERE pdsno=�θ�� ��ȣ AND mycom_rank > (���� ����� �ް����ϴ� �θ� ����� rank).

/*
 * ���� ���̺�� ��� ���̺��� �и��ϹǷν� ���� ���̺�(my_pds)���� ����� �켱������ ������ ��Ÿ���� �÷��� ����.
 * �׷��Ƿ� ������ ����� �ٴ� ��� my_reply���� ������ pdsno�� ������ �ִ� Ʃ�õ��� mycom_rank�� ��� +1 �Ѵ�.
 * ��, WHERE mycom_rank > 0 �� �������� �־� ���� �ֿ켱 �ڸ��� '0'�� �ڸ��� �����Ѵ�.
 * 
 * ������, ���(�θ� ���)�� ����� �ۼ��ϴ� ���(�� ���)
 * 
 * �θ� ����� �켱������ ���� �÷��� ������ �ֱ⿡ {�θ� ���}�� ���� ������ �ִ� mycom_rank�� ��������
 * ������ [WHERE mycom_rank > �θ����� mycom_rank]�� �Ͽ� �� ������ ������ �����Ѵ�.
 * 
 * 
 * �ǽ����� ������ �˰���� ��Ʈ�ѷ��� ���������, ������� ������ �ð��� �ʿ��� ��.
 * 
 */


/**********************************/
/* Table Name: ���� ���̺� */
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

COMMENT ON TABLE message is '���� ���̺�';
COMMENT ON COLUMN message.msn_no is '���� ��ȣ';
COMMENT ON COLUMN message.memberno_send is '������(ȸ����ȣ)';
COMMENT ON COLUMN message.memberno_rev is '�޴���(ȸ����ȣ)';
COMMENT ON COLUMN message.msn_title is '���� ����';
COMMENT ON COLUMN message.msn_content is '���� ����';
COMMENT ON COLUMN message.msn_send_del is '�߽��� ��������';
COMMENT ON COLUMN message.msn_recv_del is '������ ��������';
COMMENT ON COLUMN message.msn_confirm is '���� ���� ����';
COMMENT ON COLUMN message.msn_rev_date is '���� ������';
COMMENT ON COLUMN message.msn_date is '���� ������';



1) �Է�
 -- 1�� ȸ���� 2�� ȸ������ ���� ����
INSERT INTO message( msn_no, memberno_send, 
memberno_rev, msn_title, msn_content, msn_file, msn_size, msn_confirm, msn_date, msn_rev_date)
VALUES((SELECT NVL(MAX(msn_no), 0) + 1 as msn_no FROM message), 1, 2, '���͵� ���ǵ����~', '�ȳ��ϼ���.', '', 0, 'Y', sysdate, sysdate);

-- 2�� ȸ���� 1�� ȸ������ ����
INSERT INTO message( msn_no, memberno_send, 
memberno_rev, msn_title, msn_content, msn_file, msn_size, msn_confirm, msn_date, msn_rev_date)
VALUES((SELECT NVL(MAX(msn_no), 0) + 1 as msn_no FROM message), 2, 1, '[�亯]���͵� ���ǵ����~', '�ȳ��ϼ���.', '', 0, 'Y', sysdate, sysdate);

2) ��ȸ
 -- ���� ���� ���� ��ȸ
SELECT *
FROM message
WHERE memberno_send='�� ���̵�';

2-1) ���� ���� ���� ��ȸ
SELECT *
FROM message
WHERE memberno_rev='�� ���̵�';

-- (��ü)��밡 �������� ���� ��ȸ.
SELECT *
FROM message
WHERE memberno_send='�� ���̵��ȣ' AND confirm='N';

-- (��ü)��밡 ���� ���� ��� ��ȸ
SELECT *
FROM message
WHERE memberno_send='�� ���̵��ȣ' AND confirm='Y'

-- Ư�� ��밡 ���� ���� ���� ��ȸ
SELECT *
FROM message
WHERE memberno_send='�� ���̵��ȣ' AND memberno_rev='��� ���̵��ȣ' AND confirm='N'

3) ��밡 �޼����� �о��� ��. confirm -> 'Y', msn_rev_date -> '���� �ð�'
UPDATE message
SET confirm='Y', msn_rev_date='�����ð�'
WHERE msn_no='1'

3) ����
DELETE
FROM message
WHERE msn_no=1;


/**********************************/
/* Table Name: ���� �۽� ���� ���̺� */
/**********************************/
CREATE TABLE msgsend(
    msend_no                          NUMBER(10)     NOT NULL    PRIMARY KEY,
    memberno_send                     NUMBER(10)     NOT NULL,
    msg_no                            NUMBER(10)     NULL ,
  FOREIGN KEY (memberno_send) REFERENCES member (memberno),
  FOREIGN KEY (msg_no) REFERENCES message (msg_no)
);

COMMENT ON TABLE msgsend is '���� �۽� ���� ���̺�';
COMMENT ON COLUMN msgsend.msend_no is '�۽Ź�ȣ';
COMMENT ON COLUMN msgsend.memberno_send is '�۽��� ��ȣ';
COMMENT ON COLUMN msgsend.msg_no is '���� ��ȣ';


/**********************************/
/* Table Name: ���� ���� ���� ���̺� */
/**********************************/
CREATE TABLE msgrecv(
    mrecv_no                          NUMBER(10)     NOT NULL    PRIMARY KEY,
    memberno_recv                     NUMBER(10)     NOT NULL,
    msg_no                            NUMBER(10)     NULL ,
  FOREIGN KEY (memberno_recv) REFERENCES member (memberno),
  FOREIGN KEY (msg_no) REFERENCES message (msg_no)
);

COMMENT ON TABLE msgrecv is '���� ���� ���� ���̺�';
COMMENT ON COLUMN msgrecv.mrecv_no is '���Ź�ȣ';
COMMENT ON COLUMN msgrecv.memberno_recv is '������ ��ȣ';
COMMENT ON COLUMN msgrecv.msg_no is '���� ��ȣ';


/**********************************/
/* Table Name: ���������� */
/**********************************/ 
CREATE TABLE msg_repo(
    msg_repono                        NUMBER(10)     NOT NULL    PRIMARY KEY,
    memberno                          NUMBER(10)     NOT NULL,
    msg_no                            NUMBER(10)     NULL ,
  FOREIGN KEY (msg_no) REFERENCES message (msg_no),
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE msg_repo is '����������';
COMMENT ON COLUMN msg_repo.msg_repono is '����������ȣ';
COMMENT ON COLUMN msg_repo.memberno is 'ȸ����ȣ';
COMMENT ON COLUMN msg_repo.msg_no is '���� ��ȣ';


/* [�ó�����]
 * ���� ���� or ���� ������ �����Կ� �����ϴ� ���
 * 
 * 1. [�����ϱ� ��ư Ŭ��] -> read���¿����� msg_no, memberno(���� ȸ�� ��ȣ)-������ ��� ��밡��.
 * 2. AJAX ȣ��� msg_no�� �ѱ��.
 * 3. Controller���� msg_no�� ���ǿ� �ִ� memberno(���� ȸ�� ��ȣ)�� �������� DB�� �ش� ��ȣ�� ����
 * 
 * 
 */




