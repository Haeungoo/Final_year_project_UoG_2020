package com.fyp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.fyp.dao.MemberDAO;
import com.fyp.vo.BoardVO;
import com.fyp.vo.MemberBoardVO;
import com.fyp.vo.MemberVO;
import com.fyp.vo.SearchCriteria;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDAO dao;

	@Override
	public void register(MemberVO vo) throws Exception {
		dao.register(vo);
	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);
	}

	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		dao.memberUpdate(vo);
	}

	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		dao.memberDelete(vo);
	}

	@Override
	public int passChk(MemberVO vo) throws Exception {
		int result = dao.passChk(vo);
		return result;
	}

	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = dao.idChk(vo);
		return result;
	}

	// select the list of members
	@Override
	public List<MemberVO> list(SearchCriteria scri) throws Exception {
		return dao.list(scri);
	}

	// save posts
	@Override
	public void savePost(MemberBoardVO vo) throws Exception {
		dao.savePost(vo);
	}

	// check the saved post
	@Override
	public int savePostChk(MemberBoardVO vo) throws Exception {
		return dao.savePostChk(vo);
	}

	// report posts
	@Override
	public void reportPost(MemberBoardVO vo) throws Exception {
		dao.reportPost(vo);
	}

	// check the reported post
	@Override
	public int reportPostChk(MemberBoardVO vo) throws Exception {
		return dao.reportPostChk(vo);
	}

	// select the list of saved posts
	@Override
	public List<BoardVO> savedPostList(MemberVO vo) throws Exception {
		return dao.savedPostList(vo);
	}

	// select the list of saved posts
	@Override
	public List<BoardVO> reportedPostList() throws Exception {
		return dao.reportedPostList();
	}

	// select the list of your posts
	@Override
	public List<BoardVO> yourPostList(MemberVO vo) throws Exception {
		return dao.yourPostList(vo);
	}

}