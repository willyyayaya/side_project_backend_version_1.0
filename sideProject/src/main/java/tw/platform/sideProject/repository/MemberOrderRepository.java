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

	//統計每個專案的申請人數
	@Query("SELECT yo, COALESCE(COUNT(mo.wanted), 0) AS wanted_count " + 
			"FROM yuOrder yo LEFT JOIN yo.memberOrders mo " + 
			"ON yo.orderid = mo.id.orderid AND mo.wanted = true " +
			"WHERE yo.deadline>CURRENT_DATE " +
		    "GROUP BY yo " + 
			"ORDER BY wanted_count DESC")
	List<Object[]> findWantedCountByOrderId();
	//統計每個專案的收藏人數
	@Query("SELECT yo, COALESCE(COUNT(mo.wanted), 0) AS collected_count " + 
			"FROM yuOrder yo LEFT JOIN yo.memberOrders mo " + 
			"ON yo.orderid = mo.id.orderid AND mo.collected = true " +
			"WHERE yo.deadline>CURRENT_DATE " +
			"GROUP BY yo " + 
			"ORDER BY collected_count DESC")
	List<Object[]> findCollectedCountByOrder();
	
	//查詢指定專案id的收藏人數
	@Query("SELECT COALESCE(COUNT(mo.wanted), 0) AS collected_count " +
		       "FROM yuOrder yo LEFT JOIN yo.memberOrders mo " +
		       "ON yo.orderid = mo.id.orderid AND mo.collected = true " +
		       "WHERE yo.deadline > CURRENT_DATE AND yo.orderid = :orderId " +
		       "GROUP BY yo")
	List<Object[]> findCollectedCountByOrderId(Long orderId);

}