package dev.mvc.test;

import java.util.ArrayList;
import java.util.List;

public class test {

  public static void main(String[] args) {
    String test="<div style='text-align: center;'><img alt='' src='/study/ckstorage/images/%ED%94%84%EB%9D%BC%ED%95%984.jpg' style='width: 274px; height: 184px;' /></div>";
    
    String test2="<div style='text-align: center;'>������ �߰� �Դϴ�.<br /><img alt='' src='/study/ckstorage/images/hello1.jpg' style='width: 630px; height: 354px;' /><br />"
        + "<br />"
        +"<br />"
        +"1���� �̻ڳ׿�.<br />"
        +"<br />"
        +"2�׷���.<br />"
        +"<br />"
        +"<img alt='' src='/study/ckstorage/images/hello2.jpg' style='width: 332px; height: 152px;' /><br />"
        +"<br />"
        +"<br />"
        +"<span>3����� �ٸ��׿�.</span><br />"
        +"<br />"
        +"<span>4�׷���.</span><br />"
        +"<br />"
        +"<img alt='' src='/study/ckstorage/images/%ED%94%84%EB%9D%BC%ED%95%9823.jpg' style='width: 980px; height: 500px;' /><br />"
        +"<br />"
        +"5���⵵ �ٸ��׿�.&nbsp;<br />"
        +"<br />"
        +"6�̻ڳ׿�.</div>";
   
    
    String[] arr=test2.split("<");
    
    ArrayList<String> img_tag=new ArrayList<String>();
    ArrayList<String> span_tag=new ArrayList<String>();
    ArrayList<String> none_tag=new ArrayList<String>();
    
    for(int i=0; i<arr.length; i++){
      arr[i]="<"+arr[i];
      arr[i].replaceAll("<br />", "");
      arr[i].replaceAll("<", "");
      System.out.println(i+" = "+arr[i]);
      
      if(arr[i].startsWith("<img")){
        img_tag.add(arr[i]);
      }
      
      if(arr[i].startsWith("<span")){
        span_tag.add(arr[i]);
      }
      
      if(arr[i].startsWith("<br />")){
        arr[i].replace("<", " ");
        if(arr[i]!=""){
          none_tag.add(arr[i]);
        }
      }
    }
    
    System.out.println("===================================");
    System.out.println("\n\n");
    
    for(int i=0; i<img_tag.size(); i++){
      System.out.println("img_tag :"+img_tag.get(i));
    }
    
    System.out.println("===================================");
    System.out.println("\n\n");
    
    for(int i=0; i<span_tag.size(); i++){
      System.out.println("span_tag :"+span_tag.get(i));
    }
    
    System.out.println("===================================");
    System.out.println("\n\n");
    
    for(int i=0; i<none_tag.size(); i++){
      System.out.println("none_tag :"+none_tag.get(i));
    }
    
  }
  
  /**
   * ��� HTML �±׸� �����ϰ� ��ȯ�Ѵ�.
   * 
   * @param html
   * @throws Exception  
   */
  public String removeTag(String html) throws Exception {
    return html.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
  }
}
