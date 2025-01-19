package tw.mimi.test.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import tw.mimi.test.model.Message;

@Repository
public interface MessageRepository extends JpaRepository<Message, Long>{
	//查詢message的receiverid
	@Query("SELECT m FROM Message m WHERE m.receiverid.memberid = :receiverid")
	List<Message> findByReceiverid(@Param("receiverid") Long receiverid);

	Optional<Message> findByMessageid(Long messageid);
}
