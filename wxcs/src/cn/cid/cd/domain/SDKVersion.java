package cn.cid.cd.domain;

import java.util.ArrayList;
import java.util.List;

public class SDKVersion {

	private Long id;
	private Double version;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Double getVersion() {
		return version;
	}
	public void setVersion(Double version) {
		this.version = version;
	}
	@Override
	public String toString() {
		return "SDKVersion [id=" + id + ", version=" + version + "]";
	}

	
	
}
