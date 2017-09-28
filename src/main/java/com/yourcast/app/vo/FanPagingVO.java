package com.yourcast.app.vo;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="fanList")
@XmlAccessorType(XmlAccessType.FIELD)
public class FanPagingVO {
	@XmlElement(name="list")
	public List<FanVO> list;
	public void setList(List<FanVO> list) {
		this.list = list;
	}
	public List<FanVO> getList() {
		return list;
	}
}
