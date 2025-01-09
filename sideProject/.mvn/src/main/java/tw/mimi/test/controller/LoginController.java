package tw.mimi.test.controller;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import tw.mimi.test.model.Member;
import tw.mimi.test.model.Tag;
import tw.mimi.test.repository.TagRepository;
import tw.mimi.test.service.MemberService;



@Controller
public class LoginController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private TagRepository tagRepository;
	
	@RequestMapping("/register")
	public String reg(Model model) {
		Member member = new Member();
		
//		List<String> options = List.of("python","java","C#","Mysql","CSS");
		List<Tag> options = tagRepository.findAll();
		
		model.addAttribute("member",member);
		model.addAttribute("options",options);
		
//		System.out.println(options.toString());
		
		return "register";
	}
	
	
	@PostMapping("/reg_submit")
	public String regSubmit(@ModelAttribute Member member,
							@RequestParam(value = "selected",required = false)List<Long> selected,
							BindingResult result, Model model) {
		if(result.hasErrors()) {
			System.out.println(result.getAllErrors().toString());
			return "register";
		}
		
		//checkbox
		if(selected != null) {
			List<Tag> tags = tagRepository.findAllById(selected);
			member.setTags(List.copyOf(tags));
		}
		
		System.out.println(member.getAccount());
		System.out.println(member.getPassword());
		System.out.println(member.getName());
		System.out.println("selected:" + member.getTags());
		
		memberService.addMember(member);
		
		return "login";
	}
	
	@GetMapping("/login")
	public String login(Model model) {
		model.addAttribute("member", new Member());
		return "login";
	}
	
	@PostMapping("/login_submit")
	public String loginSubmit(@ModelAttribute Member member,BindingResult result, Model model, HttpSession session) {
		if(result.hasErrors()) {
			System.out.println(result.getAllErrors().toString());
			System.out.println("debug1");
			return "login";
		}
		System.out.println(member.getAccount());
		System.out.println(member.getPassword());
		
		member = memberService.loginMember(member);
		if(member == null) {
			System.out.println("debug2");
			return "login";
		}else {
			session.setAttribute("member", member);
		}
		
		model.addAttribute("member", member);
		
		return "main";
//		return "redirect:/main/home";
	}
}
