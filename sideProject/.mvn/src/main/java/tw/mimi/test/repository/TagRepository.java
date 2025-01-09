package tw.mimi.test.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import tw.mimi.test.model.Tag;

@Repository
public interface TagRepository extends JpaRepository<Tag, Long> {
	
}
