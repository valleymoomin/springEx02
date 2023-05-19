package org.moominzero.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.moominzero.domain.BoardVO;
import org.moominzero.domain.Criteria;

public interface BoardMapper {

//	@Select("select * from tbl_board where bno>0")
	public List<BoardVO> getList();

	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	//MyBatis # --> ? (Preparestatement) --> getter, setter
	
	//리턴타입(나중에설정), 메서드이름, 메서드파라미터
	
	//insert 처리
	public void insert(BoardVO board);
	
	public void insertSelectKey(BoardVO board);

	
	//read(select)처리
	public BoardVO read(Long bno);
	
	//delete처리
	public int delete(Long bno);
	
	
	//update처리
	public int update(BoardVO board);
	
	public int getTotalCount(Criteria cri);
	
	
	List<BoardVO> searchTest(Map<String, Map<String,String>> map);
	//map 안에 또 map
	
	
	
}
