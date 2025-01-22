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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
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
	public String showSendMessage(Model model) { 
		model.addAttribute("message", new Message()); // 添加空的Message對象到模型 	
		return "send"; // 返回表單模板名稱 
		}
	
//寄出信件
	@PostMapping("/send_submit")
	public String sendMesg(@ModelAttribute("message") @Valid Message message,
	                       BindingResult result, Model model, HttpSession session) {
	    // 檢查是否有驗證錯誤
	    if (result.hasErrors()) {
	        // 返回錯誤頁面，並將錯誤訊息顯示在前端
	        return "send"; // 這裡是返回表單頁面，會顯示錯誤訊息
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
	            .orElse(null); // 如果找不到，返回 null

	    if (receiver == null) {
	        model.addAttribute("errorMessage", "此信箱不存在");
	        return "send"; // 返回發送訊息頁面，顯示錯誤訊息
	    }

	    // 設置發件人和收件人
	    message.setSenderid(sender);
	    message.setReceiverid(receiver);
	    System.out.println("Receiver ID: " + message.getReceiverid().getMemberid());
	    System.out.println("Title: " + message.getTitle());

	    // 儲存訊息
	    messageService.addMesg(message);
	    model.addAttribute("success", "Message sent successfully!");

	    // 成功後重定向到訊息頁面
	    return "redirect:/message/" + sender.getMemberid();
	}

    
    
 //可以順利抓到資料
    @GetMapping("/message/{receiverid}")
    public String getMessages(@PathVariable Long receiverid, Model model) {
        List<Message> messages = messageService.getMessagesByReceiverid(receiverid);
        Long memberid = memberService.getMemberid(receiverid);// 將 memberid 傳遞給模板（這裡是傳遞成員資料，而不是訊息列表）
        
     // 按 createdAt 时间排序，最新的在最上面
        List<Message> sortedMessages = messages.stream()
        		.sorted(Comparator.comparing(Message::getCreatedat).reversed())
        		.collect(Collectors.toList());
    
     // 0未讀1已讀轉換為對應的文字
        sortedMessages.forEach(message -> {
            message.setIsreadText(message.isIsread() ? "已讀" : "未讀");
        });    
        
        model.addAttribute("memberid", memberid);
        model.addAttribute("messages", sortedMessages); // 將訊息列表加入
        return "message";
//        return "redirect:/message/" + memberid;
    }
    
    
//讀取信件   
    @GetMapping("/message/read/{messageId}")
    public String getMessageDetail(@PathVariable Long messageId, Model model) {
        Message message = messageService.getMessageById(messageId);
        if (message != null) {
            System.out.println("Receiver ID: " + message.getReceiverid());  // 確認這裡是否獲得正確的 receiverId
            message.setIsread(true);  // 標記為已讀
            messageService.updateMessage(message);  // 更新資料庫
        }

        model.addAttribute("message", message);  // 顯示訊息詳細內容
        model.addAttribute("receiverId", message.getReceiverid());  // 傳遞 receiverId 到模板
        return "read";  // 返回顯示詳細內容的頁面
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
    
// 根據messageid刪除信件
    @DeleteMapping("/deleteMessage/{messageId}")
    @ResponseBody
    public ResponseEntity<Map<String, String>> deleteMessage(@ModelAttribute("message") Message message,@PathVariable Long messageId) {
        System.out.println("messageid:" + messageId);  	
    	// 刪除信件
        messageService.deleteMessage(messageId);
        Map<String, String> response = new HashMap<>();
        response.put("message", "信件已成功刪除");

        return ResponseEntity.ok(response);
    }
//回信功能    
    @GetMapping("/message/reply/{messageId}")
    public String replyMessage(@PathVariable("messageId") Long messageId, Model model, HttpSession session) {
        mimiMember sender = (mimiMember) session.getAttribute("member");
        if (sender == null) {
            return "redirect:/login"; // 如果發件人未登入，重定向到登入頁面
        }
        
        // 根據 messageId 查找 A 信件
        Message message;
        try {
            message = messageService.findByMessageId(messageId); // 根據 messageId 查找訊息
        } catch (Exception e) {
            // 捕捉異常並輸出詳細的錯誤訊息
            model.addAttribute("errorMessage", "找不到該訊息或發生錯誤");
            e.printStackTrace();  // 這裡打印堆棧跟蹤
            return "read"; // 返回錯誤頁面
        }
        
        if (message == null) {
            model.addAttribute("errorMessage", "訊息不存在");
            return "read"; // 返回錯誤頁面
        }

        // 獲取 A 信件的發件人 email
        String senderEmail = messageService.getSenderEmailById(messageId); // 獲取 sender email
        model.addAttribute("senderEmail", senderEmail); // 將 senderEmail 傳遞到前端

        // 設置回覆訊息
        Message replyMessage = new Message();
        replyMessage.setReceiverid(message.getSenderid()); // 將 A 信件的發件人設置為回信的 receiver
        replyMessage.setTitle("Re: " + message.getTitle()); // 加上 "Re:" 前綴
        replyMessage.setContent("Re:" + message.getContent() + "\n" + sender.getName() + ">>>");
        model.addAttribute("message", replyMessage); // 傳遞回覆的訊息到表單
        return "reply"; // 返回回覆表單模板
    }
	
//回信	
	@PostMapping("/reply_submit")
	public String replyMesg(@ModelAttribute("message") Message message,
	                        BindingResult result, Model model, HttpSession session) {
	    if (result.hasErrors()) { 
	        return "reply"; // 返回表單頁面或錯誤頁面
	    }

	    mimiMember sender = (mimiMember) session.getAttribute("member");
	    if (sender == null) {
	        return "redirect:/login"; // 如果發件人未登入，重定向到登入頁面
	    }

	    if (message.getReceiverid() == null || message.getReceiverid().getEmail() == null) {
	        model.addAttribute("errorMessage", "無效的收件人");
	        return "reply"; // 返回發送訊息頁面，顯示錯誤訊息
	    }

	    String receiverEmail = message.getReceiverid().getEmail();
	    System.out.println("Receiver email: " + receiverEmail);
	    
	    mimiMember receiver = memberRepository.findByEmail(receiverEmail)
	                                          .orElse(null);
	    if (receiver == null) {
	        model.addAttribute("errorMessage", "此信箱不存在");
	        return "reply"; // 返回發送訊息頁面，顯示錯誤訊息
	    }

	    message.setSenderid(sender); // 設置發件人
	    message.setReceiverid(receiver); // 設置接收人

	    System.out.println("Receiver ID: " + message.getReceiverid().getMemberid());
	    System.out.println("Title: " + message.getTitle());

	    messageService.addMesg(message); // 儲存訊息
	    model.addAttribute("success", "Message sent successfully!");

	    return "redirect:/message/" + sender.getMemberid();
	}
}

	


