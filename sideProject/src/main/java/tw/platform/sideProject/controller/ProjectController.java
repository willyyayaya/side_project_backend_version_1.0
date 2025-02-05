package tw.platform.sideProject.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import tw.platform.sideProject.model.Member;
import tw.platform.sideProject.repository.MemberRepository;

@Controller
public class ProjectController {
	@Autowired
	private MemberRepository memberRepository;

	@GetMapping("/memberHome")
	public String memberHome(HttpSession session, Model model) {
	    Member member = (Member) session.getAttribute("member");
	    if (member != null) {
	        model.addAttribute("member", member);
	    }
	    return "memberHome";
	}

	@GetMapping("/memberProjectP2/{memberid}")
	public String getMemberProjectPage2(@PathVariable Long memberid, Model model) {
		model.addAttribute("memberid", memberid); // 将 memberid 传递给前端
		return "memberProjectP2"; // 返回的是位于 static 文件夹下的 memberProjectP1.html
	}

	@GetMapping("/OrderProjectP1/{memberid}")
	public String getOrderProjectPage(@PathVariable Long memberid, Model model) {
		model.addAttribute("memberid", memberid); // 将 memberid 传递给前端
		Optional<Member> memberOpt = memberRepository.findById(memberid);
		if (memberOpt.isPresent()) {
			Member member = memberOpt.get();
			model.addAttribute("member", member);
		}
		return "OrderProjectP1"; // 返回的是位于 static 文件夹下的 memberProjectP1.html
	}

	@GetMapping("/getMembersByorderid/{orderid}")
	public String getorderByorderid(@PathVariable Long orderid, Model model) {
		model.addAttribute("orderid", orderid); // 将 memberid 传递给前端

		return "evaluate"; // 返回的是位于 static 文件夹下的 memberProjectP1.html
	}

}