package dev.mvc.study;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
 
// '/webapp/resources' 폴더는 인증된 사용자만 접근 가능
public class MemberInterceptor extends HandlerInterceptorAdapter {
  public MemberInterceptor() {
    System.out.println("--> MemberInterceptor created.");
  }
 
  // preHandle() : 컨트롤러보다 먼저 수행되는 메서드
  // return false; -> 더 이상 컨트롤러 요청으로 가지 않도록 false로 반환.
  // return true; -> 컨틀롤러의 uri로 진행된다.
  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    System.out.println(request); 
    HttpSession session = request.getSession(false);
    
    if(session == null){
      response.sendRedirect(request.getContextPath()+"/login/login.do"); 
      return false;
    }
    
    System.out.println(session);
    session.setMaxInactiveInterval(60*60);
     
    System.out.println(" ==> 인터셉터 preHandler 동작.");
    System.out.println(" ==> 인터셉터 session:"+session.getAttribute("memberno"));
    if (session.getAttribute("memberno") != null ){ // 접근 가능, 요청 페이지 처리
      return true; // 요청 페이지로 계속 진행
    } else{ 
      response.sendRedirect(request.getContextPath()+"/login/login.do"); 
      return false;
    }
 
  }
 
  
}