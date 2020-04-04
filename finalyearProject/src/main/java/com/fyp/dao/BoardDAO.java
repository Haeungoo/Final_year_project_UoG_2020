package com.fyp.dao;

import com.fyp.vo.BoardVO;

public interface BoardDAO{
	public void write(BoardVO boardVO) throws Exception;
}