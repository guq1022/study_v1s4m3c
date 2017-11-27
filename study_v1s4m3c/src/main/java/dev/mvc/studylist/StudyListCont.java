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
  
  //==============이동석=====================================//
  // my_std_catelistProc를 사용하기 위해 선언.
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
   *  create form 데이터베이스에 조합해서 저장
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
    
    //email + area 조합
   String stdlist_email = studyListVO.getEmail1() + "@" + studyListVO.getEmail2();
   String stdlist_area = studyListVO.getArea() + studyListVO.getSelected_area();
   
   //요일 조합
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

     //값 저장
     studyListVO.setStdlist_email(stdlist_email);
     studyListVO.setStdlist_area(stdlist_area);
     studyListVO.setStdlist_dow(stdlist_dow);
    
   
    if (studylistProc.create(studyListVO) == 1) {
      
      // studylistProc.stdlist_no() - 가장 최근에 등록된 스터디 번호를 가져온다.
      studyListVO.setStdlist_no(studylistProc.stdlist_no());  
      
      if(recruitProc.create(studyListVO) == 1) {
        recruitProc.leader_auth(studyListVO.getMemberno());
        
        //=================이동석 추가 ========================//
        // 스터디가 정상 등록되면 해당 스터디의 하위 카테고리를 생성한다.
        // stdlist_no와 cateno(2, 3, 4, 5)가 필요하므로 반복문을 통해 여러번 호출한다.
        HashMap<String, Integer> my_std=new HashMap<String, Integer>();
        
        for(int i=2; i<6; i++){
          my_std.put("stdlist_no", studyListVO.getStdlist_no());
          my_std.put("cateno", i);
          catelistProc.insert(my_std);
          my_std.clear();
        }
        
        //=====================================================//
        msgs.add("등록 성공");
      }else{
        msgs.add("등록 실패 (리더 정보 등록 실패)");
      }
    } else {
      msgs.add("등록 실패");
      msgs.add("다시 시도 -> 운영팀");
      links.add("<button type= 'button' onclick=\"history.back()\">다시 시도</button>");
    }

    links.add("<button type= 'button' onclick=\"location.href='./list.do'\">목록</button>");
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
  
  
  /**
   *  스터디리스트 목록 출력
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
   *  스터디리스트 변경
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
      msgs.add("스터디 모집 변경 성공");
    } else {
      msgs.add("변경 실패");
      msgs.add("다시 시도 -> 운영팀");
      links.add("<button type= 'button' onclick=\"history.back()\">다시 시도</button>");
    }

    links.add("<button type= 'button' onclick=\"location.href='./list.do'\">목록</button>");
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
  
  /**
   *  스터디리스트 삭제
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
      msgs.add("스터디 모집 삭제 성공");
    } else {
      msgs.add("스터디 모집 삭제 실패"); 
      msgs.add("다시 시도 -> 운영팀");
      links.add("<button type= 'button' onclick=\"history.back()\">다시 시도</button>");
    }

    links.add("<button type= 'button' onclick=\"location.href='./list.do'\">목록</button>");
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }

  /**
   *  스터디리스트 출력
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
