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
   * ���͵� �׷� �Է�
   */
  @Override
  public int create(StudyListVO studyListVO) {
   
    return studyListDAO.create(studyListVO);
  }

  /**
   *  ���͵� ����Ʈ ���
   */
  @Override
  public List<StudyListVO> list() {
   
    return studyListDAO.list();
  }

  /**
   *  ���͵� ����Ʈ ����
   */
  @Override
  public int update(StudyListVO studyListVO) {
    
    return studyListDAO.update(studyListVO);
  }

  /**
   * ���͵� ����Ʈ ����
   */
  @Override
  public int delete(int stdlist_no) {
    
    return studyListDAO.delete(stdlist_no);
  }

  /**
   *  ���͵� ����Ʈ �о����
   *  ���͵� ����Ʈ + ȸ�� ����
   */
  @Override
  public StudyList_MemberVO read(StudyList_MemberVO studyList_memberVO) {
    return studyListDAO.read(studyList_memberVO);
  }

  /**
   *  ������ �������� ���� �ο��� ����
   */
  @Override
  public int up_currnum(int stdlist_no) {
    
    return studyListDAO.up_currnum(stdlist_no);
  }

  /**
   *  ���͵𸮽�Ʈ �� ��ȸ�� ����
   */
  @Override
  public int up_cnt(int stdlist_no) {
    
    return studyListDAO.up_cnt(stdlist_no);
  }

  /**
   *  ���͵𸮽�Ʈ�� �� �ϳ� �о����
   */
  @Override
  public StudyListVO read_std(int stdlist_no) {
    
    return studyListDAO.read_std(stdlist_no);
  }

  /**
   *  ���͵𸮽�Ʈ��ȣ ��������
   */
  @Override
  public int stdlist_no() {
    
    return studyListDAO.stdlist_no();
  }





}
