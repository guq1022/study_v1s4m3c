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
   * 회원이 스터디그룹 신청을 하게 되면 신청테이블에 입력
   */
  @Override
  public int create(RecruitVO recruitVO) {
    
    return recruitDAO.create(recruitVO);
  }

  /**
   * 스터디 그룹별 신청리스트
   */
  @Override
  public List<Recruit_MemberVO> recruit_list(int stdlist_no) {
    
    return recruitDAO.recruit_list(stdlist_no);
  }

  /**
   *  리더 권한 초기화
   *  Y , L
   */
  @Override
  public int leader_auth(int memberno) {
    
    return recruitDAO.leader_auth(memberno);
  }

  /**
   *  승인되면 회원 스터디그룹에 참가
   *  Y, T
   */
  @Override
  public int confirm_Y(int memberno) {
    
    return recruitDAO.confirm_Y(memberno);
  }

  /**
   *  스터디 그룹등록과 동시에 신청테이블 자동으로 생성
   *  리더입력과 동시에 권한 변경
   */
  @Override
  public int create(StudyListVO studyListVO) {
    
    return recruitDAO.create(studyListVO);
  }

}
