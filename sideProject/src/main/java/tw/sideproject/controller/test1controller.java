package tw.sideproject.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import tw.sideproject.model.Member;
import tw.sideproject.repository.MemberRepository;

@Controller
public class test1controller {

    @Autowired
    private MemberRepository memberRepository;

    // --------------抓取會員資料部分--------------------
    @GetMapping("test1/{id}")
    public String getMember(@PathVariable("id") Long id, Model model) {
        Optional<Member> memberOpt = memberRepository.findById(id);
        if (memberOpt.isPresent()) {
            Member member = memberOpt.get();
            // 圖片轉換格式部分
            String base64Image = (member.getPic() != null) ? Base64.getEncoder().encodeToString(member.getPic()) : "";
            model.addAttribute("base64Image", base64Image);
            model.addAttribute("member", member);
        } else {
            model.addAttribute("error", "Member not found");
        }
        return "test1";
    }

    // --------------上傳資料部分--------------------
    @PostMapping("/test1/{id}/update")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> updateMember(@PathVariable("id") Long id,
                                                            @RequestParam(value = "account", required = false) String account,
                                                            @RequestParam(value = "email", required = false) String email,
                                                            @RequestParam(value = "tel", required = false) String tel,
                                                            @RequestParam(value = "birthday", required = false) String birthday,
                                                            @RequestParam(value = "memberinfo", required = false) String memberinfo,
                                                            @RequestParam(value = "picurl", required = false) MultipartFile picFile) {

        // 找到要更新的會員
        Optional<Member> upMemberOpt = memberRepository.findById(id);
        if (!upMemberOpt.isPresent()) {
            Map<String, Object> errorResponse = new HashMap<>();
            errorResponse.put("status", "error");
            errorResponse.put("message", "Member not found");
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(errorResponse);
        }

        Member updatingMember = upMemberOpt.get();

        // 更新帳號
        if (account != null && !account.isEmpty()) {
            updatingMember.setAccount(account);
        }

        // 更新信箱
        if (email != null && !email.isEmpty()) {
            if (!email.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\\\.[a-zA-Z]{2,6}$")) {
                Map<String, Object> errorResponse = new HashMap<>();
                errorResponse.put("status", "error");
                errorResponse.put("message", "Invalid email format");
                return ResponseEntity.badRequest().body(errorResponse);
            }
            updatingMember.setEmail(email);
        }

        // 更新電話
        if (tel != null && !tel.isEmpty()) {
            if (!tel.matches("^09\\d{8}$")) {
                Map<String, Object> errorResponse = new HashMap<>();
                errorResponse.put("status", "error");
                errorResponse.put("message", "Invalid phone number format. It must start with 09 and be 10 digits long.");
                return ResponseEntity.badRequest().body(errorResponse);
            }
            updatingMember.setTel(tel);
        }

        // 更新生日
        if (birthday != null && !birthday.isEmpty()) {
            try {
                LocalDate parsedDate = LocalDate.parse(birthday);  // 轉換為 LocalDate
                updatingMember.setBirthday(parsedDate.toString());
            } catch (DateTimeParseException e) {
                Map<String, Object> errorResponse = new HashMap<>();
                errorResponse.put("status", "error");
                errorResponse.put("message", "Invalid birthday format");
                return ResponseEntity.badRequest().body(errorResponse);
            }
        }

        // 更新其他欄位
        if (memberinfo != null && !memberinfo.isEmpty()) {
            updatingMember.setMemberinfo(memberinfo);
        }

        // 處理圖片
        if (picFile != null && !picFile.isEmpty()) {
            try {
                byte[] picBytes = picFile.getBytes();
                updatingMember.setPic(picBytes);  // 儲存圖片
            } catch (IOException e) {
                Map<String, Object> errorResponse = new HashMap<>();
                errorResponse.put("status", "error");
                errorResponse.put("message", "Error uploading image.");
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorResponse);
            }
        }

        // 保存更新的會員資料
        memberRepository.save(updatingMember);

        // 返回更新後的會員資料
        Map<String, Object> successResponse = new HashMap<>();
        successResponse.put("status", "success");
        successResponse.put("message", "Member updated successfully");
        successResponse.put("updatedMember", updatingMember);

        return ResponseEntity.ok(successResponse);
    }
}
