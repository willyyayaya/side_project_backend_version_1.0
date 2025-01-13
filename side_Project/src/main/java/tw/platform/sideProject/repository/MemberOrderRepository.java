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

	List<MemberOrder> findByOrder_orderid(Long orderId);

	// 查找會員的所有專案評分的平均
	@Query("SELECT o.rank FROM MemberOrder mo JOIN mo.order o WHERE mo.member.memberid = :memberId AND mo.owned = true")
	List<Integer> findRanksByMemberIdAndOwnedTrue(@Param("memberId") Long memberId);

	// 查詢專案的所有會員
	@Query("SELECT mo.member FROM MemberOrder mo WHERE mo.order.id = :orderId AND mo.owned = true")
	List<Member> findMembersByOrderid(@Param("orderId") Long orderId);

	// 查詢該專案的申請人數
	@Query("SELECT COUNT(mo) FROM MemberOrder mo WHERE mo.order.id = :orderId AND mo.wanted = true")
	Long countWantedByOrderId(@Param("orderId") Long orderId);

	@Modifying
	@Transactional
	@Query("UPDATE MemberOrder mo SET mo.collected = :collected WHERE mo.member.id = :memberId AND mo.order.id = :orderId")
	void updateCollectedStatus(@Param("collected") boolean collected, @Param("memberId") Long memberId,
			@Param("orderId") Long orderId);

	
}