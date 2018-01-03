package dev.mvc.websocket;

import java.util.HashSet;
import java.util.Set;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import dev.mvc.memsearch.MemsearchProcInter;

public class SocketHandler extends TextWebSocketHandler implements InitializingBean{
  
  @Autowired
  @Qualifier("dev.mvc.memsearch.MemsearchProc")
  private MemsearchProcInter memsearchProc;
  
  private final Logger logger = LogManager.getLogger(getClass());
  private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();
  
  public SocketHandler (){
        super();
        System.out.println("create SocketHandler instance!");
        this.logger.info("create SocketHandler instance!");
  }
  
  /**
   * 클라이언트가 연결을 끊었을 때 실행되는 메소드
   */
  @Override
  public void afterConnectionClosed(WebSocketSession session,
               CloseStatus status) throws Exception {
        super.afterConnectionClosed(session, status);

        sessionSet.remove(session);
        System.out.println("remove session!");
        this.logger.info("remove session!");
  }
  
  /**
   * 클라이언트 연결 이후에 실행되는 메소드
   */
  @Override
  public void afterConnectionEstablished(WebSocketSession session)
               throws Exception {
        super.afterConnectionEstablished(session);

        sessionSet.add(session);
        System.out.println("add session!");
        this.logger.info("add session!");
  }
  
  
  /**
   * 클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행되는 메소드
   */
  @Override
  protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    // TODO Auto-generated method stub
    System.out.println(message.toString());
  }

  
  @Override
  public void handleMessage(WebSocketSession session,
               WebSocketMessage<?> message) throws Exception {
        super.handleMessage(session, message);
       
        System.out.println("receive message:"+message.toString());
        this.logger.info("receive message:"+message.toString());
  }

  /**
   * 에러가 발생했을 때 실행되는 메소드
   */
  @Override
  public void handleTransportError(WebSocketSession session,
               Throwable exception) throws Exception {
        this.logger.error("web socket error!", exception);
  }

  @Override
  public boolean supportsPartialMessages() {
        this.logger.info("call method!");
       
        return super.supportsPartialMessages();
  }
 
  /**
   * 
   * @param message
   */
  public void sendMessage (String message){
        for (WebSocketSession session: this.sessionSet){
               if (session.isOpen()){
                      try{
                            session.sendMessage(new TextMessage(message));
                      }catch (Exception ignored){
                            this.logger.error("fail to send message!", ignored);
                      }
               }
        }
  }

  @Override
  public void afterPropertiesSet() throws Exception {
 
        Thread thread = new Thread(){

               int i=0;
               @Override
               public void run() {
                      while (true){

                            try {
                                   sendMessage ("send message index "+i++);
                                   Thread.sleep(1000);
                            } catch (InterruptedException e) {
                                   e.printStackTrace();
                                   break;
                            }
                      }
               }

        };

        thread.start();
  }
  
}
