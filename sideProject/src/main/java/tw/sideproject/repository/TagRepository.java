package tw.sideproject.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import tw.sideproject.model.Tag;

@Repository
public interface TagRepository extends JpaRepository<Tag, Integer> {

	List<Tag> findByTagname(String tagname);
	
	List<Tag> findByTagidm(Integer tagidm);
	
	List<Tag> findByTagido(Integer tagido);
}