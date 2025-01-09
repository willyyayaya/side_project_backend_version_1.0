package tw.mimi.test.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import tw.mimi.test.model.Member;

@Repository
public interface MemberRepository extends JpaRepository<Member, Long>{
	Optional<Member> findByAccount(String account);
}
