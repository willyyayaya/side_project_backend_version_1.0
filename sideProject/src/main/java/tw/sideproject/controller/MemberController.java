package tw.sideproject.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import io.swagger.v3.oas.annotations.parameters.RequestBody;
import jakarta.servlet.http.HttpSession;
import tw.sideproject.model.AddMemberRequest;
import tw.sideproject.model.Member;
import tw.sideproject.repository.MemberRepository;
import tw.sideproject.service.MemberService;

// Controller 只處理當 request 來用 response 回應 => 再給 Service 處理邏輯 => 再給 Repository 與資料庫溝通，存取物件
@Controller // Use @Controller instead of @RestController
@RequestMapping("/api/members")
@CrossOrigin(origins = "*") // 避免 CORS 問題
public class MemberController {

    @Autowired
    private MemberService memberService;

    // 通过 @Autowired 注解注入 MemberRepository
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

    @GetMapping("/memberHome")
    public String getMember(HttpSession session, Model model) {
        Long memberid = 103L;  // 这里可以直接设置为 103 或其他有效的 ID

        // 将模拟的 memberid 存入 session 中
        session.setAttribute("memberid", memberid);

        // 从数据库获取该会员的资料
        Optional<Member> memberOpt = memberRepository.findById(memberid);
        if (memberOpt.isPresent()) {
            Member member = memberOpt.get();
            if (member.getPicurl() == null) {
                member.setPicurl("/LOGO.png");  // 如果没有头像，则设置默认头像
            }
            model.addAttribute("member", member);  // 将会员信息传递给前端
        } else {
            model.addAttribute("error", "Member not found");
            return "login";  // 如果会员不存在，则返回登录页
        }
        return "memberHome";  // 返回会员首页页面
    }

    @PostMapping("/memberHome/update")
    public ResponseEntity<?> updateMember(HttpSession session,
                                          @ModelAttribute Member member,
                                          @RequestParam(value = "picurl", required = false) String picurl) throws IOException {

        Long memberid = (Long) session.getAttribute("memberid");

        // 检查是否已经登录
        if (memberid == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(Collections.singletonMap("error", "用户未登录或 session 过期"));
        }

        // 获取该会员的数据
        Optional<Member> memberOpt = memberRepository.findById(memberid);
        if (memberOpt.isPresent()) {
            Member existMember = memberOpt.get();

            // 更新会员的其他字段
            if (member.getAccount() != null && !member.getAccount().isEmpty()) {
                existMember.setAccount(member.getAccount());
            }
            if (member.getEmail() != null && !member.getEmail().isEmpty()) {
                existMember.setEmail(member.getEmail());
            }
            if (member.getPassword() != null && !member.getPassword().isEmpty()) {
                existMember.setPassword(member.getPassword());
            }
            if (member.getTel() != null && !member.getTel().isEmpty()) {
                existMember.setTel(member.getTel());
            }
            if (member.getGithub() != null && !member.getGithub().isEmpty()) {
                existMember.setGithub(member.getGithub());
            }
            if (member.getBirthday() != null) {
                existMember.setBirthday(member.getBirthday());
            }
            if (member.getIntro() != null && !member.getIntro().isEmpty()) {
                existMember.setIntro(member.getIntro());
            }

            // 如果有上传头像（picurl），更新头像
            if (picurl != null && !picurl.isEmpty()) {
                existMember.setPicurl(picurl);
            }

            // 保存更新后的会员数据到数据库
            memberRepository.save(existMember);
            return ResponseEntity.ok(Collections.singletonMap("message", "会员资料更新成功"));
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(Collections.singletonMap("error", "会员资料更新失败"));
        }
    }

}
