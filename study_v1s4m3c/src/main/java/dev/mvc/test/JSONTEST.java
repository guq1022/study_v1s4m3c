package dev.mvc.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class JSONTEST {
  public static void main(String[] args) {
    
    List<JSONObject> obj_array=new ArrayList<JSONObject>();
    
    JSONObject obj=new JSONObject();
    JSONObject obj2=new JSONObject();
    
    obj.put("first", "�ϳ�");
    obj.put("second", "��");
    
    obj2.put("third", "��");
    obj2.put("forth", "��");
    
    obj_array.add(obj);
    obj_array.add(obj2);
    
    JSONArray jsonArray=JSONArray.fromObject(obj_array);
    
    System.out.println(jsonArray);
     
    
    HashMap<String, JSONObject> hash=new HashMap<String,JSONObject>();
    
    JSONObject obj3=new JSONObject();
    JSONObject obj4=new JSONObject();
    
    obj3.put("�ϳ�", "1");
    obj3.put("��", "2");
    
    obj4.put("��", "3");
    obj4.put("��", "4");
    
    hash.put("first", obj3);
    hash.put("second", obj4);
     
    JSONArray jsonArray2=JSONArray.fromObject(hash);
    System.out.println(jsonArray2);
    
    System.out.println(jsonArray2.toString());
    //System.out.println(jsonArray.);
  }
}
