package dev.mvc.test;

import nation.web.tool.Tool;

public class Transfer_Tag {
  public static void main(String[] args) {
    String str="��\n����\n����\n�ܿ�";
    System.out.println(str);
    
    System.out.println(Tool.convertChar3(str)); 
    
  }
}
