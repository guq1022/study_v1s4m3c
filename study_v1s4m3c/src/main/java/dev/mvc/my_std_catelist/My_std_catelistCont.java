package dev.mvc.my_std_catelist;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

@Controller
public class My_std_catelistCont {
  
  @Autowired
  @Qualifier("dev.mvc.my_std_catelist.My_std_catelistProc")
  private My_std_catelistProcInter catelistProc;
  
  
}
