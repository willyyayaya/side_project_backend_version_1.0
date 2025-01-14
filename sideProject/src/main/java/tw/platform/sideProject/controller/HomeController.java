package tw.platform.sideProject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;
import tw.platform.sideProject.model.Keywords;
import tw.platform.sideProject.model.Member;
import tw.platform.sideProject.service.KeywordService;

@Controller
public class HomeController {

	@Autowired
	private KeywordService keywordService;
	
	@GetMapping("/index")
	public String index(Model model, HttpSession session) {
		if (session.getAttribute("member") != null) {
			Member member = (Member) session.getAttribute("member");
			System.out.println("index目前登入狀態:" + member.getName() + "%n");
			model.addAttribute("member", member);
		} else {
			System.out.println("indexXX");
		}
		List<Keywords> list = keywordService.getKeywordDesc();
		for(Keywords keywords : list) {
			System.out.println(keywords.getKeyword());
		}
		model.addAttribute("kw",list);
		return "index";
	}

	@GetMapping("/search")
	public String search(Model model, HttpSession session) {
		if (session.getAttribute("member") != null) {
			Member member = (Member) session.getAttribute("member");
			System.out.println("index目前登入狀態:" + member.getName() + "%n");
			model.addAttribute("member", member);
		} else {
			System.out.println("indexXX");
		}
		List<Keywords> list = keywordService.getKeywordDesc();
		for(Keywords keywords : list) {
			System.out.println(keywords.getKeyword());
		}
		model.addAttribute("kw",list);
		return "search";
	}
	
}
