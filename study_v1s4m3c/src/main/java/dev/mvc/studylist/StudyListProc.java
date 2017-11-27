package dev.mvc.studylist;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;


@Component("dev.mvc.studylist.StudyListProc")
public class StudyListProc implements StudyListProcInter{
  
  @Autowired
  @Qualifier("dev.mvc.studylist.StudyListDAO")
  private StudyListDAOInter studyListDAO = null;
  
  public StudyListProc() {
    System.out.println("--> StudyListProc created.");
  }

  /**
   * 스터디 그룹 입력
   */
  @Override
  public int create(StudyListVO studyListVO) {
   
    return studyListDAO.create(studyListVO);
  }

  /**
   *  스터디 리스트 출력
   */
  @Override
  public List<StudyListVO> list() {
   
    return studyListDAO.list();
  }

  /**
   *  스터디 리스트 변경
   */
  @Override
  public int update(StudyListVO studyListVO) {
    
    return studyListDAO.update(studyListVO);
  }

  /**
   * 스터디 리스트 삭제
   */
  @Override
  public int delete(int stdlist_no) {
    
    return studyListDAO.delete(stdlist_no);
  }

  /**
   *  스터디 리스트 읽어오기
   *  스터디 리스트 + 회원 정보
   */
  @Override
  public StudyList_MemberVO read(StudyList_MemberVO studyList_memberVO) {
    return studyListDAO.read(studyList_memberVO);
  }

  /**
   *  리더의 승인으로 현재 인원수 증가
   */
  @Override
  public int up_currnum(int stdlist_no) {
    
    return studyListDAO.up_currnum(stdlist_no);
  }

  /**
   *  스터디리스트 별 조회수 증가
   */
  @Override
  public int up_cnt(int stdlist_no) {
    
    return studyListDAO.up_cnt(stdlist_no);
  }

  /**
   *  스터디리스트별 글 하나 읽어오기
   */
  @Override
  public StudyListVO read_std(int stdlist_no) {
    
    return studyListDAO.read_std(stdlist_no);
  }

  /**
   *  스터디리스트번호 가져오기
   */
  @Override
  public int stdlist_no() {
    
    return studyListDAO.stdlist_no();
  }





}
