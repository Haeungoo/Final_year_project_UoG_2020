package com.fyp.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fyp.dao.BoardDAO;
import com.fyp.util.FileUtils;
import com.fyp.vo.BoardVO;
import com.fyp.vo.SearchCriteria;

@Service
public class BoardServiceImpl implements BoardService {
	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	@Inject
	private BoardDAO dao;

	// create a post
	@Override
	public void write(BoardVO boardVO, MultipartHttpServletRequest fypRequest) throws Exception {
		dao.write(boardVO);

		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(boardVO, fypRequest);
		int size = list.size();
		for (int i = 0; i < size; i++) {
			dao.insertFile(list.get(i));
		}
	}

	// select the list of posts
	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
		return dao.list(scri);
	}

	// total number of posts
	public int listCount(SearchCriteria scri) throws Exception {
		return dao.listCount(scri);
	}

	// select the post
	// Transaction (Reference: https://melonpeach.tistory.com/55?category=806570)
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO read(int bno) throws Exception {
		dao.boardHit(bno);
		return dao.read(bno);
	}

	// update the post
	@Override
	public void update(BoardVO boardVO) throws Exception {
		dao.update(boardVO);
	}

	// delete the post
	@Override
	public void delete(int bno) throws Exception {
		dao.delete(bno);
	}

	// Attachment lookup
	@Override
	public List<Map<String, Object>> selectFileList(int bno) throws Exception {
		return dao.selectFileList(bno);
	}

	// Attachment download
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return dao.selectFileInfo(map);
	}

	// Attachment update
	@Override
	public void update(BoardVO boardVO, String[] files, String[] fileNames, MultipartHttpServletRequest fypRequest)
			throws Exception {
		dao.update(boardVO);

		List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(boardVO, files, fileNames, fypRequest);
		Map<String, Object> tempMap = null;
		int size = list.size();
		for (int i = 0; i < size; i++) {
			tempMap = list.get(i);
			if (tempMap.get("IS_NEW").equals("Y")) {
				dao.insertFile(tempMap);
			} else {
				dao.updateFile(tempMap);
			}

		}

	}
	// Board Like Count
	@Override
	public void boardHeart(int bno) throws Exception {
		dao.boardHeart(bno);
	}	
}