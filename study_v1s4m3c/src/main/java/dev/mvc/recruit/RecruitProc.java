package dev.mvc.recruit;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import dev.mvc.studylist.StudyListVO;

@Component("dev.mvc.recruit.RecruitProc")
public class RecruitProc implements RecruitProcInter{

  @Autowired
  @Qualifier("dev.mvc.recruit.RecruitDAO")
  private RecruitDAOInter recruitDAO = null;
  
  public RecruitProc(){
    System.out.println("--> RecruitProc created.");
  }

  /**
   * ȸ���� ���͵�׷� ��û�� �ϰ� �Ǹ� ��û���̺� �Է�
   */
  @Override
  public int create(RecruitVO recruitVO) {
    
    return recruitDAO.create(recruitVO);
  }

  /**
   * ���͵� �׷캰 ��û����Ʈ
   */
  @Override
  public List<Recruit_MemberVO> recruit_list(int stdlist_no) {
    
    return recruitDAO.recruit_list(stdlist_no);
  }

  /**
   *  ���� ���� �ʱ�ȭ
   *  Y , L
   */
  @Override
  public int leader_auth(int memberno) {
    
    return recruitDAO.leader_auth(memberno);
  }

  /**
   *  ���εǸ� ȸ�� ���͵�׷쿡 ����
   *  Y, T
   */
  @Override
  public int confirm_Y(int memberno) {
    
    return recruitDAO.confirm_Y(memberno);
  }

  /**
   *  ���͵� �׷��ϰ� ���ÿ� ��û���̺� �ڵ����� ����
   *  �����Է°� ���ÿ� ���� ����
   */
  @Override
  public int create(StudyListVO studyListVO) {
    
    return recruitDAO.create(studyListVO);
  }

}
