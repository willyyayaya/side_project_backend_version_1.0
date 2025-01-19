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
	public Message getMessageById(Long messageid) {
		return messageRepository.findById(messageid).orElse(null);
	}
	
	//拿到senderid的Email
	public String getEmailBySenderId(Long senderid) {
		mimiMember sender = memberRepository.findById(senderid).orElseThrow(() -> new RuntimeException("Sender not found"));
		return sender.getEmail();	
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
	public String getSenderEmailById(Long senderId) {
	     // 假設 Message 實體有 senderEmail 屬性
		Optional<Message> messageOptional = messageRepository.findById(senderId);
		if (messageOptional.isPresent()) {
			return messageOptional.get().getSenderid().getEmail();
		}
		return null; // 如果找不到 senderId，返回 null
	    }
	 
	 
	 // 處理回信
	 public boolean sendReply(String senderEmail, String messageContent) {
	     // 在這裡您可以實現回信的邏輯，例如發送郵件或儲存回信
	     // 這裡假設總是返回 true，實際應根據具體情況處理
	     return true;
	 }

	public void updateMessage(Message message) {
		 messageRepository.save(message);
	}
}
