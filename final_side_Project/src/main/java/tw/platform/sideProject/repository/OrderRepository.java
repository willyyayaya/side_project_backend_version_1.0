package tw.platform.sideProject.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import tw.platform.sideProject.model.Order;
import tw.platform.sideProject.model.yuOrder;

import java.util.List;
import java.util.Optional;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long>{
	
	Optional<Order> findByName(String name);
    
    List<Order> findByRankGreaterThanEqual(int rank);
 // 查詢所有 tagido 等於特定值的訂單
//    List<Order> findByTagido(int tagido);
    
 // 查詢擁有特定 tagido 的所有訂單
//    List<Order> findByTags_Tagido(int tagido);
    
//	YU新增(home)
	// 模糊查詢 名稱 或 intro 符合 keyword
	@Query("SELECT o FROM yuOrder o WHERE o.name LIKE %:keyword% OR o.intro LIKE %:keyword%")
	List<yuOrder> searchByKeyword(@Param("keyword") String keyword);
}
