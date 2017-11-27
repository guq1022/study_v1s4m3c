package dev.mvc.mystudy;

import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.studylist.StudyListVO;

@Controller
public class MyStudyCont {
  
  @Autowired
  @Qualifier("dev.mvc.study.StudyProc")
  private StudyProcInter studyProc;
  
  public MyStudyCont() {
    System.out.println(" --> StudyCont created.");
  }
  
  @RequestMapping(value="/main.do", method=RequestMethod.GET)
  public ModelAndView main(){
    System.out.println(" --> main.jsp 호출");
    ModelAndView mav=new ModelAndView();
    mav.setViewName("/main/index");
    
    return mav;
  }
  
  @RequestMapping(value="/mystudy/mystudy.do", method=RequestMethod.GET)
  public ModelAndView myStudy(){
    System.out.println(" --> mystudy_main.jsp 호출");
    ModelAndView mav=new ModelAndView();
    mav.setViewName("/mystudy/mystudy_main");
    
    List<StudyListVO> mystudylist=studyProc.mystudylist(1);
    
    for(int i=0; i<mystudylist.size(); i++){
      StudyListVO listVO=mystudylist.get(i);
      System.out.println(listVO.getStdlist_title());
    }
    
    mav.addObject("mystudylist", mystudylist);
    
    return mav;
  }
  
  
  // AJAX를 통한 회원 번호를 이용한 회원 정보 조회. JSON 정보 전달.
  /*@ResponseBody
  @RequestMapping(value="/test/meminfo.do", method=RequestMethod.GET, produces="text/plain; charset=UTF-8")
  public String meminfo(int memberno){
    System.out.println(" --> meminfo.do 호출(GET)");
    
    JSONObject obj=new JSONObject();
    
    MeminfoVO meminfoVO=meminfoProc.read(memberno);
    
    System.out.println("memberno : "+meminfoVO.getMemberno());
    System.out.println("membername : "+meminfoVO.getMembername());
    System.out.println("memberPasswd : "+meminfoVO.getPasswd());
    
    obj.put("memberno", memberno);
    obj.put("name", meminfoVO.getMembername());
    obj.put("passwd", meminfoVO.getPasswd());
    
    return obj.toJSONString();
  }*/
  
}
