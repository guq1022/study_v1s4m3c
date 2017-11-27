package nation.web.tool;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class Auth_confirm {
  /*
   * Study의 모든 권한의 종류
   *  M: 마스터
   *  A: 관리자
   *  N: 미승인 된 관리자(접속불가)
   *  L: 스터디 팀장
   *  T: 스터디 팀원(일반 회원이면서)
   *  U: 일반 회원
   *  B: 비회원
   */
  
  /**
   * 현재의 접속자가 어떠한 권한을 가지고 있는지 확인 합니다.
   * 권한 정보는 세션에 저장되어 있습니다.
   * @param request
   * @return 권한 종류(M, A, N, L, T, U, B)
   */
  public static synchronized String whatAuth(HttpServletRequest request){
    
    HttpSession session = request.getSession();
    String act = (String)session.getAttribute("act");
    
    return act;
  }
  
  /**
   * 마스터 계정인지 검사합니다.
   * @param request
   * @return true: 마스터 계정
   */
  public static synchronized boolean isMaster(HttpServletRequest request){
    boolean sw = false;
    
    HttpSession session = request.getSession();
    String act = (String)session.getAttribute("act"); // 역활
    // System.out.println("--> Tool.java act: " + act);
    
    if (act != null){
      if (act.equals("M")){ // 마스터인지 검사
        sw = true;
      }
    }
    return sw;
  }
  
  /**
   * 관리자 계정인지 검사합니다.
   * @param request
   * @return true: 관리자 계정
   */
  public static synchronized boolean isAdmin(HttpServletRequest request){
    boolean sw = false;
    
    HttpSession session = request.getSession();
    String act = (String)session.getAttribute("act"); // 역활
    // System.out.println("--> Tool.java act: " + act);
    
    if (act != null){
      if (act.equals("A")){ // 관리자인지 검사
        sw = true;
      }
    }
    return sw;
  }
  
  /**
   * 스터디 리더인지 검사합니다.
   * @param request
   * @return true: 스터디 리더 계정
   */
  public static synchronized boolean isLeader(HttpServletRequest request){
    boolean sw = false;
    
    HttpSession session = request.getSession();
    String act = (String)session.getAttribute("act");      // 회원 권한
    String std_auth = (String)session.getAttribute("std_auth"); // 스터디 내에서의 권한.
    // System.out.println("--> Tool.java act: " + act);
    
    if (act != null){
      if (std_auth.equals("U") && act.equals("L")){ // 일반 유저이면서 스터디 리더인가?
        sw = true;
      }
    }
    return sw;
  }
  
  /**
   * 스터디 팀원인지 검사합니다.
   * @param request
   * @return true: 스터디 팀원 계정
   */
  public static synchronized boolean isTeamMember(HttpServletRequest request){
    boolean sw = false;
    
    HttpSession session = request.getSession();
    String act = (String)session.getAttribute("act");      // 회원 권한
    String std_auth = (String)session.getAttribute("std_auth"); // 스터디 내에서의 권한.
    
    if (act != null){
      if (std_auth.equals("U") && act.equals("T")){ // 일반 유저이면서 스터디 팀원인가?
        sw = true;
      }
    }
    return sw;
  }
  
  /**
   * 일반 회원인지 검사합니다.(스터디 참여 여부 상관x)
   * @param request
   * @return true: 일반 회원 계정
   */
  public static synchronized boolean isUser(HttpServletRequest request){
    boolean sw = false;
    
    HttpSession session = request.getSession();
    String act = (String)session.getAttribute("act"); // 회원 권한
    
    if (act != null){
      if (act.equals("U")){ // 일반 유저인가?
        sw = true;
      }
    }
    return sw;
  }
  
  /**
   * 비 회원인지 검사합니다.(스터디 참여 여부 상관x)
   * @param request
   * @return true: 비회원 (로그인 x)
   */
  public static synchronized boolean isNotUser(HttpServletRequest request){
    boolean sw = false;
    
    HttpSession session = request.getSession();
    String act = (String)session.getAttribute("act"); // 회원 권한
    
    if (act != null){
      if (act.equals("B") || act == null){ // 일반 유저인가?
        sw = true;
      }
    }
    return sw;
  }
  
}
