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
	
	@XmlElement(name="bplist")
	public List<BoardReportVO> bplist;
	public void setBplist(List<BoardReportVO> bplist) {
		this.bplist = bplist;
	}
	public List<BoardReportVO> getBplist() {
		return bplist;
	}
	
	@XmlElement(name="brplist")
	public List<BoardReplyReportVO> brplist;
	public List<BoardReplyReportVO> getBrplist() {
		return brplist;
	}
	public void setBrplist(List<BoardReplyReportVO> brplist) {
		this.brplist = brplist;
	}
	
	@XmlElement(name="vplist")
	public List<VideoReportVO> vplist;
	public List<VideoReportVO> getVplist() {
		return vplist;
	}
	public void setVplist(List<VideoReportVO> vplist) {
		this.vplist = vplist;
	}
	
	@XmlElement(name="vrplist")
	public List<VideoReplyReportVO> vrplist;
	public List<VideoReplyReportVO> getVrplist() {
		return vrplist;
	}
	public void setVrplist(List<VideoReplyReportVO> vrplist) {
		this.vrplist = vrplist;
	}
	
	@XmlElement(name="gradelist")
	public List<GradeVO> gradelist;
	public List<GradeVO> getGradelist() {
		return gradelist;
	}
	public void setGradelist(List<GradeVO> gradelist) {
		this.gradelist = gradelist;
	}
		
}
