package tw.sideproject.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import tw.sideproject.model.Order;

import java.util.List;
import java.util.Optional;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long>{
	
	Optional<Order> findByName(String name);
	
	
    List<Order> findByRankGreaterThanEqual(int rank);
 // 查詢所有 tagido 等於特定值的訂單
//    List<Order> findByTagido(int tagido);
    
 // 查詢擁有特定 tagido 的所有訂單
    List<Order> findByTags_Tagido(int tagido);
}
