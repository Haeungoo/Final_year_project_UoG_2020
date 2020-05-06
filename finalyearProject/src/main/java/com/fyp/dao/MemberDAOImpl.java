package com.fyp.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.fyp.vo.BoardVO;
import com.fyp.vo.MemberBoardVO;
import com.fyp.vo.MemberVO;
import com.fyp.vo.SearchCriteria;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	SqlSession sql;

	// register
	@Override
	public void register(MemberVO vo) throws Exception {
		sql.insert("memberMapper.register", vo);
	}

	// login
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return sql.selectOne("memberMapper.login", vo);
	}

	// modify
	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		sql.update("memberMapper.memberUpdate", vo);
	}

	// delete
	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		sql.delete("memberMapper.memberDelete", vo);
	}

	// check the password
	public int passChk(MemberVO vo) throws Exception {
		int result = sql.selectOne("memberMapper.passChk", vo);
		return result;
	}

	// id duplicate check
	public int idChk(MemberVO vo) throws Exception {
		int result = sql.selectOne("memberMapper.idChk", vo);
		return result;
	}

	// select the list of posts
	@Override
	public List<MemberVO> list(SearchCriteria scri) throws Exception {
		return sql.selectList("memberMapper.listPage", scri);
	}

	// save the posts
	@Override
	public void savePost(MemberBoardVO vo) throws Exception {
		sql.insert("memberMapper.savePost", vo);
	}

	// check the saved post
	@Override
	public int savePostChk(MemberBoardVO vo) throws Exception {
		int check = sql.selectOne("memberMapper.savePostChk", vo);
		return check;
	}

	// save the posts
	@Override
	public void reportPost(MemberBoardVO vo) throws Exception {
		sql.insert("memberMapper.reportPost", vo);
	}

	// check the saved post
	@Override
	public int reportPostChk(MemberBoardVO vo) throws Exception {
		int check = sql.selectOne("memberMapper.reportPostChk", vo);
		return check;
	}

	// select the list of saved posts
	@Override
	public List<BoardVO> savedPostList(MemberVO vo) throws Exception {
		return sql.selectList("memberMapper.savedPostList", vo);
	}

	// select the list of reported posts
	@Override
	public List<BoardVO> reportedPostList() throws Exception {
		return sql.selectList("memberMapper.reportedPostList");
	}

	// select the list of your posts
	@Override
	public List<BoardVO> yourPostList(MemberVO vo) throws Exception {
		return sql.selectList("memberMapper.yourPostList", vo);
	}

}