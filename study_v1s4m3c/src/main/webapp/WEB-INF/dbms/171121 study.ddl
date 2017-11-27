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
/* Table Name: 회원정보 */
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

COMMENT ON TABLE member is '회원정보';
COMMENT ON COLUMN member.memberno is '회원번호';
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
/* Table Name: 관리자 */
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

COMMENT ON TABLE admin is '관리자';
COMMENT ON COLUMN admin.adminno is '관리자번호';
COMMENT ON COLUMN admin.admemail is '관리자이메일';
COMMENT ON COLUMN admin.admpasswd is '관리자비밀번호';
COMMENT ON COLUMN admin.admname is '관리자이름';
COMMENT ON COLUMN admin.admsignkey is '관리자가입키';
COMMENT ON COLUMN admin.admconfirm is '관리자인증확인';
COMMENT ON COLUMN admin.admauth is '관리자권한';
COMMENT ON COLUMN admin.admdate is '관리자가입일';


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
/* Table Name: 관리자 공지사항 게시판 */
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

COMMENT ON TABLE admnotice is '관리자 공지사항 게시판';
COMMENT ON COLUMN admnotice.anoticeno is '공지사항번호';
COMMENT ON COLUMN admnotice.anoticetitle is '공지사항제목';
COMMENT ON COLUMN admnotice.anoticecontent is '공지사항내용';
COMMENT ON COLUMN admnotice.anoticeseqno is '공지사항출력순서';
COMMENT ON COLUMN admnotice.anoticecnt is '공지사항조회수';
COMMENT ON COLUMN admnotice.anoticedate is '공지사항등록일';
COMMENT ON COLUMN admnotice.adminno is '관리자번호';
COMMENT ON COLUMN admnotice.cateno is '카테고리번호';


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
		cateno                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (cateno) REFERENCES category (cateno)
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
/* Table Name: 신청 현황 테이블 */
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

COMMENT ON TABLE recruit is '신청 현황 테이블';
COMMENT ON COLUMN recruit.recruitno is '신청번호';
COMMENT ON COLUMN recruit.confirm is '승인여부';
COMMENT ON COLUMN recruit.std_auth is '권한(스터디 내)';
COMMENT ON COLUMN recruit.stdlist_no is '스터디번호';
COMMENT ON COLUMN recruit.memberno is '회원번호';


/**********************************/
/* Table Name: 내스터디-카테고리 리스트 테이블 */
/**********************************/
CREATE TABLE my_std_catelist(
		mylistno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		stdlist_no                    		NUMBER(10)		 NULL ,
		cateno                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (stdlist_no) REFERENCES studylist (stdlist_no),
  FOREIGN KEY (cateno) REFERENCES category (cateno)
);

COMMENT ON TABLE my_std_catelist is '내스터디-카테고리 리스트 테이블';
COMMENT ON COLUMN my_std_catelist.mylistno is '내스터디리스트 구분 번호';
COMMENT ON COLUMN my_std_catelist.stdlist_no is '스터디번호';
COMMENT ON COLUMN my_std_catelist.cateno is '카테고리번호';


/**********************************/
/* Table Name: 자료실 */
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

COMMENT ON TABLE shared is '자료실';
COMMENT ON COLUMN shared.sharedno is '게시판 번호';
COMMENT ON COLUMN shared.sharedtitle is '제목';
COMMENT ON COLUMN shared.sharedcontent is '내용';
COMMENT ON COLUMN shared.sharedname is '이름';
COMMENT ON COLUMN shared.sharedyoutube is '유튜브';
COMMENT ON COLUMN shared.sharedseqno is '출력 순서';
COMMENT ON COLUMN shared.sharedmp3 is 'MP3';
COMMENT ON COLUMN shared.sharedmp4 is 'MP4';
COMMENT ON COLUMN shared.sharedfile is '파일';
COMMENT ON COLUMN shared.sharedfstor is '실제 파일명';
COMMENT ON COLUMN shared.sharedsize is '파일 크기';
COMMENT ON COLUMN shared.shareddate is '등록일';
COMMENT ON COLUMN shared.sharedcnt is '조회수';
COMMENT ON COLUMN shared.sharedlike is '추천수';
COMMENT ON COLUMN shared.sharedpasswd is '패스워드';
COMMENT ON COLUMN shared.memberno is '회원번호';
COMMENT ON COLUMN shared.cateno is '카테고리번호';
COMMENT ON COLUMN shared.adminno is '관리자번호';


/**********************************/
/* Table Name: 거래 게시판 */
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

COMMENT ON TABLE sale is '거래 게시판';
COMMENT ON COLUMN sale.saleno is '게시판 번호';
COMMENT ON COLUMN sale.saletitle is '제목';
COMMENT ON COLUMN sale.salecontent is '내용';
COMMENT ON COLUMN sale.salename is '이름';
COMMENT ON COLUMN sale.saledate is '등록일';
COMMENT ON COLUMN sale.salecnt is '조회수';
COMMENT ON COLUMN sale.saleprice is '가격';
COMMENT ON COLUMN sale.saleaddress is '주소';
COMMENT ON COLUMN sale.saletel is '휴대폰 번호';
COMMENT ON COLUMN sale.saleemail is '이메일';
COMMENT ON COLUMN sale.salepasswd is '패스워드';
COMMENT ON COLUMN sale.salefile is '파일';
COMMENT ON COLUMN sale.saletum is '파일 썸네일';
COMMENT ON COLUMN sale.salesize is '파일 크기';
COMMENT ON COLUMN sale.saleseqno is '출력 권한';
COMMENT ON COLUMN sale.memberno is '회원번호';
COMMENT ON COLUMN sale.cateno is '카테고리번호';
COMMENT ON COLUMN sale.adminno is '관리자번호';


/**********************************/
/* Table Name: 자유 게시판 */
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

COMMENT ON TABLE free is '자유 게시판';
COMMENT ON COLUMN free.freeno is '게시판 번호';
COMMENT ON COLUMN free.freetitle is '제목';
COMMENT ON COLUMN free.freecontent is '내용';
COMMENT ON COLUMN free.freename is '이름';
COMMENT ON COLUMN free.freedate is '등록일';
COMMENT ON COLUMN free.freecnt is '조회수';
COMMENT ON COLUMN free.freelike is '추천수';
COMMENT ON COLUMN free.freepasswd is '패스워드';
COMMENT ON COLUMN free.memberno is '회원번호';
COMMENT ON COLUMN free.cateno is '카테고리번호';
COMMENT ON COLUMN free.freeseqno is '출력 권한';
COMMENT ON COLUMN free.adminno is '관리자번호';


/**********************************/
/* Table Name: 댓글 게시판 */
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

COMMENT ON TABLE reply is '댓글 게시판';
COMMENT ON COLUMN reply.replyno is '댓글 번호';
COMMENT ON COLUMN reply.replycontent is '댓글 내용';
COMMENT ON COLUMN reply.replyname is '댓글 작성자';
COMMENT ON COLUMN reply.replydate is '댓글 등록일';
COMMENT ON COLUMN reply.replypasswd is '댓글 패스워드';
COMMENT ON COLUMN reply.memberno is '회원번호';
COMMENT ON COLUMN reply.sharedno is '자료실 번호';
COMMENT ON COLUMN reply.freeno is '자유게시판 번호';
COMMENT ON COLUMN reply.saleno is '거래게시판 번호';
COMMENT ON COLUMN reply.adminno is '관리자번호';


/**********************************/
/* Table Name: 스터디 리스트 댓글 */
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

COMMENT ON TABLE std_reply is '스터디 리스트 댓글';
COMMENT ON COLUMN std_reply.std_repno is '댓글 번호';
COMMENT ON COLUMN std_reply.std_repcont is '댓글 내용';
COMMENT ON COLUMN std_reply.std_repdate is '댓글 등록일';
COMMENT ON COLUMN std_reply.std_repname is '댓글 작성자';
COMMENT ON COLUMN std_reply.memberno is '회원번호';
COMMENT ON COLUMN std_reply.stdlist_no is '스터디번호';


/**********************************/
/* Table Name: 스터디룸 */
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

COMMENT ON TABLE studyroom is '스터디룸';
COMMENT ON COLUMN studyroom.rono is '스터티룸 등록 번호';
COMMENT ON COLUMN studyroom.adminno is '관리자번호';
COMMENT ON COLUMN studyroom.cateno is '카테고리번호';
COMMENT ON COLUMN studyroom.reviewno is '스터디룸 리뷰 등록 번호';
COMMENT ON COLUMN studyroom.roname is '스터디룸 상호';
COMMENT ON COLUMN studyroom.rotel is '스터디룸 전화';
COMMENT ON COLUMN studyroom.rosite is '스터디룸 홈페이지';
COMMENT ON COLUMN studyroom.rodate is '스터디룸 운영요일/시간';
COMMENT ON COLUMN studyroom.romap is '스터디룸 지도';
COMMENT ON COLUMN studyroom.rolocation is '스터디룸 위치';
COMMENT ON COLUMN studyroom.rocost is '스터디룸 비용';
COMMENT ON COLUMN studyroom.roimg is '스터디룸 이미지';
COMMENT ON COLUMN studyroom.rocontent is '스터디룸 내용';
COMMENT ON COLUMN studyroom.rocount is '스터디룸 룸인원';
COMMENT ON COLUMN studyroom.rooption is '스터디룸 옵션';


/**********************************/
/* Table Name: 스터디룸 리뷰 */
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

COMMENT ON TABLE roomreview is '스터디룸 리뷰';
COMMENT ON COLUMN roomreview.rvno is '스터디룸 리뷰 등록 번호';
COMMENT ON COLUMN roomreview.rono is '스터디룸 등록 번호';
COMMENT ON COLUMN roomreview.memberno is '회원번호';
COMMENT ON COLUMN roomreview.rvdate is '리뷰 등록일';
COMMENT ON COLUMN roomreview.rvgood is '리뷰 평점';
COMMENT ON COLUMN roomreview.rvcont is '리뷰 내용';
COMMENT ON COLUMN roomreview.rvup is '리뷰 좋아요';
COMMENT ON COLUMN roomreview.rvdown is '리뷰 싫어요';
COMMENT ON COLUMN roomreview.rvpw is '비밀번호';


/**********************************/
/* Table Name: 스터디룸 이벤트 */
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

COMMENT ON TABLE event is '스터디룸 이벤트';
COMMENT ON COLUMN event.evno is '게시글 번호';
COMMENT ON COLUMN event.rvno is '스터디룸 리뷰 등록 번호';
COMMENT ON COLUMN event.evtitle is '제목';
COMMENT ON COLUMN event.evcontent is '내용';
COMMENT ON COLUMN event.evdate is '등록일';
COMMENT ON COLUMN event.evdeadline is '마감일';
COMMENT ON COLUMN event.evcnt is '조회수';
COMMENT ON COLUMN event.adminno is '관리자번호';
COMMENT ON COLUMN event.memberno is '회원번호';


/**********************************/
/* Table Name: 취업 정보 게시판 */
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

COMMENT ON TABLE job is '취업 정보 게시판';
COMMENT ON COLUMN job.jobNo is '취업번호';
COMMENT ON COLUMN job.jobTitle is '취업 정보 제목';
COMMENT ON COLUMN job.jobCont is '취업 정보 내용';
COMMENT ON COLUMN job.jobGood is '취업 정보 추천수';
COMMENT ON COLUMN job.jobThumb is '취업 정보 썸네일';
COMMENT ON COLUMN job.jobFile1 is '취업 정보 파일';
COMMENT ON COLUMN job.jobSize1 is '취업 정보 파일사이즈';
COMMENT ON COLUMN job.jobCnt is '취업 정보 조회수';
COMMENT ON COLUMN job.jobRepcnt is '취업 정보 댓글수';
COMMENT ON COLUMN job.jdate is '취업 정보 등록일';
COMMENT ON COLUMN job.jobIndent is '취업정보 답변차수';
COMMENT ON COLUMN job.jobAnsno is '취업정보 답변순서';
COMMENT ON COLUMN job.jobWord is '취업정보 검색어';
COMMENT ON COLUMN job.adminno is '관리자번호';
COMMENT ON COLUMN job.cateno is '카테고리번호';
COMMENT ON COLUMN job.memberno is '회원번호';


/**********************************/
/* Table Name: 공모전 정보 게시판 */
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

COMMENT ON TABLE contest is '공모전 정보 게시판';
COMMENT ON COLUMN contest.conNo is '공모전 번호';
COMMENT ON COLUMN contest.conTitle is '공모전 제목';
COMMENT ON COLUMN contest.conCont is '공모전 내용';
COMMENT ON COLUMN contest.conGood is '공모전 추천수';
COMMENT ON COLUMN contest.conThumb is '공모전 썸네일';
COMMENT ON COLUMN contest.conFile1 is '공모전 파일';
COMMENT ON COLUMN contest.conSize1 is '공모전 파일사이즈';
COMMENT ON COLUMN contest.conCnt is '공모전 조회수';
COMMENT ON COLUMN contest.conRepcnt is '공모전 댓글수';
COMMENT ON COLUMN contest.cdate is '공모전 등록일';
COMMENT ON COLUMN contest.conIndent is '공모전 답변차수';
COMMENT ON COLUMN contest.conAnsno is '공모전 답변순서';
COMMENT ON COLUMN contest.conWord is '공모전 검색어';
COMMENT ON COLUMN contest.adminno is '관리자번호';
COMMENT ON COLUMN contest.cateno is '카테고리번호';
COMMENT ON COLUMN contest.memberno is '회원번호';


/**********************************/
/* Table Name: QnA 게시판 */
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

COMMENT ON TABLE qna is 'QnA 게시판';
COMMENT ON COLUMN qna.qnaNo is 'qna 번호';
COMMENT ON COLUMN qna.qnaTitle is 'qna 제목';
COMMENT ON COLUMN qna.qnaCont is 'qna 내용';
COMMENT ON COLUMN qna.qnaCnt is 'qna 조회수';
COMMENT ON COLUMN qna.qnaRepcnt is 'qna 댓글수';
COMMENT ON COLUMN qna.qdate is 'qna 등록일';
COMMENT ON COLUMN qna.qnaIndent is 'qna 답변차수';
COMMENT ON COLUMN qna.qnaAnsno is 'qna 답변순서';
COMMENT ON COLUMN qna.qnaWord is 'qna 검색어';
COMMENT ON COLUMN qna.adminno is '관리자번호';
COMMENT ON COLUMN qna.cateno is '카테고리번호';
COMMENT ON COLUMN qna.memberno is '회원번호';




