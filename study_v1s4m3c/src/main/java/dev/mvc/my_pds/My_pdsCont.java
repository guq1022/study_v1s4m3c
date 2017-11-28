/**
 * My_pds Controller - �� ���͵� ��Ʈ�ѷ�
 * <pre>
 * ������Ʈ��     : (��)�ֵ���ũ IT �������� JAVA CBD Project 1��
 * PMO, PM        : ���� �Ʒñ���
 * ��Ű����       : ${dev.mvc.my_pds}
 * ���ϸ�         : ${My_pdsCont.java} ${date}
 * �ۼ���         : �̵���
 * �ۼ��� email   : lee33398@naver.com
 * ��������
 * ------------------------------------------------------------------
 * ���� �̷�
 * ------------------------------------------------------------------ 
 * ������        ������  ����ó               ���� ����
 * ------------------------------------------------------------------ 
 * 2017-11-22    �̵��� lee33398@naver.com    Controller ���� �ۼ�
 * 2017-11-23    �̵��� lee33398@naver.com
 * 2017-11-23    �̵��� lee33398@naver.com
 * 2017-11-23    �̵��� lee33398@naver.com
 * 2017-11-23    �̵��� lee33398@naver.com
 * 2017-11-23    �̵��� lee33398@naver.com
 * 2017-11-23    �̵��� lee33398@naver.com
 * 2017-11-23    �̵��� lee33398@naver.com
 * 2017-11-23    �̵��� lee33398@naver.com
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
     * �ٵ�, cateno�� �����غ��� ajax�� parameter�� ���� �Ǳ⿡ ������ ���� ��������.
     * stdlist_no�� ����.
     * 
     * �׷��� �Ʒ����� mylistno�� ��ȸ�ϴ� process�� ���� hashMap�� ����� �ʿ䰡 ����.
     * 
     * mybatis���� selectList()�� �ƴ� selectOne()�� ����ص� ������.
     */
    System.out.println(" --> myStudy_space ȣ��");
    ModelAndView mav=new ModelAndView();
    mav.setViewName("/my_pds/mystudy_space");
    
    return mav;
  }
  
  /**
   * �Խñ� ���� AJAX + �˻� ��� �߰� + �˻� ��� �� 
   * @param cateno
   * @param stdlist_no
   * @param pdsword
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/mystudy/pds_notice.do", method=RequestMethod.GET, produces="text/plain; charset=utf-8")
  public String pds_notice(int cateno, int stdlist_no, String pdsword, int nowpage){
    System.out.println(" --> pds_notice ȣ�� (�� ��� ��� AJAX)");
    // mylistno�� ���� ��ȸ�ؾ���. -> stdlist_no, cateno �ʿ���.
    HashMap<String, Integer> hm_mylistno =new HashMap<String, Integer>();
    hm_mylistno.put("stdlist_no", stdlist_no);
    hm_mylistno.put("cateno", cateno);
     
    // ���⼭ mylistno�� ������. 
    My_std_catelistVO catelistVO=my_pdsProc.search_mylistno(hm_mylistno);
    
    HashMap<String, Object> hashMap =new HashMap<String, Object>();
    hashMap.put("mylistno", catelistVO.getMylistno());
    hashMap.put("pdsword", pdsword);
    
    // ===============����¡�� ���� �ڵ� ����==================================
    int beginOfPage = (nowpage - 1) * 3;
    
    int startNum = beginOfPage + 1; // ���� rownum, 1
    int endNum = beginOfPage + 3; // ���� rownum, 3
    hashMap.put("startNum", startNum);
    hashMap.put("endNum", endNum);
    
    //==========================================================================
    
    // ��ȸ�� mylistno�� �������� my_pds ��ȸ -> mylistno�� 1�� �۸� ��ȸ.
    List<My_pdsVO> list=my_pdsProc.list(hashMap);
    int search_count=my_pdsProc.search_count(hashMap);  // �˻� ��� �� ��ȸ.
    
    System.out.println("search_count :"+search_count);
    
    String paging=my_pdsProc.paging(search_count, nowpage, cateno, stdlist_no);
    
    // list�� mylistno�� 1�� ���� ������ ��� ����.
    // memberno�� ������ �ִµ� �̸� [ȸ���̸�]���� �ٲ�� ��. --> ok!
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
   * �� ��� ��
   * @param stdlist_no
   * @param cateno
   * @return
   */
  @RequestMapping(value="/mystudy/create.do", method=RequestMethod.GET)
  public ModelAndView mypds_create(int stdlist_no, int cateno){
    System.out.println(" --> mypds_create [GET]ȣ��");
    ModelAndView mav=new ModelAndView();
    mav.setViewName("/my_pds/my_pds_create");
    
    // mylistno�� �Ѱ������.
    // mylistno�� ���� ��ȸ�ؾ���. -> stdlist_no, cateno �ʿ���.
    HashMap<String, Integer> hm_mylistno =new HashMap<String, Integer>();
    hm_mylistno.put("stdlist_no", stdlist_no);
    hm_mylistno.put("cateno", cateno);
    
    My_std_catelistVO catelistVO=my_pdsProc.search_mylistno(hm_mylistno);
    
    mav.addObject("mylistno", catelistVO.getMylistno());
    
    return mav;
  }
  
  /**
   * �� ��� ó�� ��Ʈ�ѷ�
   * jsp - hidden : memberno, stdlist_no, cateno, mylistno
   * 
   * jsp���� ���� mylistno�� my_pdsVO�� �ҼӵǾ� ��Ʈ�ѷ��� ���޵ȴ�.
   *              memberno�� �����ϴ�.
   * 
   * @param my_pdsVO - �� ������ ����
   * @param request  - �ش� jsp�� request ��ü
   * @param stdlist_no - ���ư� ��ġ
   * @param cateno   - ���ư� ��ġ
   * @return
   */
  @RequestMapping(value="/mystudy/create.do", method=RequestMethod.POST)
  public ModelAndView mypds_create(My_pdsVO my_pdsVO, HttpServletRequest request, int stdlist_no, int cateno){
    System.out.println(" --> mypds_create [POST]ȣ��");
    ModelAndView mav=new ModelAndView();
    mav.setViewName("/my_pds/message");
    
    System.out.println("getSpring_file() : "+my_pdsVO.getFile1MF());
  //==���� ���� �ڵ� ����===============================================================================
    String upDir=Tool.getRealPath(request, "/my_pds/storage");
    MultipartFile file1MF=my_pdsVO.getFile1MF();    // �Է��Ǵ� ���� ��
    long size1=file1MF.getSize();
    
    String file1="";
    String thumb="";
    
    if(size1>0){ 
      file1=Upload.saveFileSpring(file1MF, upDir);
      
      if(Tool.isImage(file1)){
        thumb=Tool.preview(upDir, file1, 120, 80);  // Thumb �̹��� ����.
      }
    }
    
    my_pdsVO.setPdsfile1(file1);
    my_pdsVO.setPdsfilesize((int)size1);
    my_pdsVO.setPdsthumb(thumb);
    
    // ===================================================================================================
    my_pdsVO.setPdsword(my_pdsVO.getPdsword());  // �˻��� �ϴ� ����
    
    ArrayList<String> result_msg=new ArrayList<String>();
    ArrayList<String> result_link=new ArrayList<String>();
    
    int count=my_pdsProc.insert(my_pdsVO);  // ��� ����
    
    int lastest_pdsno=my_pdsProc.lastest_pdsno(); // ���� �ֱٿ� ��ϵ� pdsno
    
    if(count==1){ // ��� ����
      result_msg.add("�� ��Ͽ� �����Ͽ����ϴ�.");
      result_link.add("<button type='button' class='btn btn-info' onclick=\"location.href='./read.do?stdlist_no="+stdlist_no+"&pdsno="+lastest_pdsno+"&cateno="+cateno+"'\">��� Ȯ��</button>");
    }else{ // ��� ����
      result_msg.add("�� ��Ͽ� �����Ͽ����ϴ�.");
      result_msg.add("�����ڿ��� �������ּ���.");
      result_link.add("<button type='button' class='btn btn-warning' onclick=\"history.back()\">�ٽ� �õ�</button>");
    }
    result_link.add("<button type='button' class='btn btn-info' onclick=\"location.href='./mystudy_space.do?stdlist_no="+stdlist_no+"&cateno="+cateno+"'\">�� ��� ����</button>");
    
    mav.addObject("result_msg", result_msg);
    mav.addObject("result_link", result_link); 
    
    return mav;
  }
  
  /**
   * �� ���� ��ȸ GET ��Ʈ�ѷ�
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
    
    // �� ��ȸ�� ����
    my_pdsProc.inc_cnt(pdsno);
    
    mav.addObject("My_pdsVO", read);
    
    return mav;
  }
  
  /**
   * �� ���� GET ��Ʈ�ѷ�
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
  
  //�� ���� ó�� POST ��Ʈ�ѷ�
  /**
   * �� ���� ó�� POST ��Ʈ�ѷ�
   * @param my_pdsVO
   * @param request
   * @param mylistno
   * @return
   */
  @RequestMapping(value="/mystudy/update.do", method=RequestMethod.POST)
  public ModelAndView update(My_pdsVO my_pdsVO, HttpServletRequest request, int mylistno){
    System.out.println(" --> update() POST ȣ�� ");
    ModelAndView mav=new ModelAndView();
    mav.setViewName("/my_pds/message");
    
    // ---------------------------------------------------------------------------
    // ���� ����
    // ---------------------------------------------------------------------------
    String upDir = Tool.getRealPath(request, "/my_pds/storage");
    
    System.out.println(upDir);
    /*
    <input type="file" class="form-control input-lg" name='file1MF' id='file1MF' size='40' >
    ��
     name='file1MF'�� �ش��ϴ� �ʵ带 ã�Ƽ� File ��ü�� �ڵ����� �Ҵ�
    ��
    BlogVO.java: private MultipartFile file1MF;
    ��
     ���� ��ü ���: MultipartFile file1MF = blogVO.getFile1MF();          
     */
    
    MultipartFile file1MF = my_pdsVO.getFile1MF();
    String file1 = "";                // DBMS �÷���
    long size1 = file1MF.getSize();  // ���� ũ��
    String thumb = "";
    
    // ������ ��ϵ� �� ���� �ε�
    My_pdsVO my_pdsVO_old = my_pdsProc.read(my_pdsVO.getPdsno());
    
    if (size1 > 0) { // ������ ���� ��ϵǾ��ٸ�.
      Tool.deleteFile(upDir, my_pdsVO_old.getPdsfile1());  // ���� �̹��� ���� ����.
      Tool.deleteFile(upDir, my_pdsVO_old.getPdsthumb());  // ���� thumb ���� ����.
      
      // �ű� ���� ���ε�
      file1 = Upload.saveFileSpring(file1MF, upDir);
      
      // �̹��� �����̶�� thumb �̹��� ����. thumb�� ���� ���� ����.
      if (Tool.isImage(file1)) {
        thumb = Tool.preview(upDir, file1, 120, 80); // Thumb �̹��� ����
      }
    } else {
      // ������ �������� �ʴ� ��� ���� ;���� ���� ���
      // ������ ������ ������ ���� ��� null�̱⿡ Tool�� ����Ͽ� ""���� ��ȯ�Ѵ�.
      file1 = Tool.checkNull(my_pdsVO_old.getPdsfile1());
      size1 = my_pdsVO_old.getPdsfilesize();
      thumb = Tool.checkNull(my_pdsVO_old.getPdsthumb());
    }
    
    my_pdsVO.setPdsfile1(file1);
    my_pdsVO.setPdsfilesize((int)size1);
    my_pdsVO.setPdsthumb(thumb); 
    // ---------------------------------------------------------------------------
    
    // ==== �� ���� ���� ==== //
    
    ArrayList<String> result_msg=new ArrayList<String>();
    ArrayList<String> result_link=new ArrayList<String>();
    
    My_std_catelistVO catelistVO=my_pdsProc.search_cateno_stdlist_no(mylistno);
    
    int stdlist_no=catelistVO.getStdlist_no();
    int cateno=catelistVO.getCateno();
    
    int count=my_pdsProc.update(my_pdsVO);
    
    if(count==1){ // ���� ����
      result_msg.add("�� ������ �����Ͽ����ϴ�.");
      result_link.add("<button type='button' onclick=\"location.href='./read.do?stdlist_no="+stdlist_no+"&pdsno="+my_pdsVO.getPdsno()+"&cateno="+cateno+"'\">���� Ȯ��</button>");
    }else{ // ���� ����
      result_msg.add("�� ������ �����Ͽ����ϴ�.");
      result_msg.add("�����ڿ��� �������ּ���.");
      result_link.add("<button type='button' onclick=\"history.back()\">�ٽ� �õ�</button>");
    }
    result_link.add("<button type='button' onclick=\"location.href='./mystudy_space.do?stdlist_no="+stdlist_no+"&cateno="+cateno+"'\">�� ��� ����</button>");
    
    mav.addObject("result_msg", result_msg);
    mav.addObject("result_link", result_link);
    mav.addObject("count", count);
    
    return mav;
  }
  
  /**
   * �н����� �˻� - AJAX
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/mystudy/check_pdspasswd.do", method=RequestMethod.GET, produces="text/plain; charset=utf-8")
  public String check_pdspasswd(int pdsno, String pdspasswd){
    System.out.println(" --> check_pdspasswd ȣ�� ");
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
   * �� ���� ó�� POST ��Ʈ�ѷ�
   * @param my_pdsVO
   * @param pdsno
   * @return
   */
  @RequestMapping(value="/mystudy/delete.do", method=RequestMethod.POST)
  public ModelAndView delete(My_pdsVO my_pdsVO, int pdsno, int stdlist_no, int cateno){
    System.out.println(" --> delete() POST ȣ�� ");
    ModelAndView mav=new ModelAndView();
    mav.setViewName("/my_pds/message");
    
    ArrayList<String> result_msg=new ArrayList<String>();
    ArrayList<String> result_link=new ArrayList<String>();
    
    int count=my_pdsProc.delete(pdsno);
    
    if(count==1){ // ���� ����
      result_msg.add("�� ������ �����Ͽ����ϴ�.");
    }else{ // ���� ����
      result_msg.add("�� ������ �����Ͽ����ϴ�.");
      result_msg.add("�����ڿ��� �������ּ���.");
      result_link.add("<button type='button' onclick=\"history.back()\">�ٽ� �õ�</button>");
    }
    result_link.add("<button type='button' onclick=\"location.href='./mystudy_space.do?stdlist_no="+stdlist_no+"&cateno="+cateno+"'\">�� ��� ����</button>");
    
    mav.addObject("result_msg", result_msg);
    mav.addObject("result_link", result_link);
    mav.addObject("count", count);
    
    return mav;
  }
  
 //���ƿ� AJAX
  /**
   * �� ���ƿ� ���� ��Ʈ�ѷ�
   * @param pdsno
   * @return ��������
   */
 @ResponseBody
 @RequestMapping(value="/mystudy/like.do", method=RequestMethod.GET, produces="text/plain; charset=utf-8")
 public String like(int pdsno){
   JSONObject obj=new JSONObject();
   int like_count=my_pdsProc.inc_like(pdsno);
   obj.put("like_count", like_count);
   return obj.toJSONString();
 }
 
 // ���� ���� AJAX - [����]���� ������ �����ϴ� ��쿡 ���.
 // ���ο� mybatis�� �����Ͽ� ������.
 @ResponseBody
 @RequestMapping(value="/mystudy/del_file.do", method=RequestMethod.GET, produces="text/plain; charset=utf-8")
 public String del_file(int pdsno, String filename, String thumb, HttpServletRequest request){
   String upDir = Tool.getRealPath(request, "/my_pds/storage");
   
   System.out.println("upDir :"+upDir);
   System.out.println("filename:"+filename);
   
   JSONObject obj=new JSONObject();
   int del_file_count=my_pdsProc.del_file(pdsno);
   boolean del_file_idx=false;  // ���� ���� ���� ���� �ε���
   boolean del_thumb_idx=false; // �� ���� ���� ���� ���� �ε���
   int result=0;                  // �� ���.
   
   if(del_file_count==1){
     // �̹��� ���� �����̸� �� ������ �����ϹǷ� ��� ���� ����.
     if(filename.endsWith(".jpg") || filename.endsWith(".png") || filename.endsWith(".gif")){
       del_file_idx=Tool.deleteFile(upDir, filename);  // ��ϵ� �̹��� ���� ����.
       del_thumb_idx=Tool.deleteFile(upDir, thumb);     // ��ϵ� thumb ���� ����.
     }else{  // �̹��� ������ �ƴѰ�� �� ���ϵ� �����Ƿ� ���ϸ� ����.
       del_file_idx=Tool.deleteFile(upDir, filename);  // ��ϵ� �̹��� ���� ����.
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
