package dev.mvc.study;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
 
// '/webapp/resources' ������ ������ ����ڸ� ���� ����
public class MemberInterceptor extends HandlerInterceptorAdapter {
  public MemberInterceptor() {
    System.out.println("--> MemberInterceptor created.");
  }
 
  // preHandle() : ��Ʈ�ѷ����� ���� ����Ǵ� �޼���
  // return false; -> �� �̻� ��Ʈ�ѷ� ��û���� ���� �ʵ��� false�� ��ȯ.
  // return true; -> ��Ʋ�ѷ��� uri�� ����ȴ�.
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
     
    System.out.println(" ==> ���ͼ��� preHandler ����.");
    System.out.println(" ==> ���ͼ��� session:"+session.getAttribute("memberno"));
    if (session.getAttribute("memberno") != null ){ // ���� ����, ��û ������ ó��
      return true; // ��û �������� ��� ����
    } else{ 
      response.sendRedirect(request.getContextPath()+"/login/login.do"); 
      return false;
    }
 
  }
 
  
}