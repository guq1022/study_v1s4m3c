package dev.mvc.studylist;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import nation.web.tool.Tool;

@Component("dev.mvc.studylist.StudyListProc")
public class StudyListProc implements StudyListProcInter {

  @Autowired
  @Qualifier("dev.mvc.studylist.StudyListDAO")
  private StudyListDAOInter studyListDAO = null;

  public StudyListProc() {
    // System.out.println("--> StudyListProc created.");
  }

  /**
   * 스터디 그룹 입력
   */
  @Override
  public int create(StudyListVO studyListVO) {

    return studyListDAO.create(studyListVO);
  }

  /**
   * 스터디 리스트 출력
   */
  @Override
  public List<StudyListVO> list() {

    return studyListDAO.list();
  }

  /**
   * 스터디 리스트 변경
   */
  @Override
  public int update(StudyListVO studyListVO) {

    return studyListDAO.update(studyListVO);
  }

  /**
   * 스터디 리스트 삭제
   */
  @Override
  public int delete(int stdlist_no) {

    return studyListDAO.delete(stdlist_no);
  }

  /**
   * 스터디 리스트 읽어오기 스터디 리스트 + 회원 정보
   */
  @Override
  public StudyList_MemberVO read(StudyList_MemberVO studyList_memberVO) {
    return studyListDAO.read(studyList_memberVO);
  }

  /**
   * 리더의 승인으로 현재 인원수 증가
   */
  @Override
  public int up_currnum(int stdlist_no) {

    return studyListDAO.up_currnum(stdlist_no);
  }

  /**
   * 스터디리스트 별 조회수 증가
   */
  @Override
  public int up_cnt(int stdlist_no) {

    return studyListDAO.up_cnt(stdlist_no);
  }

  /**
   * 스터디리스트별 글 하나 읽어오기
   */
  @Override
  public StudyListVO read_std(int stdlist_no) {

    return studyListDAO.read_std(stdlist_no);
  }

  /**
   * 스터디리스트번호 가져오기
   */
  @Override
  public int stdlist_no() {

    return studyListDAO.stdlist_no();
  }

  /**
   * 체크박스를 통한 검색
   */
  @Override
  public List<StudyListVO> search_list1(HashMap hashmap) {

    return studyListDAO.search_list1(hashmap);
  }

  @Override
  public List<StudyListVO> search_list2(HashMap hashmap) {

    return studyListDAO.search_list2(hashmap);
  }

  @Override
  public List<StudyListVO> search_list3(HashMap hashmap) {

    /*
     * 페이지에서 출력할 시작 레코드 번호 계산 기준값, nowPage는 1부터 시작 1페이지: nowPage = 1, (1-1) * 10
     * => 0 2페이지: nowPage = 2, (2-1) * 10 => 10 3페이지: nowPage = 3, (3-1) * 10 =>
     * 20
     */
    int beginOfPage = ((Integer) hashmap.get("nowPage") - 1) * StudyList.RECORD_PER_PAGE;
    int startNum = beginOfPage + 1; // 시작 rownum/ 1페이지: 1/ 2페이지: 11
    int endNum = beginOfPage + StudyList.RECORD_PER_PAGE;
    ; // 종료 rownum/ 1페이지: 10/ 2페이지: 20
    /*
     * 1페이지: WHERE r >= 1 AND r <= 10 2페이지: WHERE r >= 11 AND r <= 20 3페이지:
     * WHERE r >= 21 AND r <= 30
     */
    hashmap.put("startNum", startNum);
    hashmap.put("endNum", endNum);

    List<StudyListVO> list = studyListDAO.search_list3(hashmap);
    
    Iterator<StudyListVO> iter = list.iterator();    
    while (iter.hasNext()) {
      StudyListVO StudyListVO = iter.next();
      String title = Tool.textLength(StudyListVO.getStdlist_title(), 10);
      StudyListVO.setStdlist_title(title);
    }
    
    return list;
  }

  /**
   * 1 페이지부터 시작 현재 페이지: 11 / 22 [이전] 11 12 13 14 15 16 17 18 19 20 [다음]
   *
   * @param search_count
   *          검색(전체) 레코드수
   * @param nowPage
   *          현재 페이지
   * @return 페이징 생성 문자열
   */
  public String paging(int search_count, int nowPage) {

    int totalPage = (int) (Math.ceil((double) search_count / StudyList.RECORD_PER_PAGE)); // 전체
                                                                                          // 페이지
    int totalGrp = (int) (Math.ceil((double) totalPage / StudyList.PAGE_PER_BLOCK));// 전체
                                                                                    // 그룹
    int nowGrp = (int) (Math.ceil((double) nowPage / StudyList.PAGE_PER_BLOCK)); // 현재
                                                                                 // 그룹
    int startPage = ((nowGrp - 1) * StudyList.PAGE_PER_BLOCK) + 1; // 특정 그룹의 페이지
                                                                   // 목록 시작
    int endPage = (nowGrp * StudyList.PAGE_PER_BLOCK); // 특정 그룹의 페이지 목록 종료

    StringBuffer str = new StringBuffer();

    str.append("<style type='text/css'>");
    str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}");
    str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}");
    str.append("  #paging A:hover{text-decoration:none; color:black; font-size: 1em;}");
    str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}");
    str.append("  .span_box_1{");
    str.append("    text-align: center;");
    str.append("    font-size: 1em;");
    str.append("    border: 0px;"); // str.append(" border: 1px;");
    str.append("    border-style: solid;");
    str.append("    border-color: #cccccc;");
    str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/");
    str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/");
    str.append("  }");
    str.append("  .span_box_2{");
    str.append("    text-align: center;");
    str.append("    border-radius: 5px;");
    str.append("    background-color: #FECE1A;");
    str.append("    color: #666666;");
    str.append("    font-size: 1em;");
    str.append("    font-weight: bold;");
    str.append("    border: 1px;");
    str.append("    border-style: solid;");
    str.append("    border-color: #ffffff;");
    str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/");
    str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/");
    str.append("  }");
    str.append("</style>");
    str.append("<DIV id='paging'>");
    // str.append("현재 페이지: " + nowPage + " / " + totalPage + " ");

    int _nowPage = (nowGrp - 1) * StudyList.PAGE_PER_BLOCK; // 이전 페이지로 이동

    if (nowGrp >= 2) {

      str.append("<span class='span_box_1'><A onclick='search_topic(" + _nowPage + ");'>이전</A></span>");

    }

    for (int i = startPage; i <= endPage; i++) {
      if (i > totalPage) {
        break;
      }

      if (nowPage == i) {
        str.append("<span class='span_box_2'><A onclick='search_topic(" + i + ");'>" + i + "</A></span>"); // 현재
                                                                                                   // 페이지,
                                                                                                   // 강조
      } else {

        // 현재 페이지가 아닌 페이지
        str.append("<span class='span_box_1'><A onclick='search_topic(" + i + ");'>" + i + "</A></span>");
      }
    }

    _nowPage = (nowGrp * StudyList.PAGE_PER_BLOCK) + 1; // 10개 다음 페이지로 이동

    if (nowGrp < totalGrp) {

      str.append("<span class='span_box_1'><A onclick='search_topic(" + _nowPage + ");'>다음</A></span>");

    }
    str.append("</DIV>"); 

    return str.toString();
  }

  @Override
  public int search_count(HashMap hashmap) {

    return studyListDAO.search_count(hashmap);
  }

  @Override
  public int goodcnt_up(int stdlist_no) {
    
    return studyListDAO.goodcnt_up(stdlist_no);
  }

  @Override
  public int goodcnt_down(int stdlist_no) {
    
    return studyListDAO.goodcnt_down(stdlist_no);
  }

  @Override
  public List<StudyListVO> rank_top5() {
    
    return studyListDAO.rank_top5();
  }

  @Override
  public int check_stdno(HashMap hashmap) {
    
    return studyListDAO.check_stdno(hashmap);
  }

  @Override
  public int search_leader_memberno(int stdlist_no) {
    return studyListDAO.search_leader_memberno(stdlist_no);
  }
  
}
