package dev.mvc.recruit;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.studylist.StudyListVO;


@Controller
public class RecruitCont {

  @Autowired
  @Qualifier("dev.mvc.recruit.RecruitProc")
    private RecruitProcInter recruitProc = null;
  
  public RecruitCont(){
    System.out.println("-->RecruitCont created");
  }
  
  /**
   * 회원이 신청하게 되면 recruit에 저장
   * @param recruitVO
   * @return
   */
  @RequestMapping(value = "/recruit/join.do", method = RequestMethod.POST)
  public ModelAndView join(RecruitVO recruitVO) {
    System.out.println("--> create() POST executed");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/recruit/message"); // webapp/category/message.jsp

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if (recruitProc.create(recruitVO) == 1) {
           
      msgs.add("스터디 그룹 신청 완료");
    } else {
      msgs.add("신청 실패");
      msgs.add("다시 시도 -> 운영팀");
      links.add("<button type= 'button' onclick=\"history.back()\">다시 시도</button>");
    }

    links.add("<button type= 'button' onclick=\"location.href='./list.do'\">목록</button>");
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
  
/*  @RequestMapping(value = "/recruit/create.do", method = RequestMethod.POST)
  public ModelAndView create(StudyListVO studyListVO) {
    System.out.println("--> create() POST executed");
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/recruit/message"); // webapp/category/message.jsp

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if (recruitProc.create(studyListVO) == 1) {
      
      recruitProc.leader_auth(studyListVO.getMemberno());
      
      mav.setViewName("redirect:/category/list.do");   //spring ->spring 
      
      msgs.add("모집을 시작합니다.");
    } else {
      msgs.add("등록 실패");
      msgs.add("다시 시도 -> 운영팀");
      links.add("<button type= 'button' onclick=\"history.back()\">다시 시도</button>");
    }

    links.add("<button type= 'button' onclick=\"location.href='./list.do'\">목록</button>");
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }*/
  
  /**
   * 스터디그룹별로 신청 리스트 출력
   * @param stdlist_no
   * @return
   */
  // http://localhost:9090/blog/studylist/list.do
  @RequestMapping(value = "/recruit/recruit_list.do", method = RequestMethod.GET)
  public ModelAndView list(int stdlist_no) {
    System.out.println("--> list() GET executed");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/recruit/recruit_list"); // studylist/study_list.jsp
    
    List<Recruit_MemberVO> recruit_list = recruitProc.recruit_list(stdlist_no);
    
    mav.addObject("recruit_list", recruit_list);

    return mav;
  }
  
}
