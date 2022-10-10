package com.myweb.home.member.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.home.login.model.AccountDTO;
import com.myweb.home.member.model.MemberDAO;
import com.myweb.home.member.vo.MemberVO;

@Service
public class MemberService {
	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);

	
	@Autowired
	private MemberDAO dao;
	
	public void register(MemberVO vo) {
		logger.info("register(vo={})", vo);
		dao.register(vo);
	}

	public int idOverlap(MemberVO vo) {
		logger.info("idOverlap(MemberVO={})", vo);
		int result = dao.idOverlap(vo);
		return result;
	}

	public boolean userModify(MemberVO vo) {
		logger.info("userModify(vo={})", vo);
		boolean result = dao.userModify(vo);
		return result;
	}

	public boolean signout(MemberVO vo) {
		logger.info("signout(vo={})", vo);
		boolean result = dao.signout(vo);
		return result;
	}

	public MemberVO getAll(String accountid) {
		logger.info("getAll(accountid={})", accountid);
		MemberVO data = dao.selectAll(accountid);
		return data;
	}
}
