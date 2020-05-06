package com.fyp.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.fyp.vo.BoardVO;
import com.fyp.vo.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Inject
	private SqlSession sqlSession;

	// create a post
	@Override
	public void write(BoardVO boardVO) throws Exception {
		sqlSession.insert("boardMapper.insert", boardVO);
	}

	// select the list of posts
	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("boardMapper.listPage", scri);
	}

	// total number of posts
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("boardMapper.listCount", scri);
	}

	// select the post
	@Override
	public BoardVO read(int bno) throws Exception {
		return sqlSession.selectOne("boardMapper.read", bno);

	}

	// update the post
	@Override
	public void update(BoardVO boardVO) throws Exception {
		sqlSession.update("boardMapper.update", boardVO);
	}

	// delete the post
	@Override
	public void delete(int bno) throws Exception {
		sqlSession.delete("boardMapper.delete", bno);
	}

	// upload Attachment
	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		sqlSession.insert("boardMapper.insertFile", map);
	}

	// Attachment lookup
	// Why I picked the List type => to accept various kind of file(.jpg,.png, etc.)
	@Override
	public List<Map<String, Object>> selectFileList(int bno) throws Exception {
		return sqlSession.selectList("boardMapper.selectFileList", bno);
	}

	// Attachment download
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne("boardMapper.selectFileInfo", map);
	}

	// Attachment update
	@Override
	public void updateFile(Map<String, Object> map) throws Exception {
		sqlSession.update("boardMapper.updateFile", map);
	}

	// Board View Count
	@Override
	public void boardHit(int bno) throws Exception {
		sqlSession.update("boardMapper.boardHit", bno);
	}
	
	// Board Like Count
	@Override
	public void boardHeart(int bno) throws Exception {
		sqlSession.update("boardMapper.boardHeart", bno);
	}
}