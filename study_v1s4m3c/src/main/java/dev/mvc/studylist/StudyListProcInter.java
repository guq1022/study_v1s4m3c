package dev.mvc.studylist;

import java.util.HashMap;
import java.util.List;

public interface StudyListProcInter {

  
  /**
   * <xml> 
   *  스터디그룹 등록
   * <insert id="create" parameterType="StudyListVO">
   * </xml>
   * 
   * @param BlogVO
   * @return int
   */
  public int create(StudyListVO studyListVO);
  
  
  /**<xml>
   *  스터디그룹 목록
   *  <select id="list" resultType="StudyListVO">
   * </xml>
   * @param StudyListVO
   * @return List
   */
  public List<StudyListVO> list();
  
  /**<xml>
   * 스터디모집 내용을 수정합니다.
   * <update id="update" parameterType="StudyListVO"> 
   * </xml>
   * @param studyListVO 
   * @return
   */
  public int update(StudyListVO studyListVO ); 
  
  
  /**<xml>
   * 스터디모집 내용 삭제합니다.
   * <delete id="delete" parameterType="int">
   * </xml>
   * @param stdlist_no 
   * @return
   */
  public int delete(int stdlist_no); 
  
  /**<xml>
   *  스터디모집글과 회원정보를 조회한다. 
   *  <select id="read" resultType="StudyListVO" parameterType="hashMap" >
   * </xml>
   * @param StudyList_MemberVO
   * @return StudyList_MemberVO
   */
  public StudyList_MemberVO read(StudyList_MemberVO studyList_memberVO);
  
  /**<xml>
   *   stdlist_no 별 조회
   *   <select id="read_std" resultType="StudyListVO"  parameterType="int">
   * </xml>
   * @param stdlist_no
   * @return StudtListVO
   */
  public StudyListVO read_std(int stdlist_no);
  
  /**
   * <xmp>
   * 팀장이 회원 승인 신청을 하게 되면 현재인원수 +1 
   * <update id="up_currnum" parameterType="int">
   * </xmp>
   * @param categoryno
   * @return
   */
  public int up_currnum(int stdlist_no);
  
  
  /**
   * <xmp>
   *  조회수  +1 
   * <update id="up_cnt" parameterType="int">
   * </xmp>
   * @param categoryno
   * @return
   */
  public int up_cnt(int stdlist_no);
  
  /**
   * <xmp>
   * <!-- 스터디리스트의 번호 조회 -->
   * <select id="stdlist_no">
   * </xmp>
   * @param categoryno
   * @return
   */
  public int stdlist_no();
}
