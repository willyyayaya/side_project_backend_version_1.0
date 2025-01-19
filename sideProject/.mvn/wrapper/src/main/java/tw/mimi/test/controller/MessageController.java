package tw.mimi.test.controller;


import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;
import tw.mimi.test.model.Message;
import tw.mimi.test.model.mimiMember;
import tw.mimi.test.repository.mimiMemberRepository;
import tw.mimi.test.service.MessageService;
import tw.mimi.test.service.mimiMemberService;


@Controller

public class MessageController {
	
	@Autowired
    private MessageService messageService;
	@Autowired
	private mimiMemberRepository memberRepository;
    @Autowired
	private mimiMemberService memberService;
	
	@GetMapping("/send") 
//	@RequestMapping("/send")
	public String showSendMessage(Model model) { 
		model.addAttribute("message", new Message()); // 添加空的Message對象到模型 	
		return "send"; // 返回表單模板名稱 
		}
	
//寄出信件
    @PostMapping("/send_submit") 
    public String sendMesg(@ModelAttribute("message") Message message,
    						BindingResult result, Model model, HttpSession session) {
    	if (result.hasErrors()) { 
    		return "send"; // 返回表單頁面或錯誤頁面 
    	}
    	
    	// 從會話中獲取發件人信息
    	mimiMember sender = (mimiMember) session.getAttribute("member");      
    	if (sender == null) { 
    		return "redirect:/login"; // 如果發件人未登入，重定向到登入頁面
    	}
    	
    	// 假設從 message.getReceiverid() 能夠獲取收件人的 email
    	String receiverEmail = message.getReceiverid().getEmail();
    	System.out.println("Receiver email: " + receiverEmail);
    	// 根據 receiver 的 email 查找會員 
    	mimiMember receiver = memberRepository.findByEmail(receiverEmail)
    			.orElse(null);// 如果找不到，返回 null
    	
    	if (receiver == null) {
            model.addAttribute("errorMessage", "此信箱不存在");
            return "send"; // 返回發送訊息頁面，顯示錯誤訊息
        }
    	
    	message.setSenderid(sender);// 設置發件人信息
    	message.setReceiverid(receiver);// 設置接收人的 memberid
    	System.out.println("Receiver ID: " + message.getReceiverid().getMemberid());
    	System.out.println("Title: " + message.getTitle());
    	
    	messageService.addMesg(message);// 儲存訊息
    	model.addAttribute("success", "Message sent successfully!");

	    return "redirect:/message/" + sender.getMemberid();
    }
    
 //使用Postman可以順利抓到資料//messages.html JS只能顯示最後一則所以另外寫了message.html
    @GetMapping("/message/{receiverid}")
    public String getMessages(@PathVariable Long receiverid, Model model) {
        List<Message> messages = messageService.getMessagesByReceiverid(receiverid);
        
     // 按 createdAt 时间排序，最新的在最上面
        List<Message> sortedMessages = messages.stream()
        		.sorted(Comparator.comparing(Message::getCreatedat).reversed())
        		.collect(Collectors.toList());
    
     // 0未讀1已讀轉換為對應的文字
        sortedMessages.forEach(message -> {
            message.setIsreadText(message.isIsread() ? "已讀" : "未讀");
        });    
        
        model.addAttribute("messages", sortedMessages); // 將訊息列表加入
        return "message";
    }
    
 // 更新已讀狀態
    @PostMapping("/message/read/{messageId}")
    public String markAsRead(@PathVariable Long messageId, Model model) {
        Message message = messageService.getMessageById(messageId);
        if (message != null) {
            message.setIsread(true);  // 標記為已讀
            messageService.updateMessage(message);  // 更新資料庫
        }
        
        model.addAttribute("message", message);  // 顯示訊息詳細內容
        return "read";  // 返回顯示詳細內容的頁面
    }   
 //讀取信件   
    @GetMapping("/message/read/{messageId}")
    public String getMessageDetail(@PathVariable Long messageId, Model model) {
        Message message = messageService.getMessageById(messageId);
        if (message != null) {
            message.setIsread(true);  // 標記為已讀
            messageService.updateMessage(message);  // 更新資料庫
        }
        
        model.addAttribute("message", message);  // 顯示訊息詳細內容
        return "read";  // 返回顯示詳細內容的頁面
    }
    
 // 根據id刪除信件//使用Postman可以順利刪除資料
    @DeleteMapping("/deleteMessage/{messageId}")
    @ResponseBody
    public ResponseEntity<String> deleteMessage(@PathVariable Long messageId) {
        // 刪除信件
        messageService.deleteMessage(messageId);
        // 返回成功響應
        return ResponseEntity.ok("信件已成功刪除");
    }


}

	


