package cn.cid.cd.domain;

public class GameStyle {

	private Long id ;
	private String styleName;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getStyleName() {
		return styleName;
	}
	public void setStyleName(String styleName) {
		this.styleName = styleName;
	}
	@Override
	public String toString() {
		return "GameStyle [id=" + id + ", styleName=" + styleName + "]";
	}
	
	
	
}
