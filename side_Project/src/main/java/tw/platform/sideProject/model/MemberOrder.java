package tw.platform.sideProject.model;

import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;
import jakarta.persistence.Table;

@Entity
@Table(name = "memberorder")
public class MemberOrder {

    @EmbeddedId
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
    private boolean collected;
    private String evaluate;

    // Getters and Setters
    public MemberOrderKey getId() {
        return id;
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

	public String getEvaluate() {
		return evaluate;
	}

	public void setEvaluate(String evaluate) {
		this.evaluate = evaluate;
	}

	public boolean isCollected() {
		return collected;
	}

	public void setCollected(boolean collected) {
		this.collected = collected;
	}
}
