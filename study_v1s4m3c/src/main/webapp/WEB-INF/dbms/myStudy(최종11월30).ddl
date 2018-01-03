DROP TABLE message CASCADE CONSTRAINTS;
DROP TABLE my_reply CASCADE CONSTRAINTS;
DROP TABLE my_pds CASCADE CONSTRAINTS;
DROP TABLE my_std_catelist CASCADE CONSTRAINTS;
DROP TABLE studylist CASCADE CONSTRAINTS;
DROP TABLE category CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: 회원정보 */
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

COMMENT ON TABLE member is '회원정보';
COMMENT ON COLUMN member.memberno is '회원번호';
COMMENT ON COLUMN member.memid is '회원아이디';
COMMENT ON COLUMN member.mememail is '회원이메일';
COMMENT ON COLUMN member.mempasswd is '회원비밀번호';
COMMENT ON COLUMN member.memname is '회원이름';
COMMENT ON COLUMN member.memsignkey is '회원가입키';
COMMENT ON COLUMN member.memconfirm is '회원인증확인';
COMMENT ON COLUMN member.memauth is '회원권한';
COMMENT ON COLUMN member.membirth is '회원생년월일';
COMMENT ON COLUMN member.memgender is '회원성별';
COMMENT ON COLUMN member.memaddress is '회원주소';
COMMENT ON COLUMN member.memphone is '회원전화번호';
COMMENT ON COLUMN member.memsns is '회원SNS';
COMMENT ON COLUMN member.memintro is '회원소개';
COMMENT ON COLUMN member.memphoto is '회원사진파일';
COMMENT ON COLUMN member.memphoto_t is '회원사진썸네일';
COMMENT ON COLUMN member.memsize is '회원사진파일크기';
COMMENT ON COLUMN member.mbirthvb is '회원생년월일출력여부';
COMMENT ON COLUMN member.mgendervb is '회원성별출력여부';
COMMENT ON COLUMN member.maddressvb is '회원주소출력여부';
COMMENT ON COLUMN member.mphonevb is '회원전화번호출력여부';
COMMENT ON COLUMN member.msnsvb is '회원SNS출력여부';
COMMENT ON COLUMN member.mintrovb is '회원자기소개출력여부';
COMMENT ON COLUMN member.mphotovb is '회원사진출력여부';
COMMENT ON COLUMN member.memdate is '회원가입일';


/**********************************/
/* Table Name: 카테고리 */
/**********************************/
CREATE TABLE category(
		cateno                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		catename                      		VARCHAR2(50)		 NOT NULL,
		cateseqno                     		NUMBER(5)		 NOT NULL,
		catevisible                   		VARCHAR2(1)		 DEFAULT 'Y'		 NOT NULL
);

COMMENT ON TABLE category is '카테고리';
COMMENT ON COLUMN category.cateno is '카테고리번호';
COMMENT ON COLUMN category.catename is '카테고리이름';
COMMENT ON COLUMN category.cateseqno is '카테고리출력순서';
COMMENT ON COLUMN category.catevisible is '카테고리출력여부';


/**********************************/
/* Table Name: 스터디목록 */
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

COMMENT ON TABLE studylist is '스터디목록';
COMMENT ON COLUMN studylist.stdlist_no is '스터디번호';
COMMENT ON COLUMN studylist.stdlist_title is '스터디 제목';
COMMENT ON COLUMN studylist.stdlist_email is '이메일';
COMMENT ON COLUMN studylist.stdlist_topic is '분야';
COMMENT ON COLUMN studylist.stdlist_time is '시간';
COMMENT ON COLUMN studylist.stdlist_area is '지역';
COMMENT ON COLUMN studylist.stdlist_dow is '요일';
COMMENT ON COLUMN studylist.stdlist_tot_num is '구성원수';
COMMENT ON COLUMN studylist.stdlist_curr_num is '현재원수';
COMMENT ON COLUMN studylist.stdlist_content is '내용(주제)요약';
COMMENT ON COLUMN studylist.stdlist_cnt is '조회수';
COMMENT ON COLUMN studylist.stdlist_recom_cnt is '추천수';
COMMENT ON COLUMN studylist.stdlist_date is '등록일';
COMMENT ON COLUMN studylist.memberno is '회원번호';
COMMENT ON COLUMN studylist.cateno is '카테고리번호';


/**********************************/
/* Table Name: 내스터디-카테고리 리스트 테이블 */
/**********************************/
CREATE TABLE my_std_catelist(
		mylistno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		stdlist_no                    		NUMBER(10)		 NULL ,
		cateno                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (cateno) REFERENCES category (cateno),
  FOREIGN KEY (stdlist_no) REFERENCES studylist (stdlist_no)
);

COMMENT ON TABLE my_std_catelist is '내스터디-카테고리 리스트 테이블';
COMMENT ON COLUMN my_std_catelist.mylistno is '내스터디리스트 구분 번호';
COMMENT ON COLUMN my_std_catelist.stdlist_no is '스터디번호';
COMMENT ON COLUMN my_std_catelist.cateno is '카테고리번호';


/**********************************/
/* Table Name: 내 스터디 글 목록 */
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


/**********************************/
/* Table Name: 내스터디 댓글 */
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


/**********************************/
/* Table Name: 쪽지 테이블 */
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


