package tw.sideproject.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Base64;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import tw.sideproject.model.Member;
import tw.sideproject.repository.MemberRepository;

@Controller
public class test1controller {

    @Autowired
    private MemberRepository memberRepository;

    // --------------抓取會員資料部分--------------------
 // 從資料庫獲取資料並將其傳遞給模板
    @GetMapping("/memberHome/{memberid}")
    public String getMember(@PathVariable("memberid") Long memberid, Model model) {
        Optional<Member> memberOpt = memberRepository.findById(memberid);
        if (memberOpt.isPresent()) {
            Member member = memberOpt.get();
            //System.out.println("Picurl from DB: " + member.getPicurl());
           // System.out.println("Picurl: " + member.getPicurl());  // 確保這裡能顯示出 picurl

            model.addAttribute("member", member);
        } else {
            model.addAttribute("error", "Member not found");
        }
        return "memberHome";
    }


    @PostMapping("/memberHome/{memberid}/update")
    public String updateMember(@PathVariable("memberid") Long memberid,
                               @ModelAttribute Member member,  
                               @RequestParam(value = "picurl", required = false) String picurl, 
                               Model model) throws IOException {

        // 查找数据库中的会员数据
        Optional<Member> memberOpt = memberRepository.findById(memberid);
        if (memberOpt.isPresent()) {
            Member existMember = memberOpt.get();

            // 打印调试信息，确认表单数据是否传递正确
          //  System.out.println("收到的会员数据：" + member);
            //System.out.println("原始的图片字段：" + existMember.getPicurl());

            // 更新其他字段（检查是否为空，如果不为空才进行更新）
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
            if (member.getBirthday() != null) {
                existMember.setBirthday(member.getBirthday());
            }
            if (member.getMemberinfo() != null && !member.getMemberinfo().isEmpty()) {
                existMember.setMemberinfo(member.getMemberinfo());
            }

            // 处理图片上传（已直接传递 Base64 字符串）
            if (picurl != null && !picurl.isEmpty()) {
                // 直接将 Base64 字符串赋值给 picurl 字段
                existMember.setPicurl(picurl);
                //System.out.println("更新后的图片 ：" + picurl);
            }

            // 更新数据库中的会员数据
            memberRepository.save(existMember);

            // 打印保存后的会员数据
           // System.out.println("保存后的会员数据：" + existMember.getPicurl());


            // 将更新后的数据添加到 model 中，以便返回到前端
            model.addAttribute("member", existMember);

            // 返回更新后的页面
            return "memberHome";  // 返回更新后的页面
        } else {
            // 如果找不到该会员，则返回错误信息
            model.addAttribute("error", "会员资料更新失败");
            return "memberHome";  // 返回错误页面
        }
    }


    
//    @PostMapping("/test1/{id}/updateIcon")
    
    
}
