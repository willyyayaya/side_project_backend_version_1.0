package tw.sideproject.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import tw.sideproject.model.Member;
import tw.sideproject.model.MemberOrder;
import tw.sideproject.model.MemberOrderKey;
import tw.sideproject.model.Order;

@Repository
public interface MemberOrderRepository extends JpaRepository<MemberOrder, MemberOrderKey> {
    // 正确的方法：根据 member 的 id 查找 MemberOrder
    List<MemberOrder> findByMember_memberid(Long memberid);
    
    //根據 memberid 查找對應的 Member 實體
    List<MemberOrder> findAllByMember_memberid(Long memberid);
	
 // 修正方法，使用 'member' 進行查詢
    List<MemberOrder> findAllByMember(Member member);
    
	// 使用 member.memberid 和 order.orderid 進行查詢
    Optional<MemberOrder> findByMember_memberidAndOrder_orderid(Long memberid, Long orderid);
	
	@Modifying
    @Query("DELETE FROM MemberOrder mo WHERE mo.member.id = :memberid")
    void deleteAllBymemberid(@Param("memberid") Long memberid);
	
    @Modifying
    @Query("DELETE FROM MemberOrder mo WHERE mo.order.id = :orderid")
    void deleteAllByOrderid(@Param("orderid") Long orderid);
    
    // 刪除所有 wanted 和 owned 都為 false 的紀錄
    @Modifying
    @Transactional
    @Query("DELETE FROM MemberOrder mo WHERE mo.wanted = false AND mo.owned = false")
    void deleteAllByWantedFalseAndOwnedFalse();
    
 // 查找與某個會員相關的所有專案 (基於 member.id)
    @Query("SELECT mo.order FROM MemberOrder mo WHERE mo.member.id = :memberid")
    List<Order> findAllOrdersByMemberId(@Param("memberid") Long memberId);

    // 查找與某個專案相關的所有會員 (基於 order.id)
    @Query("SELECT mo.member FROM MemberOrder mo WHERE mo.order.id = :orderId")
    List<Member> findAllMembersByOrderId(@Param("orderId") Long orderId);

    // 查找與某個會員相關的所有專案 (基於 member.id)
    List<Order> findAllOrdersByMember_memberid(Long memberId);
   
    
    
    
}