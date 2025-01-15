package tw.sideproject.model;

import java.time.LocalDate;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "member")
public class Member {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long memberid;
	
	@Column(name = "account")
    private String account;
	@Column(name = "password")
    private String password;
	@Column(name = "email")
    private String email;
	@Column(name = "name")
    private String name;
	@Column(name = "birthday")
    private LocalDate birthday;
	@Column(name = "tel")
    private String tel;
   
    @Column(name = "picurl" )
    private byte[] pic;
    
    private String memberinfo;
    
    @Column(nullable = false)
    private Boolean isblocked = false; // 預設值

    @JsonIgnore
    @OneToMany(mappedBy = "member")
    private List<MemberTag> memberTags;

    // Getters and Setters


    public String getAccount() {
        return account;
    }
    

	public Long getMemberid() {
		return memberid;
	}


	public void setMemberid(Long memberid) {
		this.memberid = memberid;
	}


	public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    

    public LocalDate getBirthday() {
		return birthday;
	}

	public void setBirthday(LocalDate birthday) {
		this.birthday = birthday;
	}

	public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public byte[] getPic() {
        return pic;
    }

    public void setPic(byte[] pic) {
        this.pic = pic;
    }

    public Boolean getIsblocked() {
        return isblocked;
    }

    public void setIsblocked(Boolean isblocked) {
        this.isblocked = isblocked;
    }

    public List<MemberTag> getMemberTags() {
        return memberTags;
    }

    public void setMemberTags(List<MemberTag> memberTags) {
        this.memberTags = memberTags;
    }

	public String getMemberinfo() {
		return memberinfo;
	}

	public void setMemberinfo(String memberinfo) {
		this.memberinfo = memberinfo;
	}
    
    
}