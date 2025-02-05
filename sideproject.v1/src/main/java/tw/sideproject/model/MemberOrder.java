package tw.sideproject.model;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;
import jakarta.persistence.Table;

@Entity
@Table(name = "memberorder")
public class MemberOrder {

    @EmbeddedId
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private MemberOrderKey id;

    @ManyToOne
    @MapsId("memberid")
    @JoinColumn(name = "memberid", insertable = false, updatable = false)
    private Member member;

    @ManyToOne
    @MapsId("orderid")
    @JoinColumn(name = "orderid", insertable = false, updatable = false)
    private Order order;

    private Boolean owned;
    private Boolean wanted;
    private Boolean collected;
    private Boolean getproject;
    private String evaluate;
    private String picurl;   // 確保有這個屬性
    private String name;
    private String detail;
    


    // Getters and Setters
    
    public Long getMemberid() {
        return id.getMemberid();
    }

    public Long getOrderid() {
        return id.getOrderid();
    }

    
    public MemberOrderKey getId() {
        return id;
    }


	public String getPicurl() {
		return picurl;
	}


	public void setPicurl(String picurl) {
		this.picurl = picurl;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getDetail() {
		return detail;
	}


	public void setDetail(String detail) {
		this.detail = detail;
	}


	public void setId(MemberOrderKey id) {
        this.id = id;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Boolean getOwned() {
        return owned;
    }

    public void setOwned(Boolean owned) {
        this.owned = owned;
    }

    public Boolean getWanted() {
        return wanted;
    }

    public void setWanted(Boolean wanted) {
        this.wanted = wanted;
    }

	public Boolean isCollected() {
		return collected;
	}


	public void setCollected(Boolean collected) {
		this.collected = collected;
	}
    
	@Override
	public String toString() {
	    return "MemberOrder{" +
	            "orderid=" + getOrderid() +
	            ", name='" + name + '\'' +
	            ", picurl='" + picurl + '\'' +
	            ", collected=" + collected +
	            '}';
	}

	public Boolean getGetproject() {
		return getproject;
	}

	public void setGetproject(Boolean getproject) {
		this.getproject = getproject;
	}

	public String getEvaluate() {
		return evaluate;
	}

	public void setEvaluate(String evaluate) {
		this.evaluate = evaluate;
	}

	
	
}