package com.yourcast.app.vo;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="List")
@XmlAccessorType(XmlAccessType.FIELD)
public class PagingVO {
	@XmlElement(name="list")
	public List<FanVO> list;
	public void setList(List<FanVO> list) {
		this.list = list;
	}
	public List<FanVO> getList() {
		return list;
	}
	
	@XmlElement(name="recvlist")
	public List<StarUseVO> recvlist;
	public void setRecvlist(List<StarUseVO> recvlist) {
		this.recvlist = recvlist;
	}
	public List<StarUseVO> getRecvlist() {
		return recvlist;
	}
	
	@XmlElement(name="exlist")
	public List<ExchangeVO> exlist;
	public void setExlist(List<ExchangeVO> exlist) {
		this.exlist = exlist;
	}
	public List<ExchangeVO> getExlist() {
		return exlist;
	}
}
