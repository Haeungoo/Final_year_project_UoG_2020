package com.fyp.dao;

import java.util.List;

import com.fyp.vo.BoardVO;
import com.fyp.vo.MemberBoardVO;
import com.fyp.vo.MemberVO;
import com.fyp.vo.SearchCriteria;

public interface MemberDAO {

	// register
	public void register(MemberVO vo) throws Exception;

	// login
	public MemberVO login(MemberVO vo) throws Exception;

	// modify
	public void memberUpdate(MemberVO vo) throws Exception;

	// delete
	public void memberDelete(MemberVO vo) throws Exception;

	// check the password
	public int passChk(MemberVO vo) throws Exception;

	// id duplicate check
	public int idChk(MemberVO vo) throws Exception;

	// select the list of members
	public List<MemberVO> list(SearchCriteria scri) throws Exception;

	// save the posts
	public void savePost(MemberBoardVO vo) throws Exception;

	// check the saved post
	public int savePostChk(MemberBoardVO vo) throws Exception;
	
	// report the posts
	public void reportPost(MemberBoardVO vo) throws Exception;

	// check the reported post
	public int reportPostChk(MemberBoardVO vo) throws Exception;

	// select the list of saved posts
	public List<BoardVO> savedPostList(MemberVO vo) throws Exception;
	
	// select the list of reported posts
	public List<BoardVO> reportedPostList() throws Exception;

	// select the list of your posts
	public List<BoardVO> yourPostList(MemberVO vo) throws Exception;

}