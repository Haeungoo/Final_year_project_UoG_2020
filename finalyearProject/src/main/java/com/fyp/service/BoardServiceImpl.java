package com.fyp.service;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.fyp.dao.BoardDAO;
import com.fyp.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService{
	@Inject
	private BoardDAO dao;
	@Override
	public void write(BoardVO boardVO) throws Exception{
		dao.write(boardVO);
	}
}