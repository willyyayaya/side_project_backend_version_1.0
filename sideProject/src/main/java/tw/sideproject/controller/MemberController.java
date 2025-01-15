package tw.sideproject.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import tw.sideproject.model.AddMemberRequest;
import tw.sideproject.model.Member;
import tw.sideproject.repository.MemberRepository;
import tw.sideproject.service.MemberService;

// Controller 只處理當 request 來用 response 回應 => 再給 Service 處理邏輯 => 再給 Repository 與資料庫溝通，存取物件
@RestController
@RequestMapping("/api/members")
@CrossOrigin(origins = "*") // 避免 CORS 問題
public class MemberController {

	@Autowired
    private MemberService memberService;

    // 新增會員
    @PostMapping("/addMember")
    public String addMember(@RequestBody AddMemberRequest request) {
        return memberService.addMember(request);
    }
    
    // 顯示所有會員
    @GetMapping("/getAllMembers")
    public List<Member> getAllMembers() {
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

//    ----------------抓資料---------------------------------------------
   
    @Autowired
    private MemberRepository memberRepository;
    
    
//    @GetMapping("/p1/memberHome/{memberid}")
//    public String getUsers(Model model) {
//    	List<Member> members = memberRepository.findAll(); // 假設從資料庫中獲取所有會員資料
//        model.addAttribute("members"+ members.get(1)); // 傳遞給 Thymeleaf
//        return "p1/memberHome"; // 返回模板名稱
//    }
 // 查詢指定 id 的會員資料

    @GetMapping("p1/memberHome/{id}")
    public String getmember(@PathVariable("id") Long id, Model model) {
        // 假設這裡有一些處理邏輯，比如從資料庫獲取產品
    	
        Member member = memberService.getMemberById(id);
        
        if (member != null) {
            model.addAttribute("member", member);
        } else {
            model.addAttribute("error", "member not found");
        }

        return "memberDetails";  // 返回對應的視圖名稱
    }

    
    }
    