package org.moominzero.service;

import java.util.List;

import org.moominzero.domain.BoardVO;
import org.moominzero.domain.Criteria;
import org.moominzero.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@ToString
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{
	
	//spring 4.3이상에서 자동처리 -단일 파라미터를 받는 생성자의 경우, 필요한 파라미터를 자동으로 주입가능
//	@Autowired
	private BoardMapper mapper;
	//BoardServiceImpl(BoardMapper) <- @AllArgsConstructor    boardmapper를 주입받는 생성자가 만들어지게된다.
	
	//final
	
	
	
	@Override
	public void register(BoardVO board) {
		log.info("register......... "+ board);
		mapper.insertSelectKey(board);
		
	}

	@Override         //리턴값만 다르고 로직은 동일 (ServiceTest확인할것)
	public Long register2(BoardVO board) {
		// TODO Auto-generated method stub
		mapper.insertSelectKey(board);
		return board.getBno();
	}
	@Override
	public BoardVO get(Long bno) {
		// TODO :조회구현
		log.info("get........... "+ bno);
		
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		// TODO 수정구현
		log.info("modify........ "+board);
		return mapper.update(board)==1;
	}

	@Override
	public boolean remove(Long bno) {
		// TODO 삭제구현
		log.info("remove............. "+ bno );
		return mapper.delete(bno)==1;
	}

	@Override
	public List<BoardVO> getList() {
		// 목록구현
		log.info("getList.............");
		return mapper.getList();
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		
		log.info("get List with criteria: "+cri);
		
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		
		log.info("get total count");
		return mapper.getTotalCount(cri);
		
	
	}


	
}
