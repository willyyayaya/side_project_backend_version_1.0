package tw.platform.sideProject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;
import tw.platform.sideProject.model.Keywords;
import tw.platform.sideProject.model.mimiMember;
import tw.platform.sideProject.model.yuMember;
import tw.platform.sideProject.model.yuOrder;
import tw.platform.sideProject.service.KeywordService;
import tw.platform.sideProject.service.MemberService;
import tw.platform.sideProject.service.OrderService;

@Controller
public class HomeController {

	@Autowired
	private KeywordService keywordService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private MemberService memberService;

	@GetMapping("/index")
	public String index(Model model, HttpSession session) {
		if (session.getAttribute("member") != null) {
			mimiMember member = (mimiMember) session.getAttribute("member");
			System.out.println("index目前登入狀態:" + member.getName());
			model.addAttribute("member", member);
		} else {
			System.out.println("目前無登入紀錄");
		}
		// 抓取隨機會員資料
		List<yuMember> ranMembers = memberService.getRandomYuMembers();
		for (yuMember member : ranMembers) {
			if (member.getPicurl() == null || member.getPicurl() == "") {
				member.setPicurl(
						"https://fastly.picsum.photos/id/490/200/200.jpg?hmac=7WZhaN9NS8sb08YmpHre_3NGnVUsmH8X5W_GlG2Mry4");
			}
			System.out.println(member.getPicurl());
		}
		model.addAttribute("ranMembers", ranMembers);
		// 抓取隨機專案
		List<yuOrder> ranOrders = orderService.getRandomYuOrders();
		for (yuOrder order : ranOrders) {
			order.setPicurl("https://example.com/path/to/image.jpg");
			System.out.println(order.getPicurl());
		}
		model.addAttribute("keywordCase", ranOrders);
		// 抓取隨機關鍵字
		List<Keywords> list = keywordService.getKeywordDesc();
		model.addAttribute("kw", list);

		return "index";
	}

//原本的
	@GetMapping("/search")
	public String search(Model model, HttpSession session) {
		System.out.println("進入搜尋");
		// 判斷是否有登入狀態
		if (session.getAttribute("member") != null) {
			mimiMember member = (mimiMember) session.getAttribute("member");
			System.out.println("index目前登入狀態:" + member.getName());
			model.addAttribute("member", member);
		} else {
			System.out.println("indexXX");
		}

		// 隨機關鍵字
		List<Keywords> kwlist = keywordService.getKeywordDesc();
		model.addAttribute("kw", kwlist);

		// 從session拿取搜尋邏輯的結果
		@SuppressWarnings("unchecked")
		List<yuOrder> keywordCase = (List<yuOrder>) session.getAttribute("keywordCase");
		if (keywordCase != null) {
			System.out.println("test :" + keywordCase);
			for (yuOrder order : keywordCase) {
				// 如果訂單沒圖片，加入圖片
				if (order.getPicurl() == null) {
					order.setPicurl(
							"https://fastly.picsum.photos/id/955/200/200.jpg?hmac=_m3ln1pswsR9s9hWuWrwY_O6N4wizKmukfhvyaTrkjE");
				}
//				System.out.println(order.getPicurl());
			}
			model.addAttribute("keywordCase", keywordCase);
		} else {
			System.out.println("注入失敗");
		}
		return "search";
	}

	// 找case進入
	@GetMapping("/searchCase")
	public String searchCase(Model model, HttpSession session) {
		System.out.println("進入搜尋");
		// 判斷是否有登入狀態
		if (session.getAttribute("member") != null) {
			mimiMember member = (mimiMember) session.getAttribute("member");
			System.out.println("index目前登入狀態:" + member.getName());
			model.addAttribute("member", member);
		} else {
			System.out.println("indexXX");
		}

		// 隨機關鍵字
		List<Keywords> kwlist = keywordService.getKeywordDesc();
		model.addAttribute("kw", kwlist);

		// 抓取隨機專案
		List<yuOrder> ranOrders = orderService.getRandomYuOrders();
		for (yuOrder order : ranOrders) {
			if (order.getPicurl() == null) {
				order.setPicurl(
						"https://fastly.picsum.photos/id/955/200/200.jpg?hmac=_m3ln1pswsR9s9hWuWrwY_O6N4wizKmukfhvyaTrkjE");
			}
			System.out.println(order.getPicurl());
		}
		model.addAttribute("keywordCase", ranOrders);

		return "search";
	}

}
