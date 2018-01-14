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
   * ���͵� �׷� �Է�
   */
  @Override
  public int create(StudyListVO studyListVO) {

    return studyListDAO.create(studyListVO);
  }

  /**
   * ���͵� ����Ʈ ���
   */
  @Override
  public List<StudyListVO> list() {

    return studyListDAO.list();
  }

  /**
   * ���͵� ����Ʈ ����
   */
  @Override
  public int update(StudyListVO studyListVO) {

    return studyListDAO.update(studyListVO);
  }

  /**
   * ���͵� ����Ʈ ����
   */
  @Override
  public int delete(int stdlist_no) {

    return studyListDAO.delete(stdlist_no);
  }

  /**
   * ���͵� ����Ʈ �о���� ���͵� ����Ʈ + ȸ�� ����
   */
  @Override
  public StudyList_MemberVO read(StudyList_MemberVO studyList_memberVO) {
    return studyListDAO.read(studyList_memberVO);
  }

  /**
   * ������ �������� ���� �ο��� ����
   */
  @Override
  public int up_currnum(int stdlist_no) {

    return studyListDAO.up_currnum(stdlist_no);
  }

  /**
   * ���͵𸮽�Ʈ �� ��ȸ�� ����
   */
  @Override
  public int up_cnt(int stdlist_no) {

    return studyListDAO.up_cnt(stdlist_no);
  }

  /**
   * ���͵𸮽�Ʈ�� �� �ϳ� �о����
   */
  @Override
  public StudyListVO read_std(int stdlist_no) {

    return studyListDAO.read_std(stdlist_no);
  }

  /**
   * ���͵𸮽�Ʈ��ȣ ��������
   */
  @Override
  public int stdlist_no() {

    return studyListDAO.stdlist_no();
  }

  /**
   * üũ�ڽ��� ���� �˻�
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
     * ���������� ����� ���� ���ڵ� ��ȣ ��� ���ذ�, nowPage�� 1���� ���� 1������: nowPage = 1, (1-1) * 10
     * => 0 2������: nowPage = 2, (2-1) * 10 => 10 3������: nowPage = 3, (3-1) * 10 =>
     * 20
     */
    int beginOfPage = ((Integer) hashmap.get("nowPage") - 1) * StudyList.RECORD_PER_PAGE;
    int startNum = beginOfPage + 1; // ���� rownum/ 1������: 1/ 2������: 11
    int endNum = beginOfPage + StudyList.RECORD_PER_PAGE;
    ; // ���� rownum/ 1������: 10/ 2������: 20
    /*
     * 1������: WHERE r >= 1 AND r <= 10 2������: WHERE r >= 11 AND r <= 20 3������:
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
   * 1 ���������� ���� ���� ������: 11 / 22 [����] 11 12 13 14 15 16 17 18 19 20 [����]
   *
   * @param search_count
   *          �˻�(��ü) ���ڵ��
   * @param nowPage
   *          ���� ������
   * @return ����¡ ���� ���ڿ�
   */
  public String paging(int search_count, int nowPage) {

    int totalPage = (int) (Math.ceil((double) search_count / StudyList.RECORD_PER_PAGE)); // ��ü
                                                                                          // ������
    int totalGrp = (int) (Math.ceil((double) totalPage / StudyList.PAGE_PER_BLOCK));// ��ü
                                                                                    // �׷�
    int nowGrp = (int) (Math.ceil((double) nowPage / StudyList.PAGE_PER_BLOCK)); // ����
                                                                                 // �׷�
    int startPage = ((nowGrp - 1) * StudyList.PAGE_PER_BLOCK) + 1; // Ư�� �׷��� ������
                                                                   // ��� ����
    int endPage = (nowGrp * StudyList.PAGE_PER_BLOCK); // Ư�� �׷��� ������ ��� ����

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
    str.append("    padding:1px 6px 1px 6px; /*��, ������, �Ʒ�, ����*/");
    str.append("    margin:1px 2px 1px 2px; /*��, ������, �Ʒ�, ����*/");
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
    str.append("    padding:1px 6px 1px 6px; /*��, ������, �Ʒ�, ����*/");
    str.append("    margin:1px 2px 1px 2px; /*��, ������, �Ʒ�, ����*/");
    str.append("  }");
    str.append("</style>");
    str.append("<DIV id='paging'>");
    // str.append("���� ������: " + nowPage + " / " + totalPage + " ");

    int _nowPage = (nowGrp - 1) * StudyList.PAGE_PER_BLOCK; // ���� �������� �̵�

    if (nowGrp >= 2) {

      str.append("<span class='span_box_1'><A onclick='search_topic(" + _nowPage + ");'>����</A></span>");

    }

    for (int i = startPage; i <= endPage; i++) {
      if (i > totalPage) {
        break;
      }

      if (nowPage == i) {
        str.append("<span class='span_box_2'><A onclick='search_topic(" + i + ");'>" + i + "</A></span>"); // ����
                                                                                                   // ������,
                                                                                                   // ����
      } else {

        // ���� �������� �ƴ� ������
        str.append("<span class='span_box_1'><A onclick='search_topic(" + i + ");'>" + i + "</A></span>");
      }
    }

    _nowPage = (nowGrp * StudyList.PAGE_PER_BLOCK) + 1; // 10�� ���� �������� �̵�

    if (nowGrp < totalGrp) {

      str.append("<span class='span_box_1'><A onclick='search_topic(" + _nowPage + ");'>����</A></span>");

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
