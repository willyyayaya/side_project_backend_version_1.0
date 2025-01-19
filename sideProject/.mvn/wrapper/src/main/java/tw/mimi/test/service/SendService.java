package tw.mimi.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.mimi.test.model.Message;
import tw.mimi.test.repository.MessageRepository;
import tw.mimi.test.repository.mimiMemberRepository;

@Service
public class SendService {
	
	@Autowired
	private mimiMemberRepository memberRepository;
	@Autowired
	private MessageRepository messageRepository;
	
	public String addMesg(Message message) {
		Message mesg = new Message();
		mesg.setReceiverid(message.getReceiverid());
		mesg.setTitle(message.getTitle());
		mesg.setContent(message.getContent());
		messageRepository.save(mesg);
		return "寄信成功";
	}
	
	
}
