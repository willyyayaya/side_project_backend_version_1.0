package tw.platform.sideProject.model;

import java.util.List;

public class AddOrderRequest {
	private String name;
    private String deadline;
    private String intro;
    private String detail;
    private byte[] picurl;
    private String location;
    private int people;
    private List<Integer> tagIds; // 傳入的 Tag IDs

    // Getters and Setters
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

    public byte[] getPicurl() {
		return picurl;
	}

	public void setPicurl(byte[] picurl) {
		this.picurl = picurl;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getPeople() {
        return people;
    }

    public void setPeople(int people) {
        this.people = people;
    }

    public List<Integer> getTagIds() {
        return tagIds;
    }

    public void setTagIds(List<Integer> tagIds) {
        this.tagIds = tagIds;
    }
}
