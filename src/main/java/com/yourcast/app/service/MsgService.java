package com.yourcast.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourcast.app.dao.MsgDAO;
import com.yourcast.app.vo.MsgVO;

@Service
public class MsgService {

	@Autowired private MsgDAO dao;
	public void setDao(MsgDAO dao) {
		this.dao = dao;
	}
	
	public int insert(MsgVO vo) {
		return dao.insert(vo);
	}
	
	public List<MsgVO> getSendList(int m_nums){
		return dao.getSendList(m_nums);
	}
	
	public List<MsgVO> getRecvList(int m_numr){
		return dao.getRecvList(m_numr);
	}
	
	public int viewDate(int msg_num) {
		return dao.viewDate(msg_num);
	}
	
	public int sendDelete(int msg_num) {
		return dao.sendDelete(msg_num);
	}
	
	public int recvDelete(int msg_num) {
		return dao.recvDelete(msg_num);
	}
	
	public int sendCount(int m_nums) {
		return dao.sendCount(m_nums);
	}
	
	public int recvCount(int m_numr) {
		return dao.recvCount(m_numr);
	}
}
