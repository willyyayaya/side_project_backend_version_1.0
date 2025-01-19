package tw.mimi.test.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import tw.mimi.test.model.mimiMember;

@Repository
public interface mimiMemberRepository extends JpaRepository<mimiMember, Long>{
	Optional<mimiMember> findByEmail(String email);
}
