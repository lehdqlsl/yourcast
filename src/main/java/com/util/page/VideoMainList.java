package com.util.page;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import com.yourcast.app.vo.VideoVO;

@XmlRootElement(name="videoMainList")
@XmlAccessorType(XmlAccessType.FIELD)
public class VideoMainList {
	@XmlElement(name="list")
	public List<VideoVO> list;

	public List<VideoVO> getList() {
		return list;
	}

	public void setList(List<VideoVO> list) {
		this.list = list;
	}
	
}
