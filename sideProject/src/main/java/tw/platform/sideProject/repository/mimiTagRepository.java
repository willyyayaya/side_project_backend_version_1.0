package tw.mimi.test.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import tw.mimi.test.model.mimiTag;

@Repository
public interface mimiTagRepository extends JpaRepository<mimiTag, Long> {
	
}
