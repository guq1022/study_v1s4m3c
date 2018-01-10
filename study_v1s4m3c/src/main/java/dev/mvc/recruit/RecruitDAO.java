package dev.mvc.recruit;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dev.mvc.studylist.StudyListVO;

@Repository("dev.mvc.recruit.RecruitDAO")
public class RecruitDAO implements RecruitDAOInter{
  @Autowired
  private SqlSessionTemplate mybatis;
  
  public RecruitDAO(){
    System.out.println("--> RecruitDAO created.");
  }

  @Override
  public int create(RecruitVO recruitVO) {
    
    return mybatis.insert("recruit.create", recruitVO);
  }
  
  @Override
  public int create(StudyListVO studyListVO) {
    
    return mybatis.insert("recruit.create", studyListVO);
  }

  @Override
  public List<Recruit_MemberVO> recruit_list(int stdlist_no) {
    
    return mybatis.selectList("recruit.recruit_list", stdlist_no);
  }

  @Override
  public int leader_auth(int memberno) {
    
    return mybatis.update("recruit.leader_auth", memberno);
  }

  @Override
  public int confirm_Y(int memberno) {
    
    return mybatis.update("recruit.confirm_Y", memberno);
  }

  @Override
  public String check_leader(HashMap<String, Object> hashMap) {
    return mybatis.selectOne("recruit.check_leader", hashMap);
  }
  
}
