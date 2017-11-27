package nation.web.tool;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class Auth_confirm {
  /*
   * Study�� ��� ������ ����
   *  M: ������
   *  A: ������
   *  N: �̽��� �� ������(���ӺҰ�)
   *  L: ���͵� ����
   *  T: ���͵� ����(�Ϲ� ȸ���̸鼭)
   *  U: �Ϲ� ȸ��
   *  B: ��ȸ��
   */
  
  /**
   * ������ �����ڰ� ��� ������ ������ �ִ��� Ȯ�� �մϴ�.
   * ���� ������ ���ǿ� ����Ǿ� �ֽ��ϴ�.
   * @param request
   * @return ���� ����(M, A, N, L, T, U, B)
   */
  public static synchronized String whatAuth(HttpServletRequest request){
    
    HttpSession session = request.getSession();
    String act = (String)session.getAttribute("act");
    
    return act;
  }
  
  /**
   * ������ �������� �˻��մϴ�.
   * @param request
   * @return true: ������ ����
   */
  public static synchronized boolean isMaster(HttpServletRequest request){
    boolean sw = false;
    
    HttpSession session = request.getSession();
    String act = (String)session.getAttribute("act"); // ��Ȱ
    // System.out.println("--> Tool.java act: " + act);
    
    if (act != null){
      if (act.equals("M")){ // ���������� �˻�
        sw = true;
      }
    }
    return sw;
  }
  
  /**
   * ������ �������� �˻��մϴ�.
   * @param request
   * @return true: ������ ����
   */
  public static synchronized boolean isAdmin(HttpServletRequest request){
    boolean sw = false;
    
    HttpSession session = request.getSession();
    String act = (String)session.getAttribute("act"); // ��Ȱ
    // System.out.println("--> Tool.java act: " + act);
    
    if (act != null){
      if (act.equals("A")){ // ���������� �˻�
        sw = true;
      }
    }
    return sw;
  }
  
  /**
   * ���͵� �������� �˻��մϴ�.
   * @param request
   * @return true: ���͵� ���� ����
   */
  public static synchronized boolean isLeader(HttpServletRequest request){
    boolean sw = false;
    
    HttpSession session = request.getSession();
    String act = (String)session.getAttribute("act");      // ȸ�� ����
    String std_auth = (String)session.getAttribute("std_auth"); // ���͵� �������� ����.
    // System.out.println("--> Tool.java act: " + act);
    
    if (act != null){
      if (std_auth.equals("U") && act.equals("L")){ // �Ϲ� �����̸鼭 ���͵� �����ΰ�?
        sw = true;
      }
    }
    return sw;
  }
  
  /**
   * ���͵� �������� �˻��մϴ�.
   * @param request
   * @return true: ���͵� ���� ����
   */
  public static synchronized boolean isTeamMember(HttpServletRequest request){
    boolean sw = false;
    
    HttpSession session = request.getSession();
    String act = (String)session.getAttribute("act");      // ȸ�� ����
    String std_auth = (String)session.getAttribute("std_auth"); // ���͵� �������� ����.
    
    if (act != null){
      if (std_auth.equals("U") && act.equals("T")){ // �Ϲ� �����̸鼭 ���͵� �����ΰ�?
        sw = true;
      }
    }
    return sw;
  }
  
  /**
   * �Ϲ� ȸ������ �˻��մϴ�.(���͵� ���� ���� ���x)
   * @param request
   * @return true: �Ϲ� ȸ�� ����
   */
  public static synchronized boolean isUser(HttpServletRequest request){
    boolean sw = false;
    
    HttpSession session = request.getSession();
    String act = (String)session.getAttribute("act"); // ȸ�� ����
    
    if (act != null){
      if (act.equals("U")){ // �Ϲ� �����ΰ�?
        sw = true;
      }
    }
    return sw;
  }
  
  /**
   * �� ȸ������ �˻��մϴ�.(���͵� ���� ���� ���x)
   * @param request
   * @return true: ��ȸ�� (�α��� x)
   */
  public static synchronized boolean isNotUser(HttpServletRequest request){
    boolean sw = false;
    
    HttpSession session = request.getSession();
    String act = (String)session.getAttribute("act"); // ȸ�� ����
    
    if (act != null){
      if (act.equals("B") || act == null){ // �Ϲ� �����ΰ�?
        sw = true;
      }
    }
    return sw;
  }
  
}
