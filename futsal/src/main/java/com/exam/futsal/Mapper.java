package com.exam.futsal;

import java.util.ArrayList;

import model.BoardTO;

public interface Mapper {
	public abstract ArrayList<BoardTO> boardList(Integer pageStart);
	public abstract int boardTotal();
	public abstract void boardSeq();
	public abstract int boardWriteOk(BoardTO to);
	public abstract BoardTO boardView(String seq);
	public abstract void boardViewHit(String seq);
	public abstract BoardTO boardModify(String seq);
	public abstract int boardModifyOk(BoardTO to);
	public abstract BoardTO boardDelete(String seq);
	public abstract int boardDeleteOk(BoardTO to);
}
