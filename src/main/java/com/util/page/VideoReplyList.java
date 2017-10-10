package com.util.page;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import com.yourcast.app.vo.VideoReplyVO;

@XmlRootElement(name="videoReplyList")
@XmlAccessorType(XmlAccessType.FIELD)
public class VideoReplyList {
	@XmlElement(name="list")
	public List<VideoReplyVO> list;

	public List<VideoReplyVO> getList() {
		return list;
	}

	public void setList(List<VideoReplyVO> list) {
		this.list = list;
	}
	
}
