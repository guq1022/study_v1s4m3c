/**
 * My_pds Controller - 내 스터디 컨트롤러
 * <pre>
 * 프로젝트명     : (주)솔데스크 IT 교육센터 JAVA CBD Project 1조
 * PMO, PM        : 지도 훈련교사
 * 패키지명       : ${dev.mvc.my_pds}
 * 파일명         : ${My_pdsCont.java} ${date}
 * 작성자         : 이동석
 * 작성자 email   : lee33398@naver.com
 * 수정내용
 * ------------------------------------------------------------------
 * 수정 이력
 * ------------------------------------------------------------------ 
 * 수정일        수정자  연락처               수정 내용
 * ------------------------------------------------------------------ 
 * 2017-11-22    이동석 lee33398@naver.com    Controller 최초 작성
 * 2017-11-23    이동석 lee33398@naver.com
 * 2017-11-23    이동석 lee33398@naver.com
 * 2017-11-23    이동석 lee33398@naver.com
 * 2017-11-23    이동석 lee33398@naver.com
 * 2017-11-23    이동석 lee33398@naver.com
 * 2017-11-23    이동석 lee33398@naver.com
 * 2017-11-23    이동석 lee33398@naver.com
 * 2017-11-23    이동석 lee33398@naver.com
 * ------------------------------------------------------------------
 * 
 *</pre>
 */
package dev.mvc.my_pds;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.my_std_catelist.My_std_catelistProcInter;
import dev.mvc.my_std_catelist.My_std_catelistVO;

import nation.web.tool.Tool;
import nation.web.tool.Upload;

import net.sf.json.JSONArray;

@Controller
public class My_pdsCont {
  
  @Autowired
  @Qualifier("dev.mvc.my_pds.My_pdsProc")
  private My_pdsProcInter my_pdsProc;
  
  @RequestMapping(value="/mystudy/mystudy_space.do", method=RequestMethod.GET)
  public ModelAndView myStudy_space(){
    
    /*
     * 근데, cateno도 생각해보면 ajax의 parameter로 전달 되기에 고정된 값과 마찬가지.
     * stdlist_no도 고정.
     * 
     * 그러면 아래에서 mylistno를 조회하는 process는 굳이 hashMap을 사용할 필요가 없음.
     * 
     * mybatis에서 selectList()가 아닌 selectOne()을 사용해도 가능함.
     */
    System.out.println(" --> myStudy_space 호출");
    ModelAndView mav=new ModelAndView();
    mav.setViewName("/my_pds/mystudy_space");
    
    return mav;
  }
  
  /**
   * 게시글 전송 AJAX + 검색 기능 추가 + 검색 결과 수 
   * @param cateno
   * @param stdlist_no
   * @param pdsword
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/mystudy/pds_notice.do", method=RequestMethod.GET, produces="text/plain; charset=utf-8")
  public String pds_notice(int cateno, int stdlist_no, String pdsword, int nowpage){
    System.out.println(" --> pds_notice 호출 (글 목록 출력 AJAX)");
    // mylistno를 먼저 조회해야함. -> stdlist_no, cateno 필요함.
    HashMap<String, Integer> hm_mylistno =new HashMap<String, Integer>();
    hm_mylistno.put("stdlist_no", stdlist_no);
    hm_mylistno.put("cateno", cateno);
     
    // 여기서 mylistno를 가져옴. 
    My_std_catelistVO catelistVO=my_pdsProc.search_mylistno(hm_mylistno);
    
    HashMap<String, Object> hashMap =new HashMap<String, Object>();
    hashMap.put("mylistno", catelistVO.getMylistno());
    hashMap.put("pdsword", pdsword);
    
    // ===============페이징을 위한 코드 시작==================================
    int beginOfPage = (nowpage - 1) * 3;
    
    int startNum = beginOfPage + 1; // 시작 rownum, 1
    int endNum = beginOfPage + 3; // 종료 rownum, 3
    hashMap.put("startNum", startNum);
    hashMap.put("endNum", endNum);
    
    //==========================================================================
    
    // 조회된 mylistno를 바탕으로 my_pds 조회 -> mylistno가 1인 글만 조회.
    List<My_pdsVO> list=my_pdsProc.list(hashMap);
    int search_count=my_pdsProc.search_count(hashMap);  // 검색 결과 수 조회.
    
    System.out.println("search_count :"+search_count);
    
    String paging=my_pdsProc.paging(search_count, nowpage, cateno, stdlist_no);
    
    // list는 mylistno가 1인 글의 정보를 담고 있음.
    // memberno를 가지고 있는데 이를 [회원이름]으로 바꿔야 함. --> ok!
    for(int i=0; i<list.size(); i++){
      list.get(i).setMemname(my_pdsProc.search_memname(list.get(i).getMemberno()));
      list.get(i).setCateno(cateno);
      list.get(i).setStdlist_no(stdlist_no); 
      list.get(i).setSearch_count(search_count);
    }
    
    JSONObject test=new JSONObject();
    test.put("paging", paging);
    
    JSONArray reply = JSONArray.fromObject(list);
    reply.add(test);
    
    return reply.toString();
  }
  
  /**
   * 글 등록 폼
   * @param stdlist_no
   * @param cateno
   * @return
   */
  @RequestMapping(value="/mystudy/create.do", method=RequestMethod.GET)
  public ModelAndView mypds_create(int stdlist_no, int cateno){
    System.out.println(" --> mypds_create [GET]호출");
    ModelAndView mav=new ModelAndView();
    mav.setViewName("/my_pds/my_pds_create");
    
    // mylistno를 넘겨줘야함.
    // mylistno를 먼저 조회해야함. -> stdlist_no, cateno 필요함.
    HashMap<String, Integer> hm_mylistno =new HashMap<String, Integer>();
    hm_mylistno.put("stdlist_no", stdlist_no);
    hm_mylistno.put("cateno", cateno);
    
    My_std_catelistVO catelistVO=my_pdsProc.search_mylistno(hm_mylistno);
    
    mav.addObject("mylistno", catelistVO.getMylistno());
    
    return mav;
  }
  
  /**
   * 글 등록 처리 컨트롤러
   * jsp - hidden : memberno, stdlist_no, cateno, mylistno
   * 
   * jsp에서 보낸 mylistno는 my_pdsVO에 소속되어 컨트롤러에 전달된다.
   *              memberno도 동일하다.
   * 
   * @param my_pdsVO - 글 정보를 전달
   * @param request  - 해당 jsp의 request 객체
   * @param stdlist_no - 돌아갈 위치
   * @param cateno   - 돌아갈 위치
   * @return
   */
  @RequestMapping(value="/mystudy/create.do", method=RequestMethod.POST)
  public ModelAndView mypds_create(My_pdsVO my_pdsVO, HttpServletRequest request, int stdlist_no, int cateno){
    System.out.println(" --> mypds_create [POST]호출");
    ModelAndView mav=new ModelAndView();
    mav.setViewName("/my_pds/message");
    
    System.out.println("getSpring_file() : "+my_pdsVO.getFile1MF());
  //==파일 전송 코드 시작===============================================================================
    String upDir=Tool.getRealPath(request, "/my_pds/storage");
    MultipartFile file1MF=my_pdsVO.getFile1MF();    // 입려되는 파일 명
    long size1=file1MF.getSize();
    
    String file1="";
    String thumb="";
    
    if(size1>0){ 
      file1=Upload.saveFileSpring(file1MF, upDir);
      
      if(Tool.isImage(file1)){
        thumb=Tool.preview(upDir, file1, 120, 80);  // Thumb 이미지 생성.
      }
    }
    
    my_pdsVO.setPdsfile1(file1);
    my_pdsVO.setPdsfilesize((int)size1);
    my_pdsVO.setPdsthumb(thumb);
    
    // ===================================================================================================
    my_pdsVO.setPdsword(my_pdsVO.getPdsword());  // 검색어 일단 보류
    
    ArrayList<String> result_msg=new ArrayList<String>();
    ArrayList<String> result_link=new ArrayList<String>();
    
    int count=my_pdsProc.insert(my_pdsVO);  // 등록 수행
    
    int lastest_pdsno=my_pdsProc.lastest_pdsno(); // 가장 최근에 등록된 pdsno
    
    if(count==1){ // 등록 성공
      result_msg.add("글 등록에 성공하였습니다.");
      result_link.add("<button type='button' class='btn btn-info' onclick=\"location.href='./read.do?stdlist_no="+stdlist_no+"&pdsno="+lastest_pdsno+"&cateno="+cateno+"'\">등록 확인</button>");
    }else{ // 등록 실패
      result_msg.add("글 등록에 실패하였습니다.");
      result_msg.add("관리자에게 문의해주세요.");
      result_link.add("<button type='button' class='btn btn-warning' onclick=\"history.back()\">다시 시도</button>");
    }
    result_link.add("<button type='button' class='btn btn-info' onclick=\"location.href='./mystudy_space.do?stdlist_no="+stdlist_no+"&cateno="+cateno+"'\">글 목록 가기</button>");
    
    mav.addObject("result_msg", result_msg);
    mav.addObject("result_link", result_link); 
    
    return mav;
  }
  
  /**
   * 글 내용 조회 GET 컨트롤러
   * @param pdsno
   * @return
   */
  @RequestMapping(value="/mystudy/read.do", method=RequestMethod.GET)
  public ModelAndView read(int pdsno){
    ModelAndView mav=new ModelAndView();
    mav.setViewName("/my_pds/my_pds_read");
    
    My_pdsVO read=my_pdsProc.read(pdsno);
    
    String memname=my_pdsProc.search_memname(read.getMemberno());
    read.setMemname(memname);
    
    System.out.println(pdsno);
    System.out.println(memname);
    
    // 글 조회수 증가
    my_pdsProc.inc_cnt(pdsno);
    
    mav.addObject("My_pdsVO", read);
    
    return mav;
  }
  
  /**
   * 글 수정 GET 컨트롤러
   * @param pdsno
   * @return
   */
  @RequestMapping(value="/mystudy/update.do", method=RequestMethod.GET)
  public ModelAndView update(int pdsno){
    ModelAndView mav=new ModelAndView();
    mav.setViewName("/my_pds/my_pds_update");
    
    My_pdsVO read=my_pdsProc.read(pdsno);
    
    String memname=my_pdsProc.search_memname(read.getMemberno());
    read.setMemname(memname);
    
    mav.addObject("My_pdsVO", read);
    
    return mav;
  }
  
  //글 수정 처리 POST 컨트롤러
  /**
   * 글 수정 처리 POST 컨트롤러
   * @param my_pdsVO
   * @param request
   * @param mylistno
   * @return
   */
  @RequestMapping(value="/mystudy/update.do", method=RequestMethod.POST)
  public ModelAndView update(My_pdsVO my_pdsVO, HttpServletRequest request, int mylistno){
    System.out.println(" --> update() POST 호출 ");
    ModelAndView mav=new ModelAndView();
    mav.setViewName("/my_pds/message");
    
    // ---------------------------------------------------------------------------
    // 파일 전송
    // ---------------------------------------------------------------------------
    String upDir = Tool.getRealPath(request, "/my_pds/storage");
    
    System.out.println(upDir);
    /*
    <input type="file" class="form-control input-lg" name='file1MF' id='file1MF' size='40' >
    ↓
     name='file1MF'에 해당하는 필드를 찾아서 File 객체를 자동으로 할당
    ↓
    BlogVO.java: private MultipartFile file1MF;
    ↓
     파일 객체 사용: MultipartFile file1MF = blogVO.getFile1MF();          
     */
    
    MultipartFile file1MF = my_pdsVO.getFile1MF();
    String file1 = "";                // DBMS 컬럼명
    long size1 = file1MF.getSize();  // 파일 크기
    String thumb = "";
    
    // 기존에 등록된 글 정보 로딩
    My_pdsVO my_pdsVO_old = my_pdsProc.read(my_pdsVO.getPdsno());
    
    if (size1 > 0) { // 파일이 새로 등록되었다면.
      Tool.deleteFile(upDir, my_pdsVO_old.getPdsfile1());  // 기존 이미지 파일 삭제.
      Tool.deleteFile(upDir, my_pdsVO_old.getPdsthumb());  // 기존 thumb 파일 삭제.
      
      // 신규 파일 업로드
      file1 = Upload.saveFileSpring(file1MF, upDir);
      
      // 이미지 파일이라면 thumb 이미지 생성. thumb는 파일 명을 리턴.
      if (Tool.isImage(file1)) {
        thumb = Tool.preview(upDir, file1, 120, 80); // Thumb 이미지 생성
      }
    } else {
      // 파일을 변경하지 않는 경우 기존 ;파일 정보 사용
      // 기존의 파일의 내용이 없는 경우 null이기에 Tool을 사용하여 ""으로 변환한다.
      file1 = Tool.checkNull(my_pdsVO_old.getPdsfile1());
      size1 = my_pdsVO_old.getPdsfilesize();
      thumb = Tool.checkNull(my_pdsVO_old.getPdsthumb());
    }
    
    my_pdsVO.setPdsfile1(file1);
    my_pdsVO.setPdsfilesize((int)size1);
    my_pdsVO.setPdsthumb(thumb); 
    // ---------------------------------------------------------------------------
    
    // ==== 글 수정 시작 ==== //
    
    ArrayList<String> result_msg=new ArrayList<String>();
    ArrayList<String> result_link=new ArrayList<String>();
    
    My_std_catelistVO catelistVO=my_pdsProc.search_cateno_stdlist_no(mylistno);
    
    int stdlist_no=catelistVO.getStdlist_no();
    int cateno=catelistVO.getCateno();
    
    int count=my_pdsProc.update(my_pdsVO);
    
    if(count==1){ // 수정 성공
      result_msg.add("글 수정에 성공하였습니다.");
      result_link.add("<button type='button' onclick=\"location.href='./read.do?stdlist_no="+stdlist_no+"&pdsno="+my_pdsVO.getPdsno()+"&cateno="+cateno+"'\">변경 확인</button>");
    }else{ // 수정 실패
      result_msg.add("글 수정에 실패하였습니다.");
      result_msg.add("관리자에게 문의해주세요.");
      result_link.add("<button type='button' onclick=\"history.back()\">다시 시도</button>");
    }
    result_link.add("<button type='button' onclick=\"location.href='./mystudy_space.do?stdlist_no="+stdlist_no+"&cateno="+cateno+"'\">글 목록 가기</button>");
    
    mav.addObject("result_msg", result_msg);
    mav.addObject("result_link", result_link);
    mav.addObject("count", count);
    
    return mav;
  }
  
  /**
   * 패스워드 검사 - AJAX
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/mystudy/check_pdspasswd.do", method=RequestMethod.GET, produces="text/plain; charset=utf-8")
  public String check_pdspasswd(int pdsno, String pdspasswd){
    System.out.println(" --> check_pdspasswd 호출 ");
    HashMap<String, Object> hashMap=new HashMap<String, Object>();
    hashMap.put("pdsno", pdsno);
    hashMap.put("pdspasswd", pdspasswd);
    
    int passwd_check=my_pdsProc.check_passwd(hashMap);
    
    System.out.println("passwd_check : "+passwd_check);
    
    JSONObject obj=new JSONObject();
    
    obj.put("passwd_check", passwd_check);
    
    return obj.toJSONString();
  }
  
  /**
   * 글 삭제 처리 POST 컨트롤러
   * @param my_pdsVO
   * @param pdsno
   * @return
   */
  @RequestMapping(value="/mystudy/delete.do", method=RequestMethod.POST)
  public ModelAndView delete(My_pdsVO my_pdsVO, int pdsno, int stdlist_no, int cateno){
    System.out.println(" --> delete() POST 호출 ");
    ModelAndView mav=new ModelAndView();
    mav.setViewName("/my_pds/message");
    
    ArrayList<String> result_msg=new ArrayList<String>();
    ArrayList<String> result_link=new ArrayList<String>();
    
    int count=my_pdsProc.delete(pdsno);
    
    if(count==1){ // 삭제 성공
      result_msg.add("글 삭제에 성공하였습니다.");
    }else{ // 수정 실패
      result_msg.add("글 삭제에 실패하였습니다.");
      result_msg.add("관리자에게 문의해주세요.");
      result_link.add("<button type='button' onclick=\"history.back()\">다시 시도</button>");
    }
    result_link.add("<button type='button' onclick=\"location.href='./mystudy_space.do?stdlist_no="+stdlist_no+"&cateno="+cateno+"'\">글 목록 가기</button>");
    
    mav.addObject("result_msg", result_msg);
    mav.addObject("result_link", result_link);
    mav.addObject("count", count);
    
    return mav;
  }
  
 //좋아요 AJAX
  /**
   * 글 좋아요 증가 컨트롤러
   * @param pdsno
   * @return 성공여부
   */
 @ResponseBody
 @RequestMapping(value="/mystudy/like.do", method=RequestMethod.GET, produces="text/plain; charset=utf-8")
 public String like(int pdsno){
   JSONObject obj=new JSONObject();
   int like_count=my_pdsProc.inc_like(pdsno);
   obj.put("like_count", like_count);
   return obj.toJSONString();
 }
 
 // 파일 삭제 AJAX - [수정]에서 파일을 삭제하는 경우에 사용.
 // 새로운 mybatis를 생성하여 구성함.
 @ResponseBody
 @RequestMapping(value="/mystudy/del_file.do", method=RequestMethod.GET, produces="text/plain; charset=utf-8")
 public String del_file(int pdsno, String filename, String thumb, HttpServletRequest request){
   String upDir = Tool.getRealPath(request, "/my_pds/storage");
   
   System.out.println("upDir :"+upDir);
   System.out.println("filename:"+filename);
   
   JSONObject obj=new JSONObject();
   int del_file_count=my_pdsProc.del_file(pdsno);
   boolean del_file_idx=false;  // 파일 삭제 성공 유무 인덱스
   boolean del_thumb_idx=false; // 썸 파일 삭제 성공 유무 인덱스
   int result=0;                  // 총 결과.
   
   if(del_file_count==1){
     // 이미지 관련 파일이면 썸 파일이 존재하므로 모두 같이 제거.
     if(filename.endsWith(".jpg") || filename.endsWith(".png") || filename.endsWith(".gif")){
       del_file_idx=Tool.deleteFile(upDir, filename);  // 등록된 이미지 파일 삭제.
       del_thumb_idx=Tool.deleteFile(upDir, thumb);     // 등록된 thumb 파일 삭제.
     }else{  // 이미지 파일이 아닌경우 썸 파일도 없으므로 파일만 제거.
       del_file_idx=Tool.deleteFile(upDir, filename);  // 등록된 이미지 파일 삭제.
     }
   }
   
   if(del_file_count==1 && (del_file_idx==true || del_thumb_idx==true)){
     result=1;
   }else{
     result=0;
   }
   
   obj.put("result", result);
   return obj.toJSONString();
 }
}
