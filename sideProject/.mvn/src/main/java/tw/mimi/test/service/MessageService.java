package tw.mimi.test.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.mimi.test.model.Message;
import tw.mimi.test.model.mimiMember;
import tw.mimi.test.repository.MessageRepository;
import tw.mimi.test.repository.mimiMemberRepository;


@Service
public class MessageService {
	
	@Autowired
	private mimiMemberRepository memberRepository;
	@Autowired
	private MessageRepository messageRepository;

	//寄出信件
	public String addMesg(Message message) {
		//不能為空
		if(message == null) {
			throw new IllegalArgumentException("Message cannot be null");
		}
		//訊息收件人標題內容不能為空
		if(message.getReceiverid() == null || message.getTitle() == null || message.getContent() == null){
			throw new IllegalArgumentException("Message fields cannot be null");
		}
		
		messageRepository.save(message); // 直接保存完整的 message 對象
		return "寄信成功";
	}
	
	//
	public Message getMessageById(Long messageId) {
	    Optional<Message> messageOpt = messageRepository.findById(messageId);
	    if (messageOpt.isPresent()) {
	        Message message = messageOpt.get();
	        System.out.println("Receiver ID (mimiMember): " + message.getReceiverid().getMemberid());  // 假設 mimiMember 類型有 getMemberId 方法
	        return message;
	    } else {
	        System.out.println("Message not found with ID: " + messageId);
	        return null;
	    }
	}


	

	//查找某個會員顯示信件
	public List<Message> getMessagesByReceiverid(Long receiverid) { 
		return messageRepository.findByReceiverid(receiverid); 
	}
	
	//刪除信件
	public void deleteMessage(Long messageId) {
		messageRepository.deleteById(messageId);
	}
	
	
	//回信
	public String getSenderEmailById(Long messageId) {
	    // 根據 messageId 查找對應的 Message 實體
	    Optional<Message> messageOptional = messageRepository.findById(messageId);
	    if (messageOptional.isPresent()) {
	        // 返回 senderid 的 email
	        return messageOptional.get().getSenderid().getEmail();
	    }
	    return null; // 如果找不到對應的 messageId，返回 null
	}
//update	 
	public void updateMessage(Message message) {
		 messageRepository.save(message);
	}
	
	public Message findByMessageId(Long messageid) {
	       Optional<Message> message = messageRepository.findByMessageid(messageid);
	       if (message.isPresent()) {
	           return message.get();
	       } else {
	           // 可以根據需求自定義異常處理
	           throw new RuntimeException("Message not found with ID: " + messageid);
	       }
    }
}
