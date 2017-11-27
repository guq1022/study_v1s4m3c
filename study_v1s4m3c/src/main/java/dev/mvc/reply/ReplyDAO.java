package dev.mvc.reply;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.reply.ReplyDAO")
public class ReplyDAO implements ReplyDAOInter{

  @Autowired
  private SqlSessionTemplate mybatis;
  
  public ReplyDAO(){
    System.out.println("--> ReplyDAO created.");
  }
}
