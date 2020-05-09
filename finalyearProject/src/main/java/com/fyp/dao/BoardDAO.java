package com.fyp.dao;

import java.util.List;
import java.util.Map;

import com.fyp.vo.BoardVO;
import com.fyp.vo.SearchCriteria;

public interface BoardDAO {
	// create a post
	public void write(BoardVO boardVO) throws Exception;

	// select the list of posts
	public List<BoardVO> list(SearchCriteria scri) throws Exception;
	
	// total number of posts
	public int listCount(SearchCriteria scri) throws Exception;

	// select the post
	public BoardVO read(int bno) throws Exception;

	// update the post
	public void update(BoardVO boardVO) throws Exception;

	// delete the post
	public void delete(int bno) throws Exception;

	// upload Attachment
	public void insertFile(Map<String, Object> map) throws Exception;

	// Attachment lookup
	public List<Map<String, Object>> selectFileList(int bno) throws Exception;

	// Attachment download
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;

	// Attachment update
	public void updateFile(Map<String, Object> map) throws Exception;

	// Board View Count
	public void boardHit(int bno) throws Exception;
	
	// Board Like Count
	public void boardHeart(int bno) throws Exception;

	

}