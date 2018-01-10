package dev.mvc.recruit;

import java.util.HashMap;
import java.util.List;

import dev.mvc.studylist.StudyListVO;

public interface RecruitDAOInter {

  
  /**
   * <xml> 
   *  ��û �ޱ�
   * <insert id="create" parameterType="RecruitVO">
   * </xml>
   * 
   * @param RecruitVO
   * @return int
   */
  public int create(RecruitVO recruitVO);
  
  /**
   * <xml> 
   *  ���͵�׷��� ��ϰ� ���ÿ� ��������
   * <insert id="create" parameterType="RecruitVO">
   * </xml>
   * 
   * @param StudyListVO
   * @return int
   */
  public int create(StudyListVO studyListVO);
  
  
  /**<xml>
   * ��û ���̺� ����Ʈ
   *  ȸ�����̺� ��û���̺�
   *    <select id="recruit_list" resultType="Recruit_MemberVO" parameterType="int">
   * </xml>
   * @param Recruit_MemberVO
   * @return List
   */
  public List<Recruit_MemberVO> recruit_list(int stdlist_no);
  
  /**
   * <xmp>
   *  ���� ������ �ʱ�ȭ 
   *    <update id= "leader_auth" parameterType="int">
   * </xmp>
   * @param memberno
   * @return int
   */
  public int leader_auth(int memberno);
  
  
  /**
   * <xmp>
   *   ȸ�� ����
   *   <update id = "confirm_Y" parameterType="int">
   * </xmp>
   * @param memberno
   * @return int
   */
  public int confirm_Y(int memberno);
  
  /**
   * <xmp>
   *   <select id= "check_leader" resultType="String" parameterType="Hashmap">
   *   ���� ȸ���� �ش� ���͵��� �������� �ƴ��� ��ȸ
   * </xmp>
   * @param hashMap
   * @return
   */
  public String check_leader(HashMap<String, Object> hashMap);

}
