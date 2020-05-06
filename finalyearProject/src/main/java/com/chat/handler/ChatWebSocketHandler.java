package com.chat.handler;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


public class ChatWebSocketHandler extends TextWebSocketHandler{

private static Logger logger = LoggerFactory.getLogger(ChatWebSocketHandler.class);

    private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        sessionList.add(session);
        logger.info("{} Connected", session.getId());
        
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	logger.info("Received from {} to {}", session.getId(), message.getPayload());
    	for (WebSocketSession sess : sessionList) {
    		logger.info(sess.getLocalAddress().toString() + " " + session.getRemoteAddress().toString());
    		//if (sess.getLocalAddress().equals(session.getRemoteAddress())) {
    			sess.sendMessage(new TextMessage(message.getPayload()));
    		//}
    	}
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        sessionList.remove(session);
        logger.info("{} Disconnected", session.getId());
    }

}