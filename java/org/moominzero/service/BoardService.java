package org.moominzero.service;

import java.util.List;

import org.moominzero.domain.BoardVO;
import org.moominzero.domain.Criteria;

public interface BoardService { //메서드 이름 => 현실적인 로직이름을 붙인다.
	
	public void register(BoardVO board);
	
	
	public Long register2(BoardVO board);
	public BoardVO get(Long bno);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(Long bno);
	
	public List<BoardVO> getList();
	public List<BoardVO> getList(Criteria cri);
	
	
	
	public int getTotal(Criteria cri);
	
}
