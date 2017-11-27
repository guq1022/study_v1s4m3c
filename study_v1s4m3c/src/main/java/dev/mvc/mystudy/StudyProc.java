package dev.mvc.mystudy;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import dev.mvc.studylist.StudyListVO;

@Component("dev.mvc.study.StudyProc")
public class StudyProc implements StudyProcInter{
  
  @Autowired
  @Qualifier("dev.mvc.study.StudyDAO")
  private StudyDAOInter studyDAO;
  
  public StudyProc() {
    System.out.println(" --> StudyProc created.");
  }
  
  @Override
  public List<StudyListVO> list() {
    List<StudyListVO> list=studyDAO.list();
    return list;
  }

  @Override
  public List<MemberlistVO> mem_list() {
    List<MemberlistVO> mem_list=studyDAO.mem_list();
    return mem_list;
  }

  @Override
  public List<StudyListVO> mystudylist(int memberno) {
    List<StudyListVO> list=studyDAO.mystudylist(memberno);
    return list;
  }

  /*@Override
  public List<MemberlistVO> join_test() {
    List<MemberlistVO> join=studyDAO.join_test();
    return join;
  }*/
  
  
}
