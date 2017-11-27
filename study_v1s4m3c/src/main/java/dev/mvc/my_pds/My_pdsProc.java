package dev.mvc.my_pds;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import dev.mvc.my_std_catelist.My_std_catelistVO;

@Component("dev.mvc.my_pds.My_pdsProc")
public class My_pdsProc implements My_pdsProcInter{

  @Autowired
  @Qualifier("dev.mvc.my_pds.My_pdsDAO")
  private My_pdsDAOInter my_pdsDAO;
  
  @Override
  public int insert(My_pdsVO my_pdsVO) {
    return my_pdsDAO.insert(my_pdsVO);
  }

  @Override
  public List<My_pdsVO> list(HashMap<String, Integer> hashMap) {
    return my_pdsDAO.list(hashMap);
  }

  @Override
  public My_std_catelistVO search_mylistno(HashMap<String, Integer> hashMap) {
    return my_pdsDAO.search_mylistno(hashMap);
  }

  @Override
  public My_std_catelistVO search_cateno_stdlist_no(int mylistno) {
    return my_pdsDAO.search_cateno_stdlist_no(mylistno);
  }

  @Override
  public String search_memname(int memberno) {
    return my_pdsDAO.search_memname(memberno);
  }

  @Override
  public My_pdsVO read(int pdsno) {
    return my_pdsDAO.read(pdsno);
  }

  @Override
  public int update(My_pdsVO my_pdsVO) {
    return my_pdsDAO.update(my_pdsVO);
  }

  @Override
  public int check_passwd(HashMap<String, Object> hashMap) {
    return my_pdsDAO.check_passwd(hashMap);
  }

  @Override
  public int delete(int pdsno) {
    return my_pdsDAO.delete(pdsno);
  }

  @Override
  public int inc_cnt(int pdsno) {
    return my_pdsDAO.inc_cnt(pdsno);
  }
 
  @Override
  public int inc_like(int pdsno) {
    return my_pdsDAO.inc_like(pdsno);
  }

  @Override
  public int lastest_pdsno() {
    return my_pdsDAO.lastest_pdsno();
  }

  @Override
  public int del_file(int pdsno) {
    return my_pdsDAO.del_file(pdsno);
  }
}
