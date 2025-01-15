package tw.sideproject.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import tw.sideproject.model.AddMemberOrderRequest;
import tw.sideproject.model.Member;
import tw.sideproject.model.MemberOrder;
import tw.sideproject.model.Order;
import tw.sideproject.repository.MemberOrderRepository;
import tw.sideproject.service.MemberOrderService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


// Controller 只處理當 request 來用 response 回應 => 再給 Service 處理邏輯 => 再給 Dao 與資料庫溝通，存取物件
@RestController
@RequestMapping("/api/memberOrders")
@CrossOrigin(origins = "*") // 避免 CORS 問題
public class MemberOrderController {

	@Autowired
    private MemberOrderService memberOrderService;

	// 新增會員創建專案的關聯 (owned設為true)
    @PostMapping("/addOwnedOrder")
    public String addOwnedOrder(@RequestBody AddMemberOrderRequest request) {
        return memberOrderService.addOwnedOrder(request);
    }

    // 新增會員對專案有興趣的關聯 (wanted設為true)
    @PostMapping("/addWantedOrder")
    public String addWantedOrder(@RequestBody AddMemberOrderRequest request) {
        return memberOrderService.addWantedOrder(request);
    }

    // 移除會員對專案有興趣的關聯 (wanted設為false)
    @DeleteMapping("/removeWantedOrder/{memberId}/{orderId}")
    public String removeWantedOrder(@PathVariable Long memberId, @PathVariable Long orderId) {
        return memberOrderService.removeWantedOrder(memberId, orderId);
    }

    // 會員刪除專案 (僅限 owned = true 的會員執行)
    @DeleteMapping("/deleteOwnedOrder/{memberId}/{orderId}")
    public String deleteOwnedOrder(@PathVariable Long memberId, @PathVariable Long orderId) {
        return memberOrderService.deleteOwnedOrder(memberId, orderId);
    }
    
    // 查詢某個會員相關的所有專案
    @GetMapping("/getOrdersByMemberId/{memberId}")
    public List<Order> getOrdersByMemberId(@PathVariable Long memberId) {
        return memberOrderService.getOrdersByMemberId(memberId);
    }

    // 查詢某個專案相關的所有會員
    @GetMapping("/getMembersByOrderId/{orderId}")
    public List<Member> getMembersByOrderId(@PathVariable Long orderId) {
        return memberOrderService.getMembersByOrderId(orderId);
    }

    
  //======新增===================================
    @Autowired
    private MemberOrderRepository memberOrderRepository;

    // 根据 memberId 获取该会员的所有订单
    @GetMapping("/memberlike/{memberId}")
    public String getMemberLike(@PathVariable Long memberId, @RequestParam Long orderId, Model model) {
        // 使用 service 获取所有与该 memberId 关联的 MemberOrder
        List<MemberOrder> orders = memberOrderService.getAllOrdersByMemberId(memberId);  // 假設您有這個方法

        // 過濾出與 orderId 匹配的 MemberOrder
        Optional<MemberOrder> memberOrder = orders.stream()
                .filter(order -> order.getOrder().getOrderid().equals(orderId))  // 假設 MemberOrder 中的 order 是 Order 類型
                .findFirst();

        // 根據是否找到對應的 MemberOrder 設置 wanted 屬性
        if (memberOrder.isPresent()) {
            model.addAttribute("wanted", memberOrder.get().getWanted());  // 假設 MemberOrder 中有 wanted 屬性
            System.out.println(memberOrder.get().getWanted());
        } else {
            model.addAttribute("wanted", false);  // 如果没有找到对应的订单，返回 false
        }

        return "memberlike";  // 返回 "memberlike" 视图
    }

}
