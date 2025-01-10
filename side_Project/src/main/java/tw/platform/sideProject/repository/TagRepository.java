package tw.platform.sideProject.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import tw.platform.sideProject.model.Tag;

@Repository
public interface TagRepository extends JpaRepository<Tag, Integer> {

	List<Tag> findByTagname(String tagname);

	List<Tag> findByTagidm(Integer tagidm);

	List<Tag> findByTagido(Integer tagido);

	@Query("SELECT t.tagname FROM Tag t")
	List<String> findAllTagname(); // 這會返回所有的 tagname

	
	@Query("SELECT t.tagname FROM OrderTag ot JOIN ot.tag t WHERE ot.order.id = :orderId")
	List<String> findTagNamesByOrderId(@Param("orderId") Long orderId);
}