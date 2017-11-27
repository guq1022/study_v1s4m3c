package dev.mvc.reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

@Controller
public class ReplyCont {

  @Autowired
  @Qualifier("dev.mvc.reply.ReplyProc")
  private ReplyProcInter replyProc = null;
  
  public ReplyCont(){
    System.out.println("-->ReplyCont created");
  }
}
