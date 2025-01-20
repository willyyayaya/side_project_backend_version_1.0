package tw.platform.sideProject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import tw.platform.sideProject.model.AddMemberOrderRequest;
import tw.platform.sideProject.model.Member;
import tw.platform.sideProject.model.MemberOrder;
import tw.platform.sideProject.model.Order;
import tw.platform.sideProject.service.MemberOrderService;

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
	
	 // 查詢某個會員相關的所有專案的關係(admin)
    @GetMapping("/getAllMemberOrdersByMemberId/{memberId}")
    public List<MemberOrder> getAllMemberOrdersByMemberId(@PathVariable Long memberId) {
        return memberOrderService.getAllMemberOrdersByMemberId(memberId);
    }

	// 根據orderid來找發行會員(order)
	@GetMapping("/getMemberIdByOrderId/{orderId}")
	public List<Member> getMemberIdByOrderID(@PathVariable Long orderId) {
		return memberOrderService.getMemberByOrderId(orderId);
	}

	// 新增評價(order)
	@PostMapping("/addEvaluate/{orderId}")
	public String addEvaluate(@PathVariable Long orderId, @RequestBody AddMemberOrderRequest memberOrder) {
		return memberOrderService.addEvaluate(orderId, memberOrder);
	}

	// 查詢某個會員相關的所有專案評分總和(order)
	@GetMapping("/getRank/{memberId}")
	public Double getAverageRank(@PathVariable Long memberId) {
		return memberOrderService.getAverageRankByMemberId(memberId);
	}

	// 收藏案件(order)
	@PutMapping("/collected")
	public String updatecollectedStatus(@RequestBody AddMemberOrderRequest request) {
		return memberOrderService.updatecollectedStatus(request);
	}

	// 查詢收藏案件是否為true(order)
	@GetMapping("/collected/{orderId}/{memberId}")
	public Boolean getMemberCollected(@PathVariable Long orderId, @PathVariable Long memberId) {
		return memberOrderService.getMemberCollected(orderId, memberId);
	}

	// 取消收藏 (collected設為false)(order)
	@PutMapping("/removeMemberCollected")
	public String removeMemberCollected(@RequestBody AddMemberOrderRequest request) {
		 request.setCollected(false);  // 將 collected 設置為 false，代表取消收藏
		    return memberOrderService.removeMemberCollected(request);
	}

	// 查詢申請案件人數(order)
	@GetMapping("/wanted/people/{orderId}")
	public Long getwanted(@PathVariable Long orderId) {
		return memberOrderService.getwanted(orderId);
	}

	// 查詢會員是否已wantrd(order)
	@GetMapping("/memberWanted/{orderId}/{memberId}")
	public Boolean getMemberWanted(@PathVariable Long orderId, @PathVariable Long memberId) {
		return memberOrderService.getMemberWanted(orderId, memberId);
	}

}
