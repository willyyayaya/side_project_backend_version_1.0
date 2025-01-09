package tw.mimi.test.service;

import java.util.Base64;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.mimi.test.model.Member;
import tw.mimi.test.repository.MemberRepository;
import tw.mimi.test.util.BCrypt;

@Service
public class MemberService {
	
	@Autowired
	private MemberRepository memberRepository;
	public void addMember(Member member) {
		member.setPassword(BCrypt.hashpw(member.getPassword(), BCrypt.gensalt()));
		Member saveMember = memberRepository.save(member);//表單資料
	}
	
	public Member loginMember(Member loginmember) {
		Optional<Member> opt = memberRepository.findByAccount(loginmember.getAccount());
		try {
		Member member = opt.get();
		if(member != null) {
			System.out.println("debug3");
			if(!BCrypt.checkpw(loginmember.getPassword(), member.getPassword())) {
				member = null;
				System.out.println("debug4");				
			}else {
			}//iconbyte[]陣列轉base64
		}
		return member;
		}catch(Exception e) {
			return null;
		}
	}
}
