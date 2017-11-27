package dev.mvc.studylist;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.my_std_catelist.My_std_catelistProcInter;
import dev.mvc.recruit.RecruitProcInter;

@Controller
public class StudyListCont {

  @Autowired
  @Qualifier("dev.mvc.studylist.StudyListProc")
  private StudyListProcInter studylistProc = null;
  
  @Autowired
  @Qualifier("dev.mvc.recruit.RecruitProc")
  private RecruitProcInter recruitProc = null;
  
  //==============�̵���=====================================//
  // my_std_catelistProc�� ����ϱ� ���� ����.
  @Autowired
  @Qualifier("dev.mvc.my_std_catelist.My_std_catelistProc")
  private My_std_catelistProcInter catelistProc;
  
  //=========================================================//
 
  
   public StudyListCont(){
     System.out.println("-->StudyListCont created");
   }
   
   
   /**
    *  create form
    * @return
    */
// http://localhost:9090/study/studylist/create.do
  @RequestMapping(value = "/studylist/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET executed");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/studylist/studycreate"); // webapp/studylist/create.jsp

    return mav;
  }
  
  /**
   *  create form �����ͺ��̽��� �����ؼ� ����
   * @param studyListVO
   * @return
   */
  @RequestMapping(value = "/studylist/create.do", method = RequestMethod.POST)
  public ModelAndView create(StudyListVO studyListVO) {
    System.out.println("--> create() POST executed");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/studylist/message"); // webapp/category/message.jsp

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
/*    
    System.out.println("stdlist_topic :"+studyListVO.getStdlist_topic());
    System.out.println("AREA :"+studyListVO.getArea());
    System.out.println("selected_area :"+studyListVO.getSelected_area());
    System.out.println("EMAIL1 :"+studyListVO.getEmail1());
    System.out.println("EMAIL2 :"+studyListVO.getEmail2());
    */
    
    //email + area ����
   String stdlist_email = studyListVO.getEmail1() + "@" + studyListVO.getEmail2();
   String stdlist_area = studyListVO.getArea() + studyListVO.getSelected_area();
   
   //���� ����
   String stdlist_dow ="";
   String dow1 = studyListVO.getDow1();
   String dow2 = studyListVO.getDow2();
   String dow3 = studyListVO.getDow3();
   String dow4 = studyListVO.getDow4();
   String dow5 = studyListVO.getDow5();
   String dow6 = studyListVO.getDow6();
   String dow7 = studyListVO.getDow7();
        
     if( dow1 != null){
       stdlist_dow += dow1; 
     }
     if( dow2 != null){
       stdlist_dow += dow2; 
     }
     if( dow3 != null){
       stdlist_dow += dow3; 
     }
     if( dow4 != null){
       stdlist_dow += dow4; 
     }
     if( dow5 != null){
       stdlist_dow += dow5; 
     }
     if( dow6 != null){
       stdlist_dow += dow6; 
     }
     if( dow7 != null){
       stdlist_dow += dow7; 
     }

     //�� ����
     studyListVO.setStdlist_email(stdlist_email);
     studyListVO.setStdlist_area(stdlist_area);
     studyListVO.setStdlist_dow(stdlist_dow);
    
   
    if (studylistProc.create(studyListVO) == 1) {
      
      // studylistProc.stdlist_no() - ���� �ֱٿ� ��ϵ� ���͵� ��ȣ�� �����´�.
      studyListVO.setStdlist_no(studylistProc.stdlist_no());  
      
      if(recruitProc.create(studyListVO) == 1) {
        recruitProc.leader_auth(studyListVO.getMemberno());
        
        //=================�̵��� �߰� ========================//
        // ���͵� ���� ��ϵǸ� �ش� ���͵��� ���� ī�װ��� �����Ѵ�.
        // stdlist_no�� cateno(2, 3, 4, 5)�� �ʿ��ϹǷ� �ݺ����� ���� ������ ȣ���Ѵ�.
        HashMap<String, Integer> my_std=new HashMap<String, Integer>();
        
        for(int i=2; i<6; i++){
          my_std.put("stdlist_no", studyListVO.getStdlist_no());
          my_std.put("cateno", i);
          catelistProc.insert(my_std);
          my_std.clear();
        }
        
        //=====================================================//
        msgs.add("��� ����");
      }else{
        msgs.add("��� ���� (���� ���� ��� ����)");
      }
    } else {
      msgs.add("��� ����");
      msgs.add("�ٽ� �õ� -> ���");
      links.add("<button type= 'button' onclick=\"history.back()\">�ٽ� �õ�</button>");
    }

    links.add("<button type= 'button' onclick=\"location.href='./list.do'\">���</button>");
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
  
  
  /**
   *  ���͵𸮽�Ʈ ��� ���
   * @return
   */
  // http://localhost:9090/blog/studylist/list.do
  @RequestMapping(value = "/studylist/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    System.out.println("--> list() GET executed");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/studylist/study_list"); // studylist/study_list.jsp
    
    List<StudyListVO> list = studylistProc.list(); 
    mav.addObject("list", list);

    return mav;
  }
  
  /**
   *  ���͵𸮽�Ʈ ����
   * @param studyListVO
   * @return
   */
  @RequestMapping(value = "/studylist/update.do", method = RequestMethod.POST)
  public ModelAndView update(StudyListVO studyListVO) {
    // System.out.println("--> update() POST executed");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/studylist/message"); // webapp/categrp/message.jsp

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (studylistProc.update(studyListVO) == 1) {
      msgs.add("���͵� ���� ���� ����");
    } else {
      msgs.add("���� ����");
      msgs.add("�ٽ� �õ� -> ���");
      links.add("<button type= 'button' onclick=\"history.back()\">�ٽ� �õ�</button>");
    }

    links.add("<button type= 'button' onclick=\"location.href='./list.do'\">���</button>");
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
  
  /**
   *  ���͵𸮽�Ʈ ����
   * @param stdlist_no
   * @return
   */
  @RequestMapping(value = "/studylist/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int stdlist_no) {
    // System.out.println("--> delete() POST executed");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/studylist/message"); // webapp/categrp/message.jsp

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (studylistProc.delete(stdlist_no) == 1) {
      msgs.add("���͵� ���� ���� ����");
    } else {
      msgs.add("���͵� ���� ���� ����"); 
      msgs.add("�ٽ� �õ� -> ���");
      links.add("<button type= 'button' onclick=\"history.back()\">�ٽ� �õ�</button>");
    }

    links.add("<button type= 'button' onclick=\"location.href='./list.do'\">���</button>");
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }

  /**
   *  ���͵𸮽�Ʈ ���
   * @param studyList_memberVO
   * @return
   */
  @RequestMapping(value = "/studylist/read.do", method = RequestMethod.GET)
  public ModelAndView read(StudyList_MemberVO studyList_memberVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/studylist/study_read"); // webapp/studylist/study_read.jsp
    
    
    studyList_memberVO.setMemberno(studyList_memberVO.getMemberno());
    studyList_memberVO.setStdlist_no(studyList_memberVO.getStdlist_no());

    StudyList_MemberVO read = studylistProc.read(studyList_memberVO);
    
    studylistProc.up_cnt(read.getStdlist_no());
    
    mav.addObject("read", read);
   
    return mav;
    
    
  }

}
