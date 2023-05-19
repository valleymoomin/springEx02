package org.moominzero.service;

import java.util.List;

import org.moominzero.domain.Criteria;
import org.moominzero.domain.ReplyVO;
import org.moominzero.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyMapper mapper;
	
	
	@Override
	public int register(ReplyVO vo) {
		log.info("register........."+ vo);
	
	
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long rno) {
		// TODO Auto-generated method stub
		
		log.info("get..............."+rno);
		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyVO vo) {
		// TODO Auto-generated method stub
		
		log.info("modify.................."+vo);
		return mapper.update(vo);
	}

	@Override
	public int remove(Long rno) {
		// TODO Auto-generated method stub
		log.info("remove............"+rno);
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		// TODO Auto-generated method stub
		log.info("get Reply List of a Board "+ bno);
		return mapper.getListWithPaging(cri, bno);
	}

}
