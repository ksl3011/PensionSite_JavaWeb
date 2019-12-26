package messenger;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.apache.log4j.Logger;

@ServerEndpoint("/oraimessenger")
public class MessengerSession {
	private static List<String> userIndex = Collections.synchronizedList(new ArrayList<>());
	private static List<Session> userIndex_session = Collections.synchronizedList(new ArrayList<>());
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	InetAddress ip;
	final static Logger LOG = Logger.getLogger(MessengerSession.class);
	String userIndex_str = "";
	String user_view = "";	//채팅방에 표시될 가공하기 전의 유저이름
	private static List<Session> adminSession = Collections.synchronizedList(new ArrayList<>());
	
	public MessengerSession(){
		try {
			ip = InetAddress.getLocalHost();
		} catch (UnknownHostException e) {
			LOG.error("--------------------------");
			LOG.error(e.getMessage());
			LOG.error("--------------------------");
		}
	}


	
	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		//메시지를 이름과 내용으로 분할하기 위한 작업
		String[] msg = message.split("``@send``");
		StringBuilder sb = new StringBuilder();
		for(int i=1 ; i<msg.length ; i++) sb.append(msg[i]);	//유저 이름을 제외한 내용
		String output = sb.toString();
		
		String user = msg[0];	//로그에 기록될 유저이름
		
		if(user.equals("normal_user")){	//메시지 뿌릴 때 손님이면 아이피표시, 아니면 관리자이므로 아이피제거
			user_view = "손님" + "(" + ip.getHostAddress().substring(0, 7) + ")";
		}else
			user_view = "Admin";
		
		//관리자유무확인요구
		if(user.equals("admin_exist")){
			if(output.equals("?")){
				for (Session client : clients)
					client.getBasicRemote().sendText("admin_exist::::?");
			}else if(output.equals("exist")){//관리자존재
				adminSession.add(session);
			}
			return;
		}
		
		//인덱스명령 메시지 
		if(output.equals("index")){//배열을 만들어 보여줄 유저추가
			for (Session client : clients) {
				if(client.equals(session)){
					StringBuilder sb2 = new StringBuilder();
					for(int i=0 ; i<userIndex.size() ; i++){
						if(!userIndex.get(i).equals(userIndex_str)){//본일아닐떄
							if(adminSession.size() != 0 && userIndex_session.get(i).equals(adminSession.get(0))){//관리자일때
								sb2.append("ADMIN");		
							}else{
								sb2.append(userIndex.get(i).toString());
							}
						}else{//본인
							if(adminSession.size() != 0 && adminSession.get(0).equals(session)){
								sb2.append("ADMIN");
							}else{
								sb2.append(userIndex.get(i).toString() + "(me)");
							}
						}
						if(i != userIndex.size()-1) sb2.append("::");
					}
					client.getBasicRemote().sendText("indexin::::" + sb2.toString());
				}
			}
			return;
		}
		
		//일반메시지
		synchronized (clients) {
			for (Session client : clients) {
				LOG.debug(user + "(" + ip.getHostAddress() + ")" + " :::: " + output);
				//로그에 기록할 땐 full 아이피 표시				
				if(!client.equals(session)){//전체에 뿌리는 메시지
					client.getBasicRemote().sendText(user_view + "::::" + output);
				}else{//보낸사람일 경우
					if(!user.equals("normal_user")){
						client.getBasicRemote().sendText("Admin::::" + output);
					}else
						client.getBasicRemote().sendText("나(" + ip.getHostAddress().substring(0, 7) + ")" + "::::" + output);
				}
			}
		}
	}

	@OnOpen
	public void onOpen(Session session) {
		//접속시 파라미터의 세션은 접속한사람 세션으로 인식하고
		//clients라는 세션저장컬렉션에 접속자세션저장
		
		//System.out.println(session + "(" + ip.getHostAddress() +")");	//유저 접속시 나오는 텍스트
		LOG.debug("Connection : " + session + "(" + ip.getHostAddress() + ")");
		clients.add(session);
		userIndex_str = "user" + session.getId().toString() + "(" + ip.getHostAddress().substring(0, 7) + ")";
		userIndex.add(userIndex_str);
		userIndex_session.add(session);
		userIndex_str = "user" + session.getId().toString() + "(" + ip.getHostAddress().substring(0, 7) + ")";		
	}

	@OnClose
	public void onClose(Session session) {
		// Remove session from the connected sessions set
		for(int i=0 ; i<userIndex.size() ; i++){
			if( userIndex.get(i).contains(session.getId().toString()) ){
				userIndex.remove(i);
				userIndex_session.remove(i);
				return;
			}
		}
		LOG.debug("User exit : " + session);
		clients.remove(session);
	}
	
	@OnError
	public void onError(Throwable e, Session session){
		LOG.error(e.getMessage() + "\nuser :" +session);
	}
	
	
}