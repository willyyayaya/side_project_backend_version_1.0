package tw.platform.sideProject.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import tw.platform.sideProject.model.AddMemberRequest;
import tw.platform.sideProject.model.Member;
import tw.platform.sideProject.service.MemberService;

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
    @GetMapping("/getMemberByEmail")
    public Optional<Member> getMemberByEmail(String email) {
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

}
