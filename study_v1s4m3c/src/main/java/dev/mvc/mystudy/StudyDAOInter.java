package dev.mvc.mystudy;

import java.util.List;

import dev.mvc.studylist.StudyListVO;

public interface StudyDAOInter {
  /**
   * <xmp>
   * 스터디 그룹의 목록을 모두 출력한다.
   * <select id="readList" resultType="StudylistVO">
   * </xmp>
   * @return
   */
  public List<StudyListVO> list();
  
  /**
   * <xmp>
   * 회원들의 정보를 모두 출력한다.
   * <select id="readList" resultType="MemberlistVO">
   * </xmp>
   * @return
   */
  public List<MemberlistVO> mem_list();
  
  //public List<MemberlistVO> join_test();
  
  //<select id="mystudylist" resultType="StudyListVO" parameterType="int">
  
  /**
   * <xmp>
   * 내가 참여하고 있는 스터디 목록
   * <select id="mystudylist" resultType="StudyListVO" parameterType="int">
   * </xmp>
   * @param memberno
   * @return List<StudyListVO>
   */
  public List<StudyListVO> mystudylist(int memberno);
}
