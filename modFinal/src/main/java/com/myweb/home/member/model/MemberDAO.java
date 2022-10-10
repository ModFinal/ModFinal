package com.myweb.home.member.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myweb.home.login.model.AccountDTO;
import com.myweb.home.member.vo.MemberVO;


@Repository
public class MemberDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberDAO.class);

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String mapper = "boardMapper.%s";
	
	public int register(MemberVO vo) {
		logger.info("register(vo={})", vo);
		return sqlSession.insert("memberMapper.register", vo);
	}
	
	public int idOverlap(MemberVO vo) {
		logger.info("idOverlap(MemberVO={})", vo);
		int result = sqlSession.selectOne("memberMapper.idOverlap", vo);
		return result;
	}

	public boolean userModify(MemberVO vo) {
		logger.info("userModify(vo={})", vo);
		int res = sqlSession.update("memberMapper.userModify", vo);
		return res == 1 ? true : false;
	}

	public boolean signout(MemberVO vo) {
		logger.info("signout(vo={})", vo);
		int res = sqlSession.delete("memberMapper.signout", vo);
		return res == 1 ? true : false;
	}

	public MemberVO selectAll(String accountid) {
		logger.info("selectAll(accountid={})", accountid);
		MemberVO data = sqlSession.selectOne("memberMapper.selectAll", accountid);
		return data;
	}
}
