package dev.mvc.study;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class MySessionListener implements HttpSessionListener{
  
  @Override
  public void sessionCreated(HttpSessionEvent sessionEvent) {
    HttpSession session=sessionEvent.getSession();
     
    try{
      System.out.println("[My SessionListener] Session created:"+session);
      if(session.getAttribute("memberno")!=null){ 
        System.out.println("[My SessionListener]");
      }
    }catch(Exception e){
      System.out.println("[My SessionListener] Error setting session attribute:"+e.getMessage());
    }
  }

  @Override
  public void sessionDestroyed(HttpSessionEvent sessionEvent) {
    
    HttpSession session=sessionEvent.getSession();
    
    System.out.println("[My SessionListener] Session invaildated:"+session);
    System.out.println("[My SessionListener] Value of memberno is:"+session.getAttribute("memberno"));
    
    long time = session.getCreationTime();
    
    long last_time = session.getLastAccessedTime();
     
    long now_time = System.currentTimeMillis();
     
    String id = session.getId(); 
     
    System.out.println((now_time - last_time) + "ms 만에 세션이 죽음"  + id);
  }
  
}
