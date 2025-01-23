package tw.platform.sideProject.model;

import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "orderform")
public class yuOrder {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long orderid;

	private String name;
	private String deadline;
	private String intro;
	private String detail;
	private String picurl;
	private String location;
	private String rank;
	private String category;
	private Integer people = 1;

	@ManyToMany
	@JoinTable(name = "ordertag", joinColumns = @JoinColumn(name = "orderid"), inverseJoinColumns = @JoinColumn(name = "tagid"))
	private Set<yuTag> tags = new HashSet<>();

	// get set
	public Long getOrderid() {
		return orderid;
	}

	public void setOrderid(Long orderid) {
		this.orderid = orderid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getPicurl() {
		return picurl;
	}

	public void setPicurl(String picurl) {
		this.picurl = picurl;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public Integer getPeople() {
		return people;
	}

	public void setPeople(Integer people) {
		this.people = people;
	}

	// 改寫getTagNames
	public String getTagNames() {
		return tags.stream().map(yuTag::getTagname).collect(Collectors.joining(","));
	}

	public void setTags(Set<yuTag> tags) {
		this.tags = tags;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	
}
