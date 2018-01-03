DROP TABLE message CASCADE CONSTRAINTS;
DROP TABLE my_reply CASCADE CONSTRAINTS;
DROP TABLE my_pds CASCADE CONSTRAINTS;
DROP TABLE my_std_catelist CASCADE CONSTRAINTS;
DROP TABLE studylist CASCADE CONSTRAINTS;
DROP TABLE category CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: ȸ������ */
/**********************************/
CREATE TABLE member(
		memberno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memid                         		VARCHAR2(50)		 NOT NULL  UNIQUE,
		mememail                      		VARCHAR2(100)		 NOT NULL  UNIQUE,
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
COMMENT ON COLUMN member.memid is 'ȸ�����̵�';
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
		cateno                        		NUMBER(10)		 NULL 
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
/* Table Name: �����͵�-ī�װ� ����Ʈ ���̺� */
/**********************************/
CREATE TABLE my_std_catelist(
		mylistno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		stdlist_no                    		NUMBER(10)		 NULL ,
		cateno                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (cateno) REFERENCES category (cateno),
  FOREIGN KEY (stdlist_no) REFERENCES studylist (stdlist_no)
);

COMMENT ON TABLE my_std_catelist is '�����͵�-ī�װ� ����Ʈ ���̺�';
COMMENT ON COLUMN my_std_catelist.mylistno is '�����͵𸮽�Ʈ ���� ��ȣ';
COMMENT ON COLUMN my_std_catelist.stdlist_no is '���͵��ȣ';
COMMENT ON COLUMN my_std_catelist.cateno is 'ī�װ���ȣ';


/**********************************/
/* Table Name: �� ���͵� �� ��� */
/**********************************/
CREATE TABLE my_pds(
		pdsno                         		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		pdstitle                      		VARCHAR2(100)		 NOT NULL,
		pdspasswd                     		VARCHAR2(20)		 NULL ,
		pdscontent                    		VARCHAR2(4000)		 NULL ,
		pdsfile1                      		VARCHAR2(10)		 NULL ,
		pdsfilesize                   		NUMBER(10)		 DEFAULT 0		 NULL ,
		pdsthumb                      		VARCHAR2(100)		 NULL ,
		pdsword                       		VARCHAR2(100)		 NULL ,
		pdslike                       		NUMBER(10)		 DEFAULT 0		 NULL ,
		pdscnt                        		NUMBER(10)		 DEFAULT 0		 NULL ,
		pdsdate                       		DATE		 NOT NULL,
		memberno                      		NUMBER(10)		 NULL ,
		mylistno                      		NUMBER(10)		 NULL ,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (mylistno) REFERENCES my_std_catelist (mylistno)
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


/**********************************/
/* Table Name: �����͵� ��� */
/**********************************/
CREATE TABLE my_reply(
		mycom_no                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		mycom_title                   		VARCHAR2(200)		 NULL ,
		mycom_content                 		VARCHAR2(200)		 NULL ,
		mycom_passwd                  		NUMBER(10)		 NULL ,
		mycom_file1                   		VARCHAR2(10)		 NULL ,
		mycom_size                    		NUMBER(10)		 NULL ,
		mycom_thumb                   		VARCHAR2(100)		 NULL ,
		mycom_good                    		NUMBER(10)		 DEFAULT 0		 NULL ,
		mycom_level                   		NUMBER(10)		 DEFAULT 0		 NULL ,
		mycom_rank                    		NUMBER(10)		 NULL ,
		mycom_cnt                     		NUMBER(10)		 DEFAULT 0		 NULL ,
		mycom_date                    		DATE		 NULL ,
		memberno                      		NUMBER(10)		 NULL ,
		pdsno                         		NUMBER(10)		 NULL ,
  FOREIGN KEY (pdsno) REFERENCES my_pds (pdsno),
  FOREIGN KEY (memberno) REFERENCES member (memberno)
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


/**********************************/
/* Table Name: ���� ���̺� */
/**********************************/
CREATE TABLE message(
		msn_no                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memberno_send                 		NUMBER(10)		 NULL ,
		memberno_rev                  		NUMBER(10)		 NULL ,
		msn_title                     		VARCHAR2(100)		 NULL ,
		msn_content                   		VARCHAR2(500)		 NULL ,
		msn_send_del                  		VARCHAR2(10)		 DEFAULT 'N'		 NOT NULL,
		msn_recv_del                  		VARCHAR2(10)		 DEFAULT 'N'		 NOT NULL,
		msn_confirm                   		VARCHAR2(10)		 NULL ,
		msn_rev_date                  		DATE		 NULL ,
		msn_date                      		DATE		 NULL ,
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


