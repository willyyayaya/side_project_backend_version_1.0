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
    
	// 使用 member.memberid 和 order.orderid 進行查詢
    Optional<MemberOrder> findByMember_memberidAndOrder_orderid(Long memberId, Long orderId);
	
	@Modifying
    @Query("DELETE FROM MemberOrder mo WHERE mo.member.id = :memberid")
    void deleteAllByMemberid(@Param("memberid") Long memberid);
	
    @Modifying
    @Query("DELETE FROM MemberOrder mo WHERE mo.order.id = :orderid")
    void deleteAllByOrderid(@Param("orderid") Long orderid);
    
    // 刪除所有 wanted 和 owned 都為 false 的紀錄
    @Modifying
    @Transactional
    @Query("DELETE FROM MemberOrder mo WHERE mo.wanted = false AND mo.owned = false")
    void deleteAllByWantedFalseAndOwnedFalse();
    
    // 查找與某個會員相關的所有專案
    @Query("SELECT mo.order FROM MemberOrder mo WHERE mo.member.memberid = :memberId")
    List<Order> findAllOrdersByMemberid(Long memberId);

    // 查找與某個專案相關的所有會員
    @Query("SELECT mo.member FROM MemberOrder mo WHERE mo.order.orderid = :orderId")
    List<Member> findAllMembersByOrderid(Long orderId);
    
}