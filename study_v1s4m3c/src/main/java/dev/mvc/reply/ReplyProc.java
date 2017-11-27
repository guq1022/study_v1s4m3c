package dev.mvc.reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component("dev.mvc.reply.ReplyProc")
public class ReplyProc implements ReplyProcInter{

  @Autowired
  @Qualifier("dev.mvc.reply.ReplyDAO")
  private ReplyDAOInter ReplyDAO = null;
  
  public ReplyProc(){
    System.out.println("--> ReplyProc created.");
  }
}
