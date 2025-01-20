package tw.platform.sideProject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;
import tw.platform.sideProject.model.Keywords;
import tw.platform.sideProject.model.mimiMember;
import tw.platform.sideProject.model.yuOrder;
import tw.platform.sideProject.service.KeywordService;
import tw.platform.sideProject.service.OrderService;

@Controller
public class HomeController {

	@Autowired
	private KeywordService keywordService;

	@Autowired
	private OrderService orderService;

	@GetMapping("/index")
	public String index(Model model, HttpSession session) {
		if (session.getAttribute("member") != null) {
			mimiMember member = (mimiMember) session.getAttribute("member");
			System.out.println("index目前登入狀態:" + member.getName() + "%n");
			model.addAttribute("member", member);
		} else {
			System.out.println("目前無登入紀錄");
		}
		List<Keywords> list = keywordService.getKeywordDesc();
		model.addAttribute("kw", list);
		return "index";
	}

//原本的
	@GetMapping("/search")
	public String search(Model model, HttpSession session) {
		System.out.println("進入搜尋");
		//判斷是否有登入狀態
		if (session.getAttribute("member") != null) {
			mimiMember member = (mimiMember) session.getAttribute("member");
			System.out.println("index目前登入狀態:" + member.getName() + "%n");
			model.addAttribute("member", member);
		} else {
			System.out.println("indexXX");
		}
		
		//隨機關鍵字
		List<Keywords> kwlist = keywordService.getKeywordDesc();
		model.addAttribute("kw", kwlist);
		
		//從session拿取搜尋邏輯的結果
		@SuppressWarnings("unchecked")
		List<yuOrder> keywordCase = (List<yuOrder>) session.getAttribute("keywordCase");
		if (keywordCase != null) {
			System.out.println("test :"+keywordCase);
			model.addAttribute("keywordCase", keywordCase);
		}else {
			System.out.println("注入失敗");
		}
		return "search";
	}

}
