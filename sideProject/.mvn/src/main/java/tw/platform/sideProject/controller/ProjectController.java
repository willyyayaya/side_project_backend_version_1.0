package tw.platform.sideProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class ProjectController {

    @GetMapping("/memberProjectP1/{memberid}")
    public String getMemberProjectPage(@PathVariable Long memberid, Model model) {
        model.addAttribute("memberid", memberid); // 将 memberid 传递给前端
        return "memberProjectP1"; // 返回的是位于 static 文件夹下的 memberProjectP1.html
    }
    
    
    @GetMapping("/memberProjectP2/{memberid}")
    public String getMemberProjectPage2(@PathVariable Long memberid, Model model) {
        model.addAttribute("memberid", memberid); // 将 memberid 传递给前端
        return "memberProjectP2"; // 返回的是位于 static 文件夹下的 memberProjectP1.html
    }
    
    @GetMapping("/OrderProjectP1/{memberid}")
    public String getOrderProjectPage(@PathVariable Long memberid, Model model) {
        model.addAttribute("memberid", memberid); // 将 memberid 传递给前端
        return "OrderProjectP1"; // 返回的是位于 static 文件夹下的 memberProjectP1.html
    }
    
    
}
