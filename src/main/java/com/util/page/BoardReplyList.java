package com.util.page;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import com.yourcast.app.vo.BoardReplyVO;

@XmlRootElement(name="boardReplyList")
@XmlAccessorType(XmlAccessType.FIELD)
public class BoardReplyList {
	@XmlElement(name="list")
	public List<BoardReplyVO> list;

	public List<BoardReplyVO> getList() {
		return list;
	}

	public void setList(List<BoardReplyVO> list) {
		this.list = list;
	}
	
}
