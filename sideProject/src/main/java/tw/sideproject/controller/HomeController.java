
package tw.sideproject.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;
import tw.sideproject.model.Member;
import tw.sideproject.model.Order;
import tw.sideproject.service.MemberService;
import tw.sideproject.service.OrderService;


@Controller
public class HomeController {



	@Autowired
	private OrderService orderService;

	@Autowired
	private MemberService memberService;

//	@GetMapping("/index")
//	public String index(Model model, HttpSession session) {
//		System.out.println("---home---");
//		if (session.getAttribute("member") != null) {
//			Member member = (Member) session.getAttribute("member");
//			System.out.println("index目前登入狀態:" + member.getName());
//			model.addAttribute("member", member);
//		} else {
//			System.out.println("index訪客模式");
//		}
//	}
//		// 抓取隨機會員資料
//		List<Member> ranMembers = memberService.getRandomYuMembers();
//		for (Member member : ranMembers) {
//			if (member.getPicurl() == null || member.getPicurl() == "") {
//				member.setPicurl("../img/memberImg.jpg");
//				System.out.println(member.getMemberid());
//			}
//		}
//		model.addAttribute("ranMembers", ranMembers);
//		
//	
//		List<Keywords> list = keywordService.getKeywordDesc();
//		model.addAttribute("kw", list);
//
//		return "index";
//	}

	@GetMapping("/order_main/{orderId}")
	public String order_main(@PathVariable Long orderId, Model model, HttpSession session) {
		if (session.getAttribute("member") != null) {
			Member member = (Member) session.getAttribute("member");
			System.out.println("index目前登入狀態:" + member.getName() + "%n");
			model.addAttribute("member", member);
			model.addAttribute("memberId", member.getMemberid());
		} else {
			System.out.println("目前無登入紀錄");
		}

		model.addAttribute("orderId", orderId);
		return "order_main";
	}

	@GetMapping("/order_edit")
	public String order_edit(Model model, HttpSession session) {
		if (session.getAttribute("member") != null) {
			Member member = (Member) session.getAttribute("member");
			System.out.println("index目前登入狀態:" + member.getName() + "%n");
			model.addAttribute("member", member);
			model.addAttribute("memberId", member.getMemberid());
		} else {
			System.out.println("目前無登入紀錄");
		}

		return "order_edit";
	}

	@GetMapping("/order_update/{orderid}")
	public String order_update(@PathVariable Long orderid, Model model, HttpSession session) {
		if (session.getAttribute("member") != null) {
			Member member = (Member) session.getAttribute("member");
			System.out.println("index目前登入狀態:" + member.getName() + "%n");
			model.addAttribute("member", member);
			model.addAttribute("memberId", member.getMemberid());
		} else {
			System.out.println("目前無登入紀錄");
		}

		model.addAttribute("orderId", orderid);
		return "order_update";
	}

	// 搜尋鈕
	@GetMapping("/search")
	public String search(Model model, HttpSession session) {
		System.out.println("---搜尋---");
		// 判斷是否有登入狀態
		if (session.getAttribute("member") != null) {
			Member member = (Member) session.getAttribute("member");
			System.out.println("search目前登入狀態:" + member.getName());
			model.addAttribute("member", member);
		} else {
			System.out.println("search訪客模式");
		}

		// 隨機關鍵字
//		List<Keywords> kwlist = keywordService.getKeywordDesc();
//		model.addAttribute("kw", kwlist);

		// 從session拿取搜尋邏輯的結果
		@SuppressWarnings("unchecked")
		List<Order> keywordCase = (List<Order>) session.getAttribute("keywordCase");
		if (keywordCase != null) {
			System.out.println("test :" + keywordCase);
			for (Order order : keywordCase) {
				// 如果訂單沒圖片，加入圖片
				if (order.getPicurl() == null) {
					order.setPicurl("../img/caseImg.jpg");
				}
			}
			model.addAttribute("keywordCase", keywordCase);
		} else {
			System.out.println("注入失敗");
		}
		session.setAttribute("keywordCase", keywordCase);
		return "search";
	}

	// 找case進入
//	@GetMapping("/searchCase")
//	public String searchCase(Model model, HttpSession session) {
//		System.out.println("---進入searchCase---");
//		// 判斷是否有登入狀態
//		if (session.getAttribute("member") != null) {
//			Member member = (Member) session.getAttribute("member");
//			System.out.println("searchCase目前登入狀態:" + member.getName());
//			model.addAttribute("member", member);
//		} else {
//			System.out.println("searchCase訪客模式");
//		}
//
//		// 隨機關鍵字
//		List<Keywords> kwlist = keywordService.getKeywordDesc();
//		model.addAttribute("kw", kwlist);
//	}

		// 抓取隨機專案
		

//	@GetMapping("/orderShow")
//	public String orderShow(@RequestParam Long orderid, Model model) {
//		System.out.println("前端傳送的專案ID : " + orderid);
//		Optional<Order> order = orderService.getOrderById(orderid);
//		for (Order orderCheck : order) {
//			// 如果訂單沒圖片，加入圖片
//			if (orderCheck.getPicurl() == null) {
//				orderCheck.setPicurl("../img/caseImg.jpg");
//			}
//		}
//		model.addAttribute("orderShow", order);
//		return "orderShow";
//	}

	

	// --------彈窗測試項目-----------
	@GetMapping("/indexText")
	public String indexText(Model model, HttpSession session) {
		return "memberShowBtn";
	}

	

}