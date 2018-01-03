package dev.mvc.test;

import nation.web.tool.Tool;

public class Transfer_Tag {
  public static void main(String[] args) {
    String str="봄\n여름\n가을\n겨울";
    System.out.println(str);
    
    System.out.println(Tool.convertChar3(str)); 
    
  }
}
