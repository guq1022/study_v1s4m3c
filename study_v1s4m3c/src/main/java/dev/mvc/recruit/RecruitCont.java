package dev.mvc.recruit;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.memsearch.MemsearchProcInter;
import dev.mvc.memsearch.MemsearchVO;
import dev.mvc.message.MessageProcInter;
import dev.mvc.studylist.StudyListProcInter;
import dev.mvc.studylist.StudyListVO;


@Controller
public class RecruitCont {

  @Autowired
  @Qualifier("dev.mvc.recruit.RecruitProc")
    private RecruitProcInter recruitProc = null;
  
  @Autowired
  @Qualifier("dev.mvc.studylist.StudyListProc")
  private StudyListProcInter StudyListProc = null;
  
  @Autowired
  @Qualifier("dev.mvc.message.MessageProc")
  private MessageProcInter messageProc;
  
  @Autowired
  @Qualifier("dev.mvc.memsearch.MemsearchProc")
  private MemsearchProcInter memsearchProc; 
  
  public RecruitCont(){
    // System.out.println("-->RecruitCont created");
  }
  
  /**
   * ȸ���� ��û�ϰ� �Ǹ� recruit�� ����
   * @param recruitVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/user/recruit/join.do", method = RequestMethod.GET, produces = "application/text; charset=utf8")
  public String join(HttpSession session, RecruitVO recruitVO) {
    // System.out.println("--> create() POST executed");
    
    int leader_memberno=0;
    JSONObject obj = new JSONObject(); 
    
    int memberno = (Integer) session.getAttribute("memberno"); // ���� �۽���
    
    recruitVO.setMemberno(memberno);
    
    int count =  recruitProc.create(recruitVO);
    
    // ���� ��û�ϴ� ���͵� ��ȣ�� ���͵� ���� ������ �����´�.
    StudyListVO stduyVO=StudyListProc.read_std(recruitVO.getStdlist_no());
    MemsearchVO memsearchVO=memsearchProc.search(memberno);
    
    int msg_count=0;
    String msg_title="["+stduyVO.getStdlist_title()+"]���͵� ���� ��û";
    String msg_content=memsearchVO.getMemid()+"���� ���͵� ��û�Դϴ�.";
    
    if(count==1){  // ��û ó�� ����
      // ������ ��ȣ --> ���� ������
      leader_memberno=StudyListProc.search_leader_memberno(recruitVO.getStdlist_no());
      System.out.println(" ==> recruitVO�� ���� ��ȣ:"+leader_memberno);
      
      // ���⼭ ���� ����
      msg_count=messageProc.msg_create(memberno, leader_memberno, msg_title, msg_content);
      int msg_no=messageProc.serach_last_msg_no();  // ��� ����� ���� ��ȣ 
      
      if(msg_count==0){
        // ���� ���� ����
      }else{ 
        //messageProc.msgsend_insert(memberno, msg_no);  // ���� ���� ���� ����
        messageProc.msgrecv_insert(leader_memberno, msg_no); // �޴� ���� ���� ����
      }
    }else{
      System.out.println(" ==> ��û ����.");
    }
    obj.put("count", count);
    return obj.toJSONString();
  }
    
  
  /**
   * ���͵�׷캰�� ��û ����Ʈ ���
   * ��û����Ʈ�� ������̺� ����
   * @param stdlist_no
   * @return
   */
  // http://localhost:9090/blog/studylist/list.do
  @RequestMapping(value = "/user/recruit/recruit_list.do", method = RequestMethod.GET)
  public ModelAndView list(int stdlist_no) {
    // System.out.println("--> list() GET executed");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/user/recruit/recruit_list"); // studylist/study_list.jsp
    
    List<Recruit_MemberVO> recruit_list = recruitProc.recruit_list(stdlist_no);
    
    mav.addObject("recruit_list", recruit_list);

    return mav;
  }
  
  
  /**
   * ���͵� ��û����Ʈ�� ��û�ϰ� �Ǹ� stdlist_no�� �̹� ��û�� memberno ���� �˻� 
   * @param recruitVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/user/recruit/check_memberno.do", method = RequestMethod.GET, produces = "application/text; charset=utf8")
  public String check_memberno(HttpSession session, RecruitVO recruitVO) {
    
    // System.out.println("--> check_memberno() GET executed");
    
    //session�� ���� id�� memberno���� ��������.
    int memberno =  (Integer) session.getAttribute("memberno");
    
    int stdlist_no = recruitVO.getStdlist_no();
    
    
    HashMap hashmap = new HashMap();
    
/*    System.out.println("memberno:"+memberno);
    System.out.println("stdlist_no:"+stdlist_no);*/
    
    hashmap.put("memberno", memberno);
    hashmap.put("stdlist_no", stdlist_no);
    
    JSONObject obj = new JSONObject();
   
    int count =  recruitProc.check_memberno(hashmap);
    
    // System.out.println("count:"+count);
     
    obj.put("count", count);
    obj.put("stdlist_no", stdlist_no);
     
    
    return obj.toString();
  }
  
  /**
   * ���͵�׷� ������ ��û�ο��� �����Ѵ�.
   * @param recruitVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/user/recruit/confirm_Y.do", method = RequestMethod.GET, produces = "application/text; charset=utf8")
  public String confirm_Y(RecruitVO recruitVO) {
    
    // System.out.println("--> confirm_Y() GET executed");
    
    int leader_memberno=0;
    leader_memberno=StudyListProc.search_leader_memberno(recruitVO.getStdlist_no());
    
    // ���� ��û�ϴ� ���͵� ��ȣ�� ���͵� ���� ������ �����´�.
    StudyListVO stduyVO=StudyListProc.read_std(recruitVO.getStdlist_no());
    MemsearchVO memsearchVO=memsearchProc.search(recruitVO.getMemberno());
    
    int msg_count=0;
    String msg_title="["+stduyVO.getStdlist_title()+"]���͵� ���� ��û";
    String msg_content="["+stduyVO.getStdlist_title()+"]���͵� ���� ������ �Ǿ����ϴ�.";
    
    JSONObject obj = new JSONObject(); 
    
    int stdlist_no = recruitVO.getStdlist_no();
    int memberno = recruitVO.getMemberno();
    
    HashMap hashmap = new HashMap();
    
    hashmap.put("stdlist_no", stdlist_no);
    hashmap.put("memberno", memberno);
    
    int count = recruitProc.confirm_Y(hashmap);
    
    if(count==1){  // ���� ó�� ����
      // ������ ��ȣ --> ���� ������
      leader_memberno=StudyListProc.search_leader_memberno(recruitVO.getStdlist_no());
      System.out.println(" ==> recruitVO�� ���� ��ȣ:"+leader_memberno);
      
      // ���⼭ ����ó�� ���� ����  
      msg_count=messageProc.msg_create(leader_memberno, memberno, msg_title, msg_content);
      int msg_no=messageProc.serach_last_msg_no();  // ��� ����� ���� ��ȣ 
      
      if(msg_count==0){
        // ���� ���� ����
        // System.out.println("[����ó��]���� ���� ����");
      }else{
        //messageProc.msgsend_insert(leader_memberno, msg_no);  // ���� ���� ���� ����
        messageProc.msgrecv_insert(memberno, msg_no); // �޴� ���� ���� ����
      }
    }else{
      System.out.println(" ==> ���� ó�� ����.");
    }

    StudyListProc.up_currnum(stdlist_no);
    
    // System.out.println("count :"+count);
    
    obj.put("count", count);
    obj.put("stdlist_no", stdlist_no);
    
    return obj.toString(); 
  }
  
  /**
   * ���͵�׷� ������ ��û�ο��� �����Ѵ�.
   * @param recruitVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/user/recruit/confirm_N.do", method = RequestMethod.GET, produces = "application/text; charset=utf8")
  public String confirm_N(RecruitVO recruitVO) {
    
    // System.out.println("--> confirm_N() GET executed");
    
    int leader_memberno=0;
    leader_memberno=StudyListProc.search_leader_memberno(recruitVO.getStdlist_no());
    
    // ���� ��û�ϴ� ���͵� ��ȣ�� ���͵� ���� ������ �����´�.
    StudyListVO stduyVO=StudyListProc.read_std(recruitVO.getStdlist_no());
    MemsearchVO memsearchVO=memsearchProc.search(recruitVO.getMemberno());
    
    int msg_count=0;
    String msg_title="["+stduyVO.getStdlist_title()+"]���͵� ���� ��û";
    String msg_content="["+stduyVO.getStdlist_title()+"]���͵� ���� ��û�� �����Ǿ����ϴ�.";
    
    JSONObject obj = new JSONObject();
    
    int stdlist_no = recruitVO.getStdlist_no();
    int memberno = recruitVO.getMemberno();
    
    // System.out.println("memberno:"+memberno);
    
    HashMap hashmap = new HashMap();
    
    hashmap.put("stdlist_no", stdlist_no);
    hashmap.put("memberno", memberno);
    
    int count = recruitProc.confirm_N(hashmap);
    
    if(count==1){  // ���� ó�� ����
      // ������ ��ȣ --> ���� ������
      leader_memberno=StudyListProc.search_leader_memberno(recruitVO.getStdlist_no());
      //System.out.println(" ==> recruitVO�� ���� ��ȣ:"+leader_memberno);
      
      // ���⼭ [����] ���� ����
      msg_count=messageProc.msg_create(leader_memberno, memberno, msg_title, msg_content);
      int msg_no=messageProc.serach_last_msg_no();  // ��� ����� ���� ��ȣ 
      
      if(msg_count==0){
        // ���� ���� ����
        // System.out.println("[����ó��]���� ���� ����");
      }else{ 
        //messageProc.msgsend_insert(leader_memberno, msg_no);  // ���� ���� ���� ����
        messageProc.msgrecv_insert(memberno, msg_no); // �޴� ���� ���� ����
      }
    }else{
      System.out.println(" ==> ���� ó�� ����.");
    }
    
    
    // System.out.println("count :"+count);
    
    obj.put("count", count);
    obj.put("stdlist_no", stdlist_no);
    
    return obj.toString(); 
  }
  
  
}
