DROP TABLE message CASCADE CONSTRAINTS;
DROP TABLE my_reply CASCADE CONSTRAINTS;
DROP TABLE my_pds CASCADE CONSTRAINTS;
DROP TABLE qna CASCADE CONSTRAINTS;
DROP TABLE contest CASCADE CONSTRAINTS;
DROP TABLE job CASCADE CONSTRAINTS;
DROP TABLE event CASCADE CONSTRAINTS;
DROP TABLE roomreview CASCADE CONSTRAINTS;
DROP TABLE studyroom CASCADE CONSTRAINTS;
DROP TABLE std_reply CASCADE CONSTRAINTS;
DROP TABLE reply CASCADE CONSTRAINTS;
DROP TABLE free CASCADE CONSTRAINTS;
DROP TABLE sale CASCADE CONSTRAINTS;
DROP TABLE shared CASCADE CONSTRAINTS;
DROP TABLE my_std_catelist CASCADE CONSTRAINTS;
DROP TABLE recruit CASCADE CONSTRAINTS;
DROP TABLE studylist CASCADE CONSTRAINTS;
DROP TABLE admnotice CASCADE CONSTRAINTS;
DROP TABLE category CASCADE CONSTRAINTS;
DROP TABLE admin CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: ȸ������ */
/**********************************/
CREATE TABLE member(
		memberno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		mememail                      		VARCHAR2(100)		 NOT NULL,
		mempasswd                     		VARCHAR2(20)		 NOT NULL,
		memname                       		VARCHAR2(20)		 NOT NULL,
		memsignkey                    		VARCHAR2(100)		 NOT NULL,
		memconfirm                    		VARCHAR2(1)		 DEFAULT 'N'		 NOT NULL,
		memauth                       		VARCHAR2(1)		 DEFAULT 'B'		 NOT NULL,
		membirth                      		VARCHAR2(50)		 NOT NULL,
		memgender                     		VARCHAR2(5)		 NOT NULL,
		memaddress                    		VARCHAR2(100)		 NOT NULL,
		memphone                      		VARCHAR2(50)		 NOT NULL,
		memsns                        		VARCHAR2(100)		 NULL ,
		memintro                      		VARCHAR2(1000)		 NULL ,
		memphoto                      		VARCHAR2(500)		 NULL ,
		memphoto_t                    		VARCHAR2(500)		 NULL ,
		memsize                       		NUMBER(30)		 DEFAULT 0		 NOT NULL,
		mbirthvb                      		VARCHAR2(1)		 DEFAULT 'Y'		 NOT NULL,
		mgendervb                     		VARCHAR2(1)		 DEFAULT 'Y'		 NOT NULL,
		maddressvb                    		VARCHAR2(1)		 DEFAULT 'Y'		 NOT NULL,
		mphonevb                      		VARCHAR2(1)		 DEFAULT 'Y'		 NOT NULL,
		msnsvb                        		VARCHAR2(1)		 DEFAULT 'Y'		 NOT NULL,
		mintrovb                      		VARCHAR2(1)		 DEFAULT 'Y'		 NOT NULL,
		mphotovb                      		VARCHAR2(1)		 DEFAULT 'Y'		 NOT NULL,
		memdate                       		DATE		 NOT NULL
);

COMMENT ON TABLE member is 'ȸ������';
COMMENT ON COLUMN member.memberno is 'ȸ����ȣ';
COMMENT ON COLUMN member.mememail is 'ȸ���̸���';
COMMENT ON COLUMN member.mempasswd is 'ȸ����й�ȣ';
COMMENT ON COLUMN member.memname is 'ȸ���̸�';
COMMENT ON COLUMN member.memsignkey is 'ȸ������Ű';
COMMENT ON COLUMN member.memconfirm is 'ȸ������Ȯ��';
COMMENT ON COLUMN member.memauth is 'ȸ������';
COMMENT ON COLUMN member.membirth is 'ȸ���������';
COMMENT ON COLUMN member.memgender is 'ȸ������';
COMMENT ON COLUMN member.memaddress is 'ȸ���ּ�';
COMMENT ON COLUMN member.memphone is 'ȸ����ȭ��ȣ';
COMMENT ON COLUMN member.memsns is 'ȸ��SNS';
COMMENT ON COLUMN member.memintro is 'ȸ���Ұ�';
COMMENT ON COLUMN member.memphoto is 'ȸ����������';
COMMENT ON COLUMN member.memphoto_t is 'ȸ�����������';
COMMENT ON COLUMN member.memsize is 'ȸ����������ũ��';
COMMENT ON COLUMN member.mbirthvb is 'ȸ�����������¿���';
COMMENT ON COLUMN member.mgendervb is 'ȸ��������¿���';
COMMENT ON COLUMN member.maddressvb is 'ȸ���ּ���¿���';
COMMENT ON COLUMN member.mphonevb is 'ȸ����ȭ��ȣ��¿���';
COMMENT ON COLUMN member.msnsvb is 'ȸ��SNS��¿���';
COMMENT ON COLUMN member.mintrovb is 'ȸ���ڱ�Ұ���¿���';
COMMENT ON COLUMN member.mphotovb is 'ȸ��������¿���';
COMMENT ON COLUMN member.memdate is 'ȸ��������';


/**********************************/
/* Table Name: ������ */
/**********************************/
CREATE TABLE admin(
		adminno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		admemail                      		VARCHAR2(100)		 NOT NULL,
		admpasswd                     		VARCHAR2(20)		 NOT NULL,
		admname                       		VARCHAR2(20)		 NOT NULL,
		admsignkey                    		VARCHAR2(100)		 NOT NULL,
		admconfirm                    		VARCHAR2(1)		 DEFAULT 'N'		 NOT NULL,
		admauth                       		VARCHAR2(1)		 DEFAULT 'N'		 NOT NULL,
		admdate                       		DATE		 NOT NULL
);

COMMENT ON TABLE admin is '������';
COMMENT ON COLUMN admin.adminno is '�����ڹ�ȣ';
COMMENT ON COLUMN admin.admemail is '�������̸���';
COMMENT ON COLUMN admin.admpasswd is '�����ں�й�ȣ';
COMMENT ON COLUMN admin.admname is '�������̸�';
COMMENT ON COLUMN admin.admsignkey is '�����ڰ���Ű';
COMMENT ON COLUMN admin.admconfirm is '����������Ȯ��';
COMMENT ON COLUMN admin.admauth is '�����ڱ���';
COMMENT ON COLUMN admin.admdate is '�����ڰ�����';


/**********************************/
/* Table Name: ī�װ� */
/**********************************/
CREATE TABLE category(
		cateno                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		catename                      		VARCHAR2(50)		 NOT NULL,
		cateseqno                     		NUMBER(5)		 NOT NULL,
		catevisible                   		VARCHAR2(1)		 DEFAULT 'Y'		 NOT NULL
);

COMMENT ON TABLE category is 'ī�װ�';
COMMENT ON COLUMN category.cateno is 'ī�װ���ȣ';
COMMENT ON COLUMN category.catename is 'ī�װ��̸�';
COMMENT ON COLUMN category.cateseqno is 'ī�װ���¼���';
COMMENT ON COLUMN category.catevisible is 'ī�װ���¿���';


/**********************************/
/* Table Name: ������ �������� �Խ��� */
/**********************************/
CREATE TABLE admnotice(
		anoticeno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		anoticetitle                  		VARCHAR2(200)		 NOT NULL,
		anoticecontent                		VARCHAR2(2000)		 NOT NULL,
		anoticeseqno                  		NUMBER(10)		 DEFAULT 1		 NOT NULL,
		anoticecnt                    		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		anoticedate                   		DATE		 NOT NULL,
		adminno                       		NUMBER(10)		 NOT NULL,
		cateno                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (adminno) REFERENCES admin (adminno),
  FOREIGN KEY (cateno) REFERENCES category (cateno)
);

COMMENT ON TABLE admnotice is '������ �������� �Խ���';
COMMENT ON COLUMN admnotice.anoticeno is '�������׹�ȣ';
COMMENT ON COLUMN admnotice.anoticetitle is '������������';
COMMENT ON COLUMN admnotice.anoticecontent is '�������׳���';
COMMENT ON COLUMN admnotice.anoticeseqno is '����������¼���';
COMMENT ON COLUMN admnotice.anoticecnt is '����������ȸ��';
COMMENT ON COLUMN admnotice.anoticedate is '�������׵����';
COMMENT ON COLUMN admnotice.adminno is '�����ڹ�ȣ';
COMMENT ON COLUMN admnotice.cateno is 'ī�װ���ȣ';


/**********************************/
/* Table Name: ���͵��� */
/**********************************/
CREATE TABLE studylist(
		stdlist_no                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		stdlist_title                 		VARCHAR2(100)		 NOT NULL,
		stdlist_email                 		VARCHAR2(50)		 NOT NULL,
		stdlist_topic                 		VARCHAR2(50)		 NOT NULL,
		stdlist_time                  		VARCHAR2(50)		 NOT NULL,
		stdlist_area                  		VARCHAR2(50)		 NOT NULL,
		stdlist_dow                   		VARCHAR2(50)		 NOT NULL,
		stdlist_tot_num               		NUMBER(7)		 DEFAULT 4		 NOT NULL,
		stdlist_curr_num              		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		stdlist_content               		VARCHAR2(4000)		 NOT NULL,
		stdlist_cnt                   		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		stdlist_recom_cnt             		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		stdlist_date                  		DATE		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL,
		cateno                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (cateno) REFERENCES category (cateno)
);

COMMENT ON TABLE studylist is '���͵���';
COMMENT ON COLUMN studylist.stdlist_no is '���͵��ȣ';
COMMENT ON COLUMN studylist.stdlist_title is '���͵� ����';
COMMENT ON COLUMN studylist.stdlist_email is '�̸���';
COMMENT ON COLUMN studylist.stdlist_topic is '�о�';
COMMENT ON COLUMN studylist.stdlist_time is '�ð�';
COMMENT ON COLUMN studylist.stdlist_area is '����';
COMMENT ON COLUMN studylist.stdlist_dow is '����';
COMMENT ON COLUMN studylist.stdlist_tot_num is '��������';
COMMENT ON COLUMN studylist.stdlist_curr_num is '�������';
COMMENT ON COLUMN studylist.stdlist_content is '����(����)���';
COMMENT ON COLUMN studylist.stdlist_cnt is '��ȸ��';
COMMENT ON COLUMN studylist.stdlist_recom_cnt is '��õ��';
COMMENT ON COLUMN studylist.stdlist_date is '�����';
COMMENT ON COLUMN studylist.memberno is 'ȸ����ȣ';
COMMENT ON COLUMN studylist.cateno is 'ī�װ���ȣ';


/**********************************/
/* Table Name: ��û ��Ȳ ���̺� */
/**********************************/
CREATE TABLE recruit(
		recruitno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		confirm                       		VARCHAR2(10)		 DEFAULT 'U'		 NOT NULL,
		std_auth                      		VARCHAR2(10)		 DEFAULT 'U'		 NOT NULL,
		stdlist_no                    		NUMBER(10)		 NULL ,
		memberno                      		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (stdlist_no) REFERENCES studylist (stdlist_no),
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE recruit is '��û ��Ȳ ���̺�';
COMMENT ON COLUMN recruit.recruitno is '��û��ȣ';
COMMENT ON COLUMN recruit.confirm is '���ο���';
COMMENT ON COLUMN recruit.std_auth is '����(���͵� ��)';
COMMENT ON COLUMN recruit.stdlist_no is '���͵��ȣ';
COMMENT ON COLUMN recruit.memberno is 'ȸ����ȣ';


/**********************************/
/* Table Name: �����͵�-ī�װ� ����Ʈ ���̺� */
/**********************************/
CREATE TABLE my_std_catelist(
		mylistno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		stdlist_no                    		NUMBER(10)		 NULL ,
		cateno                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (stdlist_no) REFERENCES studylist (stdlist_no),
  FOREIGN KEY (cateno) REFERENCES category (cateno)
);

COMMENT ON TABLE my_std_catelist is '�����͵�-ī�װ� ����Ʈ ���̺�';
COMMENT ON COLUMN my_std_catelist.mylistno is '�����͵𸮽�Ʈ ���� ��ȣ';
COMMENT ON COLUMN my_std_catelist.stdlist_no is '���͵��ȣ';
COMMENT ON COLUMN my_std_catelist.cateno is 'ī�װ���ȣ';


/**********************************/
/* Table Name: �ڷ�� */
/**********************************/
CREATE TABLE shared(
		sharedno                      		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		sharedtitle                   		VARCHAR2(100)		 NOT NULL,
		sharedcontent                 		VARCHAR2(4000)		 NOT NULL,
		sharedname                    		VARCHAR2(50)		 NOT NULL,
		sharedyoutube                 		VARCHAR2(500)		 NULL ,
		sharedseqno                   		NUMBER(10)		 NOT NULL,
		sharedmp3                     		VARCHAR2(500)		 NULL ,
		sharedmp4                     		VARCHAR2(500)		 NULL ,
		sharedfile                    		VARCHAR2(500)		 NULL ,
		sharedfstor                   		VARCHAR2(500)		 NULL ,
		sharedsize                    		NUMBER(30)		 DEFAULT 0		 NOT NULL,
		shareddate                    		DATE		 NOT NULL,
		sharedcnt                     		NUMBER(6)		 DEFAULT 0		 NOT NULL,
		sharedlike                    		NUMBER(6)		 DEFAULT 0		 NOT NULL,
		sharedpasswd                  		VARCHAR2(50)		 NOT NULL,
		memberno                      		NUMBER(10)		 NULL ,
		cateno                        		NUMBER(10)		 NULL ,
		adminno                       		NUMBER(10)		 NULL ,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (adminno) REFERENCES admin (adminno),
  FOREIGN KEY (cateno) REFERENCES category (cateno)
);

COMMENT ON TABLE shared is '�ڷ��';
COMMENT ON COLUMN shared.sharedno is '�Խ��� ��ȣ';
COMMENT ON COLUMN shared.sharedtitle is '����';
COMMENT ON COLUMN shared.sharedcontent is '����';
COMMENT ON COLUMN shared.sharedname is '�̸�';
COMMENT ON COLUMN shared.sharedyoutube is '��Ʃ��';
COMMENT ON COLUMN shared.sharedseqno is '��� ����';
COMMENT ON COLUMN shared.sharedmp3 is 'MP3';
COMMENT ON COLUMN shared.sharedmp4 is 'MP4';
COMMENT ON COLUMN shared.sharedfile is '����';
COMMENT ON COLUMN shared.sharedfstor is '���� ���ϸ�';
COMMENT ON COLUMN shared.sharedsize is '���� ũ��';
COMMENT ON COLUMN shared.shareddate is '�����';
COMMENT ON COLUMN shared.sharedcnt is '��ȸ��';
COMMENT ON COLUMN shared.sharedlike is '��õ��';
COMMENT ON COLUMN shared.sharedpasswd is '�н�����';
COMMENT ON COLUMN shared.memberno is 'ȸ����ȣ';
COMMENT ON COLUMN shared.cateno is 'ī�װ���ȣ';
COMMENT ON COLUMN shared.adminno is '�����ڹ�ȣ';


/**********************************/
/* Table Name: �ŷ� �Խ��� */
/**********************************/
CREATE TABLE sale(
		saleno                        		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		saletitle                     		VARCHAR2(100)		 NOT NULL,
		salecontent                   		VARCHAR2(4000)		 NOT NULL,
		salename                      		VARCHAR2(50)		 NOT NULL,
		saledate                      		DATE		 NOT NULL,
		salecnt                       		NUMBER(6)		 DEFAULT 0		 NOT NULL,
		saleprice                     		NUMBER(30)		 NOT NULL,
		saleaddress                   		VARCHAR2(50)		 NULL ,
		saletel                       		VARCHAR2(50)		 NULL ,
		saleemail                     		VARCHAR2(50)		 NULL ,
		salepasswd                    		VARCHAR2(50)		 NOT NULL,
		salefile                      		VARCHAR2(500)		 NULL ,
		saletum                       		VARCHAR2(500)		 NULL ,
		salesize                      		NUMBER(30)		 DEFAULT 0		 NOT NULL,
		saleseqno                     		NUMBER(10)		 DEFAULT 1		 NOT NULL,
		memberno                      		NUMBER(10)		 NULL ,
		cateno                        		NUMBER(10)		 NULL ,
		adminno                       		NUMBER(10)		 NULL ,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (adminno) REFERENCES admin (adminno),
  FOREIGN KEY (cateno) REFERENCES category (cateno)
);

COMMENT ON TABLE sale is '�ŷ� �Խ���';
COMMENT ON COLUMN sale.saleno is '�Խ��� ��ȣ';
COMMENT ON COLUMN sale.saletitle is '����';
COMMENT ON COLUMN sale.salecontent is '����';
COMMENT ON COLUMN sale.salename is '�̸�';
COMMENT ON COLUMN sale.saledate is '�����';
COMMENT ON COLUMN sale.salecnt is '��ȸ��';
COMMENT ON COLUMN sale.saleprice is '����';
COMMENT ON COLUMN sale.saleaddress is '�ּ�';
COMMENT ON COLUMN sale.saletel is '�޴��� ��ȣ';
COMMENT ON COLUMN sale.saleemail is '�̸���';
COMMENT ON COLUMN sale.salepasswd is '�н�����';
COMMENT ON COLUMN sale.salefile is '����';
COMMENT ON COLUMN sale.saletum is '���� �����';
COMMENT ON COLUMN sale.salesize is '���� ũ��';
COMMENT ON COLUMN sale.saleseqno is '��� ����';
COMMENT ON COLUMN sale.memberno is 'ȸ����ȣ';
COMMENT ON COLUMN sale.cateno is 'ī�װ���ȣ';
COMMENT ON COLUMN sale.adminno is '�����ڹ�ȣ';


/**********************************/
/* Table Name: ���� �Խ��� */
/**********************************/
CREATE TABLE free(
		freeno                        		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		freetitle                     		VARCHAR2(100)		 NOT NULL,
		freecontent                   		VARCHAR2(4000)		 NOT NULL,
		freename                      		VARCHAR2(50)		 NOT NULL,
		freedate                      		DATE		 NOT NULL,
		freecnt                       		NUMBER(6)		 DEFAULT 0		 NOT NULL,
		freelike                      		NUMBER(6)		 DEFAULT 0		 NOT NULL,
		freepasswd                    		VARCHAR2(50)		 NOT NULL,
		memberno                      		NUMBER(10)		 NULL ,
		cateno                        		NUMBER(10)		 NULL ,
		freeseqno                     		NUMBER(10)		 DEFAULT 1		 NOT NULL,
		adminno                       		NUMBER(10)		 NULL ,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (adminno) REFERENCES admin (adminno),
  FOREIGN KEY (cateno) REFERENCES category (cateno)
);

COMMENT ON TABLE free is '���� �Խ���';
COMMENT ON COLUMN free.freeno is '�Խ��� ��ȣ';
COMMENT ON COLUMN free.freetitle is '����';
COMMENT ON COLUMN free.freecontent is '����';
COMMENT ON COLUMN free.freename is '�̸�';
COMMENT ON COLUMN free.freedate is '�����';
COMMENT ON COLUMN free.freecnt is '��ȸ��';
COMMENT ON COLUMN free.freelike is '��õ��';
COMMENT ON COLUMN free.freepasswd is '�н�����';
COMMENT ON COLUMN free.memberno is 'ȸ����ȣ';
COMMENT ON COLUMN free.cateno is 'ī�װ���ȣ';
COMMENT ON COLUMN free.freeseqno is '��� ����';
COMMENT ON COLUMN free.adminno is '�����ڹ�ȣ';


/**********************************/
/* Table Name: ��� �Խ��� */
/**********************************/
CREATE TABLE reply(
		replyno                       		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		replycontent                  		VARCHAR2(200)		 NOT NULL,
		replyname                     		VARCHAR2(50)		 NOT NULL,
		replydate                     		DATE		 NOT NULL,
		replypasswd                   		VARCHAR2(50)		 NOT NULL,
		memberno                      		NUMBER(10)		 NULL ,
		sharedno                      		NUMBER(7)		 NULL ,
		freeno                        		NUMBER(7)		 NULL ,
		saleno                        		NUMBER(7)		 NULL ,
		adminno                       		NUMBER(10)		 NULL ,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (sharedno) REFERENCES shared (sharedno),
  FOREIGN KEY (saleno) REFERENCES sale (saleno),
  FOREIGN KEY (freeno) REFERENCES free (freeno),
  FOREIGN KEY (adminno) REFERENCES admin (adminno)
);

COMMENT ON TABLE reply is '��� �Խ���';
COMMENT ON COLUMN reply.replyno is '��� ��ȣ';
COMMENT ON COLUMN reply.replycontent is '��� ����';
COMMENT ON COLUMN reply.replyname is '��� �ۼ���';
COMMENT ON COLUMN reply.replydate is '��� �����';
COMMENT ON COLUMN reply.replypasswd is '��� �н�����';
COMMENT ON COLUMN reply.memberno is 'ȸ����ȣ';
COMMENT ON COLUMN reply.sharedno is '�ڷ�� ��ȣ';
COMMENT ON COLUMN reply.freeno is '�����Խ��� ��ȣ';
COMMENT ON COLUMN reply.saleno is '�ŷ��Խ��� ��ȣ';
COMMENT ON COLUMN reply.adminno is '�����ڹ�ȣ';


/**********************************/
/* Table Name: ���͵� ����Ʈ ��� */
/**********************************/
CREATE TABLE std_reply(
		std_repno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		std_repcont                   		VARCHAR2(200)		 NOT NULL,
		std_repdate                   		DATE		 NOT NULL,
		std_repname                   		VARCHAR2(30)		 NOT NULL,
		memberno                      		NUMBER(10)		 NULL ,
		stdlist_no                    		NUMBER(10)		 NULL ,
  FOREIGN KEY (stdlist_no) REFERENCES studylist (stdlist_no),
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE std_reply is '���͵� ����Ʈ ���';
COMMENT ON COLUMN std_reply.std_repno is '��� ��ȣ';
COMMENT ON COLUMN std_reply.std_repcont is '��� ����';
COMMENT ON COLUMN std_reply.std_repdate is '��� �����';
COMMENT ON COLUMN std_reply.std_repname is '��� �ۼ���';
COMMENT ON COLUMN std_reply.memberno is 'ȸ����ȣ';
COMMENT ON COLUMN std_reply.stdlist_no is '���͵��ȣ';


/**********************************/
/* Table Name: ���͵�� */
/**********************************/
CREATE TABLE studyroom(
		rono                          		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		adminno                       		NUMBER(10)		 NULL ,
		cateno                        		NUMBER(10)		 NULL ,
		reviewno                      		NUMBER(10)		 NULL ,
		roname                        		VARCHAR2(100)		 NOT NULL,
		rotel                         		VARCHAR2(30)		 NOT NULL,
		rosite                        		VARCHAR2(200)		 NULL ,
		rodate                        		VARCHAR2(100)		 NULL ,
		romap                         		VARCHAR2(300)		 NOT NULL,
		rolocation                    		VARCHAR2(20)		 NOT NULL,
		rocost                        		VARCHAR2(50)		 NULL ,
		roimg                         		VARCHAR2(800)		 NULL ,
		rocontent                     		VARCHAR2(1000)		 NOT NULL,
		rocount                       		VARCHAR2(300)		 NULL ,
		rooption                      		VARCHAR2(150)		 NOT NULL,
  FOREIGN KEY (cateno) REFERENCES category (cateno),
  FOREIGN KEY (adminno) REFERENCES admin (adminno)
);

COMMENT ON TABLE studyroom is '���͵��';
COMMENT ON COLUMN studyroom.rono is '����Ƽ�� ��� ��ȣ';
COMMENT ON COLUMN studyroom.adminno is '�����ڹ�ȣ';
COMMENT ON COLUMN studyroom.cateno is 'ī�װ���ȣ';
COMMENT ON COLUMN studyroom.reviewno is '���͵�� ���� ��� ��ȣ';
COMMENT ON COLUMN studyroom.roname is '���͵�� ��ȣ';
COMMENT ON COLUMN studyroom.rotel is '���͵�� ��ȭ';
COMMENT ON COLUMN studyroom.rosite is '���͵�� Ȩ������';
COMMENT ON COLUMN studyroom.rodate is '���͵�� �����/�ð�';
COMMENT ON COLUMN studyroom.romap is '���͵�� ����';
COMMENT ON COLUMN studyroom.rolocation is '���͵�� ��ġ';
COMMENT ON COLUMN studyroom.rocost is '���͵�� ���';
COMMENT ON COLUMN studyroom.roimg is '���͵�� �̹���';
COMMENT ON COLUMN studyroom.rocontent is '���͵�� ����';
COMMENT ON COLUMN studyroom.rocount is '���͵�� ���ο�';
COMMENT ON COLUMN studyroom.rooption is '���͵�� �ɼ�';


/**********************************/
/* Table Name: ���͵�� ���� */
/**********************************/
CREATE TABLE roomreview(
		rvno                          		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		rono                          		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NULL ,
		rvdate                        		DATE		 NOT NULL,
		rvgood                        		NUMBER(10)		 NOT NULL,
		rvcont                        		VARCHAR2(1000)		 NOT NULL,
		rvup                          		VARCHAR2(20)		 DEFAULT 0		 NOT NULL,
		rvdown                        		VARCHAR2(20)		 DEFAULT 0		 NOT NULL,
		rvpw                          		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (rono) REFERENCES studyroom (rono)
);

COMMENT ON TABLE roomreview is '���͵�� ����';
COMMENT ON COLUMN roomreview.rvno is '���͵�� ���� ��� ��ȣ';
COMMENT ON COLUMN roomreview.rono is '���͵�� ��� ��ȣ';
COMMENT ON COLUMN roomreview.memberno is 'ȸ����ȣ';
COMMENT ON COLUMN roomreview.rvdate is '���� �����';
COMMENT ON COLUMN roomreview.rvgood is '���� ����';
COMMENT ON COLUMN roomreview.rvcont is '���� ����';
COMMENT ON COLUMN roomreview.rvup is '���� ���ƿ�';
COMMENT ON COLUMN roomreview.rvdown is '���� �Ⱦ��';
COMMENT ON COLUMN roomreview.rvpw is '��й�ȣ';


/**********************************/
/* Table Name: ���͵�� �̺�Ʈ */
/**********************************/
CREATE TABLE event(
		evno                          		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		rvno                          		NUMBER(10)		 NULL ,
		evtitle                       		VARCHAR2(300)		 NOT NULL,
		evcontent                     		VARCHAR2(4000)		 NOT NULL,
		evdate                        		DATE		 NOT NULL,
		evdeadline                    		DATE		 NOT NULL,
		evcnt                         		NUMBER(10)		 NOT NULL,
		adminno                       		NUMBER(10)		 NULL ,
		memberno                      		NUMBER(10)		 NULL ,
  FOREIGN KEY (rvno) REFERENCES roomreview (rvno),
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (adminno) REFERENCES admin (adminno)
);

COMMENT ON TABLE event is '���͵�� �̺�Ʈ';
COMMENT ON COLUMN event.evno is '�Խñ� ��ȣ';
COMMENT ON COLUMN event.rvno is '���͵�� ���� ��� ��ȣ';
COMMENT ON COLUMN event.evtitle is '����';
COMMENT ON COLUMN event.evcontent is '����';
COMMENT ON COLUMN event.evdate is '�����';
COMMENT ON COLUMN event.evdeadline is '������';
COMMENT ON COLUMN event.evcnt is '��ȸ��';
COMMENT ON COLUMN event.adminno is '�����ڹ�ȣ';
COMMENT ON COLUMN event.memberno is 'ȸ����ȣ';


/**********************************/
/* Table Name: ��� ���� �Խ��� */
/**********************************/
CREATE TABLE job(
		jobNo                         		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		jobTitle                      		VARCHAR2(200)		 NOT NULL,
		jobCont                       		VARCHAR2(4000)		 NOT NULL,
		jobGood                       		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		jobThumb                      		VARCHAR2(100)		 NULL ,
		jobFile1                      		VARCHAR2(50)		 NULL ,
		jobSize1                      		NUMBER(10)		 DEFAULT 0		 NULL ,
		jobCnt                        		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		jobRepcnt                     		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		jdate                         		DATE		 NOT NULL,
		jobIndent                     		NUMBER(2)		 DEFAULT 0		 NOT NULL,
		jobAnsno                      		NUMBER(5)		 DEFAULT 0		 NOT NULL,
		jobWord                       		VARCHAR2(100)		 NULL ,
		adminno                       		NUMBER(10)		 NULL ,
		cateno                        		NUMBER(10)		 NULL ,
		memberno                      		NUMBER(10)		 NULL ,
  FOREIGN KEY (adminno) REFERENCES admin (adminno),
  FOREIGN KEY (cateno) REFERENCES category (cateno),
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE job is '��� ���� �Խ���';
COMMENT ON COLUMN job.jobNo is '�����ȣ';
COMMENT ON COLUMN job.jobTitle is '��� ���� ����';
COMMENT ON COLUMN job.jobCont is '��� ���� ����';
COMMENT ON COLUMN job.jobGood is '��� ���� ��õ��';
COMMENT ON COLUMN job.jobThumb is '��� ���� �����';
COMMENT ON COLUMN job.jobFile1 is '��� ���� ����';
COMMENT ON COLUMN job.jobSize1 is '��� ���� ���ϻ�����';
COMMENT ON COLUMN job.jobCnt is '��� ���� ��ȸ��';
COMMENT ON COLUMN job.jobRepcnt is '��� ���� ��ۼ�';
COMMENT ON COLUMN job.jdate is '��� ���� �����';
COMMENT ON COLUMN job.jobIndent is '������� �亯����';
COMMENT ON COLUMN job.jobAnsno is '������� �亯����';
COMMENT ON COLUMN job.jobWord is '������� �˻���';
COMMENT ON COLUMN job.adminno is '�����ڹ�ȣ';
COMMENT ON COLUMN job.cateno is 'ī�װ���ȣ';
COMMENT ON COLUMN job.memberno is 'ȸ����ȣ';


/**********************************/
/* Table Name: ������ ���� �Խ��� */
/**********************************/
CREATE TABLE contest(
		conNo                         		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		conTitle                      		VARCHAR2(200)		 NOT NULL,
		conCont                       		VARCHAR2(4000)		 NOT NULL,
		conGood                       		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		conThumb                      		VARCHAR2(100)		 NULL ,
		conFile1                      		VARCHAR2(50)		 NULL ,
		conSize1                      		NUMBER(10)		 DEFAULT 0		 NULL ,
		conCnt                        		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		conRepcnt                     		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		cdate                         		DATE		 NOT NULL,
		conIndent                     		NUMBER(2)		 DEFAULT 0		 NOT NULL,
		conAnsno                      		NUMBER(5)		 DEFAULT 0		 NOT NULL,
		conWord                       		VARCHAR2(100)		 NULL ,
		adminno                       		NUMBER(10)		 NULL ,
		cateno                        		NUMBER(10)		 NULL ,
		memberno                      		NUMBER(10)		 NULL ,
  FOREIGN KEY (cateno) REFERENCES category (cateno),
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (adminno) REFERENCES admin (adminno)
);

COMMENT ON TABLE contest is '������ ���� �Խ���';
COMMENT ON COLUMN contest.conNo is '������ ��ȣ';
COMMENT ON COLUMN contest.conTitle is '������ ����';
COMMENT ON COLUMN contest.conCont is '������ ����';
COMMENT ON COLUMN contest.conGood is '������ ��õ��';
COMMENT ON COLUMN contest.conThumb is '������ �����';
COMMENT ON COLUMN contest.conFile1 is '������ ����';
COMMENT ON COLUMN contest.conSize1 is '������ ���ϻ�����';
COMMENT ON COLUMN contest.conCnt is '������ ��ȸ��';
COMMENT ON COLUMN contest.conRepcnt is '������ ��ۼ�';
COMMENT ON COLUMN contest.cdate is '������ �����';
COMMENT ON COLUMN contest.conIndent is '������ �亯����';
COMMENT ON COLUMN contest.conAnsno is '������ �亯����';
COMMENT ON COLUMN contest.conWord is '������ �˻���';
COMMENT ON COLUMN contest.adminno is '�����ڹ�ȣ';
COMMENT ON COLUMN contest.cateno is 'ī�װ���ȣ';
COMMENT ON COLUMN contest.memberno is 'ȸ����ȣ';


/**********************************/
/* Table Name: QnA �Խ��� */
/**********************************/
CREATE TABLE qna(
		qnaNo                         		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		qnaTitle                      		VARCHAR2(200)		 NOT NULL,
		qnaCont                       		VARCHAR2(4000)		 NOT NULL,
		qnaCnt                        		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		qnaRepcnt                     		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		qdate                         		DATE		 NOT NULL,
		qnaIndent                     		NUMBER(2)		 DEFAULT 0		 NOT NULL,
		qnaAnsno                      		NUMBER(5)		 DEFAULT 0		 NOT NULL,
		qnaWord                       		VARCHAR2(100)		 NULL ,
		adminno                       		NUMBER(10)		 NULL ,
		cateno                        		NUMBER(10)		 NULL ,
		memberno                      		NUMBER(10)		 NULL ,
  FOREIGN KEY (cateno) REFERENCES category (cateno),
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (adminno) REFERENCES admin (adminno)
);

COMMENT ON TABLE qna is 'QnA �Խ���';
COMMENT ON COLUMN qna.qnaNo is 'qna ��ȣ';
COMMENT ON COLUMN qna.qnaTitle is 'qna ����';
COMMENT ON COLUMN qna.qnaCont is 'qna ����';
COMMENT ON COLUMN qna.qnaCnt is 'qna ��ȸ��';
COMMENT ON COLUMN qna.qnaRepcnt is 'qna ��ۼ�';
COMMENT ON COLUMN qna.qdate is 'qna �����';
COMMENT ON COLUMN qna.qnaIndent is 'qna �亯����';
COMMENT ON COLUMN qna.qnaAnsno is 'qna �亯����';
COMMENT ON COLUMN qna.qnaWord is 'qna �˻���';
COMMENT ON COLUMN qna.adminno is '�����ڹ�ȣ';
COMMENT ON COLUMN qna.cateno is 'ī�װ���ȣ';
COMMENT ON COLUMN qna.memberno is 'ȸ����ȣ';




