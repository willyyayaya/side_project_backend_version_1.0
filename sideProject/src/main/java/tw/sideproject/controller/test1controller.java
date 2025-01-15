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
    @GetMapping("/test1/{id}")
    public String getMember(@PathVariable("id") Long id, Model model) {
        Optional<Member> memberOpt = memberRepository.findById(id);
        if (memberOpt.isPresent()) {
            Member member = memberOpt.get();
            String base64Image = "";
            if (member.getPic() != null) {
                base64Image = "data:image/png;base64," + Base64.getEncoder().encodeToString(member.getPic());
            }
            model.addAttribute("base64Image", base64Image);
            model.addAttribute("member", member);
        } else {
            model.addAttribute("error", "Member not found");
        }
        return "test1";
    }

    @PostMapping("/test1/{id}/update")
    public String updateMember(@PathVariable("id") Long id,
    											@ModelAttribute Member member,  // 使用 @ModelAttribute 绑定表单数据到 Member 对象
    											@RequestParam(value = "picurl", required = false) MultipartFile picurl, 
    												Model model) {

        // 查找数据库中现有的会员数据
        Optional<Member> memberOpt = memberRepository.findById(id);
        if (memberOpt.isPresent()) {
            Member existMember = memberOpt.get();

            // 更新其他字段
            existMember.setAccount(member.getAccount());
            // 从表单传入的数据更新现有会员的属性
            existMember.setEmail(member.getEmail());
            existMember.setPassword(member.getPassword());
            existMember.setTel(member.getTel());
            existMember.setBirthday(member.getBirthday());
            existMember.setMemberinfo(member.getMemberinfo());
            
            
            // 检查更新数据的内容
            System.out.println("Updating member: " + existMember);  // 查看数据
            memberRepository.save(existMember);  // 更新数据库中的会员数据

            // 处理图片上传
            if (picurl != null && !picurl.isEmpty()) {
                try {
                    byte[] imageBytes = picurl.getBytes();
                    existMember.setPic(imageBytes);  // 假设 Member 类中有 pic 属性用来存储图片
                } catch (IOException e) {
                    e.printStackTrace();
                    model.addAttribute("error", "图片上传失败");
                    return "test1";
                }
            }

            // 更新数据库中的会员数据
            memberRepository.save(existMember);

            // 将更新后的数据添加到 model 中，以便返回到前端
            model.addAttribute("member", existMember);
         // 处理图片预览，返回 Base64 编码
            String base64Image = "data:image/png;base64," + Base64.getEncoder().encodeToString(existMember.getPic());
            model.addAttribute("base64Image", base64Image);
            return "test1";  // 返回更新后的页面
        } else {
            model.addAttribute("error", "会员资料更新失败");
            return "test1";
        }
    }
    
//    @PostMapping("/test1/{id}/updateIcon")
    
    
}
