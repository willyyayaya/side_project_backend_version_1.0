package tw.platform.sideProject.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import tw.platform.sideProject.model.Member;
import tw.platform.sideProject.model.MemberOrder;
import tw.platform.sideProject.model.MemberOrderKey;
import tw.platform.sideProject.model.Order;

@Repository
public interface MemberOrderRepository extends JpaRepository<MemberOrder, MemberOrderKey> {
    
	 List<MemberOrder> findAllById_Memberid(Long memberid);  // 由於使用了複合主鍵，所以需要用 `Id_` 來指明 `MemberOrderKey` 的欄位

	 List<MemberOrder> findAllById_Orderid(Long orderid);  // 同理，查詢基於 `orderId`
	
	// 使用 member.memberid 和 order.orderid 進行查詢
    Optional<MemberOrder> findByMember_memberidAndOrder_orderid(Long memberid, Long orderid);
	
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
    List<Order> findAllOrdersByMemberid(Long memberid);

    // 查找與某個專案相關的所有會員
    @Query("SELECT mo.member FROM MemberOrder mo WHERE mo.order.orderid = :orderId")
    List<Member> findAllMembersByOrderid(Long orderid);
    
    // 查詢某個會員相關的所有專案的關係
    @Query("SELECT mo FROM MemberOrder mo WHERE mo.member.memberid = :memberId")
    List<MemberOrder> findAllByMemberid(@Param("memberId") Long memberId);
    
 // 查詢會員收藏的所有專案    
    List<MemberOrder> findByMember_MemberidAndCollectedTrue(Long memberId);

    //找member跟order的wanted
	List<MemberOrder> findWantedByMember_memberidAndOrder_orderid(Long memberid, Long orderid);
	
	// 根據 memberId 和 orderId 更新 wanted 屬性
    @Modifying
    @Query("UPDATE MemberOrder mo SET mo.collected = :Collected WHERE mo.member.memberid = :memberid AND mo.order.orderid = :orderid")
    void updateCollectedStatus(@Param("memberid") Long memberid, @Param("orderid") Long orderid, @Param("collected") boolean collected);
//-----------------------------
    //站內信使用
    
    List<MemberOrder> findByOrderAndWantedTrue(Order order);
}