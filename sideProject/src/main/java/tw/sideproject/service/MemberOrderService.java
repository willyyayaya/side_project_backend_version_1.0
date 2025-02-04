package tw.sideproject.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;
import tw.sideproject.model.AddMemberOrderRequest;
import tw.sideproject.model.Member;
import tw.sideproject.model.MemberOrder;
import tw.sideproject.model.MemberOrderKey;
import tw.sideproject.model.Order;
import tw.sideproject.repository.MemberOrderRepository;
import tw.sideproject.repository.MemberRepository;
import tw.sideproject.repository.OrderRepository;

@Service
public class MemberOrderService {
    
    @Autowired
    private MemberOrderRepository memberOrderRepository;
    
    @Autowired
    private MemberRepository memberRepository;
    
    @Autowired
    private OrderRepository orderRepository;


    // 新增會員創建專案的關聯 (owned設為true)
    public String addOwnedOrder(AddMemberOrderRequest request) {
    	
    	// 查找會員
        Member member = memberRepository.findById(request.getMemberId())
                .orElseThrow(() -> new RuntimeException("Member not found"));

        // 查找專案
        Order order = orderRepository.findById(request.getOrderId())
                .orElseThrow(() -> new RuntimeException("Order not found"));
        
        MemberOrder memberOrder = new MemberOrder();
        MemberOrderKey memberOrderKey = new MemberOrderKey();
        memberOrder.setId(memberOrderKey); // 初始化 ID
        memberOrder.getId().setMemberid(request.getMemberId());
        memberOrder.getId().setOrderid(request.getOrderId());
        memberOrder.setMember(member);  // 設置 member 對象
        memberOrder.setOrder(order);    // 設置 order 對象
        memberOrder.setOwned(true);
        memberOrder.setWanted(false);
        memberOrder.setCollected(false);
        memberOrderRepository.save(memberOrder);
        return "會員創建專案關聯已新增";
    }

    // 新增會員對專案有興趣的關聯 (wanted設為true)
    public String addWantedOrder(AddMemberOrderRequest request) {
    	
    	// 查找會員
        Member member = memberRepository.findById(request.getMemberId())
                .orElseThrow(() -> new RuntimeException("Member not found"));

        // 查找專案
        Order order = orderRepository.findById(request.getOrderId())
                .orElseThrow(() -> new RuntimeException("Order not found"));
        
        MemberOrder memberOrder = new MemberOrder();
        MemberOrderKey memberOrderKey = new MemberOrderKey();
        memberOrder.setId(memberOrderKey); // 初始化 ID
        memberOrder.setMember(member);  // 設置 member 對象
        memberOrder.setOrder(order);    // 設置 order 對象
        memberOrder.getId().setMemberid(request.getMemberId());
        memberOrder.getId().setOrderid(request.getOrderId());
        memberOrder.setOwned(false);
    	memberOrder.setWanted(true);
    	memberOrder.setCollected(false);
        
        memberOrderRepository.save(memberOrder);
        return "會員對專案有興趣的關聯已新增";
    }

    // 移除會員對專案有興趣的關聯 (wanted設為false)
    @Transactional
    public String removeWantedOrder(Long memberId, Long orderId) {
        // 查找指定會員和專案的關聯
        MemberOrder memberOrder = memberOrderRepository.findByMember_memberidAndOrder_orderid(memberId, orderId)
                .orElseThrow(() -> new RuntimeException("找不到該會員與專案的關聯"));

        // 如果目前該關聯已經不是 'wanted'，則不進行任何操作
        if (!memberOrder.getWanted()) {
            return "該會員對專案的關聯已經為非 wanted";
        }
        // 更新 wanted 為 false
        memberOrder.setWanted(false);
        memberOrderRepository.save(memberOrder);

        // 檢查並刪除所有 wanted 和 owned 都為 false 的資料
        memberOrderRepository.deleteAllByWantedFalseAndOwnedFalse();

        return "會員對專案的 wanted 關聯已移除，並刪除所有 wanted 和 owned 都為 false 的資料";
    }
    
 // 根據 memberId 獲取該會員所有收藏的專案
    public List<MemberOrder> getcollectedByMemberId(Long memberid) {
        return memberOrderRepository.findByMember_MemberidAndCollectedTrue(memberid);  // 這個方法返回會員收藏的專案
    }

    // 會員刪除專案 (僅限 owned = true 的會員執行)
    @Transactional
    public String deleteOwnedOrder(Long memberId, Long orderId) {
        MemberOrder memberOrder = memberOrderRepository.findByMember_memberidAndOrder_orderid(memberId, orderId)
                .orElseThrow(() -> new RuntimeException("找不到該會員與專案的關聯"));
        if (!memberOrder.getOwned()) {
            return "只有創建該專案的會員才能刪除專案";
        }
        memberOrderRepository.deleteAllByOrderid(orderId);
        return "專案及所有相關關聯已刪除";
    }
    
    // 查找某個會員相關的所有專案
    public List<MemberOrder> getOrdersByMemberid(Long memberid) {
        return memberOrderRepository.findAllById_Memberid(memberid);
    }
    
    

    // 查找某個專案相關的所有會員
    public List<Member> getMembersByOrderId(Long orderid) {
        return memberOrderRepository.findAllMembersByOrderid(orderid);
    }
    
    //========新增======================================
 // 根据 memberId 获取该会员的所有订单
    public List<MemberOrder> getAllOrdersByMemberid(Long memberid) {
        return memberOrderRepository.findAllById_Memberid(memberid); // 查詢方法使用复合主鍵
    }

    // 根据 memberId 和 orderId 查找特定的订单
    public Optional<MemberOrder> getOrderByMemberAndOrder(Long memberId, Long orderId) {
        return memberOrderRepository.findByMember_memberidAndOrder_orderid(memberId, orderId);
    }
    
 // 更新會員對某個專案的收藏狀態
    public void updateCollectedStatus(Long memberid, Long orderid, boolean collected) {
        memberOrderRepository.updateCollectedStatus(memberid, orderid, collected);
    }

	// 新增評價(order)
	public String addEvaluate(Long orderid, AddMemberOrderRequest request) {
		// 查找與指定訂單號碼對應的所有 MemberOrder
		List<MemberOrder> memberOrders = memberOrderRepository.findByOrder_orderid(orderid);

		if (memberOrders.isEmpty()) {
			return "找不到對應的訂單，無法新增評價";
		}

		MemberOrder memberOrder = memberOrders.get(0); // 取得第一個匹配的紀錄

		// 設定評分和評價
		memberOrder.setEvaluate(request.getEvaluate());

		// 儲存評價
		memberOrderRepository.save(memberOrder);

		return "評價已成功新增";
	}

	// 查找某個會員相關的所有專案平均評分(order)
	public Double getAverageRankByMemberId(Long memberid) {
		// 查找該會員所有擁有的專案的 rank 分數
		List<Integer> ranks = memberOrderRepository.findRanksByMemberIdAndOwnedTrue(memberid);

		if (ranks.isEmpty()) {
			// 如果沒有找到相關專案，則返回 null 或者其他預設值
			return 0.0;
		}

		// 計算平均 rank 分數，將 null 視為 0
		double sum = 0;
		int count = 0;

		for (Integer rank : ranks) {
			sum += (rank != null ? rank : 0); // 使用 0 代替 null
			count++;
		}

		return sum / count; // 返回所有 rank 的平均分數
	}

	// 尋找某個專案的發行會員(order)
	public List<Member> getMemberByOrderId(Long orderid) {
		return memberOrderRepository.findMemberByOrderid(orderid);
	}

    
}