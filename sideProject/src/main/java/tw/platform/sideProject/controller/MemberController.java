package tw.platform.sideProject.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;
import tw.platform.sideProject.model.AddMemberRequest;
import tw.platform.sideProject.model.Member;
import tw.platform.sideProject.repository.MemberRepository;
import tw.platform.sideProject.service.MemberService;

// Controller 只處理當 request 來用 response 回應 => 再給 Service 處理邏輯 => 再給 Repository 與資料庫溝通，存取物件
@RestController
@RequestMapping("/api/members")
@CrossOrigin(origins = "*") // 避免 CORS 問題
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private MemberRepository memberRepository;

	// 新增會員
	@PostMapping("/addMember")
	public String addMember(@RequestBody AddMemberRequest request) {
		return memberService.addMember(request);
	}

	// 顯示所有會員
	@GetMapping("/getAllMembers")
	public List<Member> getAllMembers() {
		System.out.println("觸發");
		return memberService.getAllMembers();
	}

	// 根據 Email 查詢會員
	@GetMapping("/getMemberByEmail/{email}")
	public Optional<Member> getMemberByEmail(@PathVariable String email) {
		return memberService.getMemberByEmail(email);
	}

	// 根據 ID 更新會員資料
	@PutMapping("/updateMember/{memberId}")
	public Member updateMember(@PathVariable Long memberId, @RequestBody Member memberDetails) {
		return memberService.updateMember(memberId, memberDetails);
	}

	// 根據 ID 更新會員的標籤
	@PutMapping("/updateMemberTag/{memberId}")
	public String updateMemberTag(@PathVariable Long memberId, @RequestBody List<Integer> tagIds) {
		return memberService.updateMemberTags(memberId, tagIds);
	}

	// 根據 ID 刪除會員
	@DeleteMapping("/deleteMember/{memberId}")
	public String deleteMember(@PathVariable Long memberId) {
		memberService.deleteMember(memberId);
		return "會員已成功刪除";
	}

	// --------------抓取會員資料部分--------------------

	// 从数据库获取数据并将其传递给模板
	// 处理会员主页和更新会员信息时，加入类型判断
//	@GetMapping("/memberHome")
//	public String showMemberHomePage(HttpSession session, Model model) {
//		System.out.println("思宇後端");
//	    // 从 session 获取会员对象
//	    Object sessionMemberObject = session.getAttribute("member");
//	    
//	    if (sessionMemberObject instanceof Member) {
//	        Member sessionMember = (Member) sessionMemberObject;
//	        model.addAttribute("member", sessionMember);
//	     // 在用戶登入後，將 Member 物件存入 session
//	        session.setAttribute("member", sessionMemberObject);
//
//	        return "memberHome";  // 返回视图
//	    } else {
//	        // 如果 session 中的对象不是 Member 类型，可能是 mimiMember 类型，进行错误处理
//	        return "redirect:/login";  // 重定向到登录页面，表示未登录或类型错误
//	    }
//	}
//
//	@Transactional
//	@PostMapping("/memberHome/{memberid}/update")
//	public String updateMember(@PathVariable("memberid") Long memberid,
//	                           @RequestParam(value = "picurl", required = false) String picurl,
//	                           @ModelAttribute Member member,
//	                           HttpSession session, Model model) throws IOException {
//	    
//	    System.out.println("Received picurl: " + picurl); // Debugging
//	    
//	 // 查找数据库中的会员数据
//        Optional<Member> memberOpt = memberRepository.findById(memberid);
//        if (memberOpt.isPresent()) {
//            Member existMember = memberOpt.get();
//            Object sessionMemberObject = session.getAttribute("member");
//            // 更新其他字段（检查是否为空，如果不为空才进行更新）
//            if (member.getAccount() != null && !member.getAccount().isEmpty()) {
//                existMember.setAccount(member.getAccount());
//            }
//            if (member.getEmail() != null && !member.getEmail().isEmpty()) {
//                existMember.setEmail(member.getEmail());
//            }
//            if (member.getPassword() != null && !member.getPassword().isEmpty()) {
//                existMember.setPassword(member.getPassword());
//            }
//            if (member.getTel() != null && !member.getTel().isEmpty()) {
//                existMember.setTel(member.getTel());
//            }
//            
//            if (member.getGithub() != null && !member.getGithub().isEmpty()) {
//                existMember.setGithub(member.getGithub());
//            }
//            
//            if (member.getBirthday() != null) {
//                existMember.setBirthday(member.getBirthday());
//            }
//            if (member.getIntro() != null && !member.getIntro().isEmpty()) {
//                existMember.setIntro(member.getIntro());
//            }
//
//            // 处理图片上传（已直接传递 Base64 字符串）
//            if (picurl != null && !picurl.isEmpty()) {
//                // 直接将 Base64 字符串赋值给 picurl 字段
//                existMember.setPicurl(picurl);
//            }
//
//            // 更新数据库中的会员数据
//            memberRepository.save(existMember);
//
//            // 将更新后的数据添加到 model 中，以便返回到前端
//            model.addAttribute("member", existMember);
//            session.setAttribute("member", sessionMemberObject);
//            System.out.println(sessionMemberObject);
//            // 返回更新后的页面
//            return "memberHome";  // 返回更新后的页面
//        } else {
//            // 如果找不到该会员，则返回错误信息
//            model.addAttribute("error", "会员资料更新失败");
//            return "memberHome";  // 返回错误页面
//        }
//    }
//	@PostMapping("/memberHome/{memberid}/update")
//    public String updateMember(@PathVariable("memberid") Long memberid,
//                               @ModelAttribute Member member,  
//                               @RequestParam(value = "picurl", required = false) String picurl, 
//                               Model model) throws IOException {
//
//        // 查找数据库中的会员数据
//        Optional<Member> memberOpt = memberRepository.findById(memberid);
//        if (memberOpt.isPresent()) {
//            Member existMember = memberOpt.get();
//
//            // 更新其他字段（检查是否为空，如果不为空才进行更新）
//            if (member.getAccount() != null && !member.getAccount().isEmpty()) {
//                existMember.setAccount(member.getAccount());
//            }
//            if (member.getEmail() != null && !member.getEmail().isEmpty()) {
//                existMember.setEmail(member.getEmail());
//            }
//            if (member.getPassword() != null && !member.getPassword().isEmpty()) {
//                existMember.setPassword(member.getPassword());
//            }
//            if (member.getTel() != null && !member.getTel().isEmpty()) {
//                existMember.setTel(member.getTel());
//            }
//            
//            if (member.getGithub() != null && !member.getGithub().isEmpty()) {
//                existMember.setGithub(member.getGithub());
//            }
//            
//            if (member.getBirthday() != null) {
//                existMember.setBirthday(member.getBirthday());
//            }
//            if (member.getIntro() != null && !member.getIntro().isEmpty()) {
//                existMember.setIntro(member.getIntro());
//            }
//
//            // 处理图片上传（已直接传递 Base64 字符串）
//            if (picurl != null && !picurl.isEmpty()) {
//                // 直接将 Base64 字符串赋值给 picurl 字段
//                existMember.setPicurl(picurl);
//            }
//
//            // 更新数据库中的会员数据
//            memberRepository.save(existMember);
//
//            // 将更新后的数据添加到 model 中，以便返回到前端
//            model.addAttribute("member", existMember);
//
//            // 返回更新后的页面
//            return "memberHome";  // 返回更新后的页面
//        } else {
//            // 如果找不到该会员，则返回错误信息
//            model.addAttribute("error", "会员资料更新失败");
//            return "memberHome";  // 返回错误页面
//        }
//    }

}
