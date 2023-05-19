package org.moominzero.controller;

import org.moominzero.domain.BoardVO;
import org.moominzero.domain.Criteria;
import org.moominzero.domain.PageDTO;
import org.moominzero.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	
	private BoardService service; //BoardServiceImpl이 아님!
	
//	@GetMapping("/list") //uri O, void타입 -> 동일한이름의 jsp페이지를 찾는다.
//	public void list(Model model) {
//		log.info("list");
//		model.addAttribute("list", service.getList());
//	}
	
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("list: "+ cri);
		model.addAttribute("list", service.getList(cri));
//		model.addAttribute("pageMaker", new PageDTO(cri,123));
		
		int total = service.getTotal(cri);
		log.info("total: "+ total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	
	
	
	
	//등록
	@GetMapping("/register")
	public void registerGET() {
		
	}
	
	
	//등록
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("register: "+ board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno()); //아주 잠깐만 결과만 보내는 방식 1번만전송이 되고, 브라우저 주소창에는 나오지않는다.**
		//잠깐 http session쪽에서 들어가는것임.
		
//		rttr.addAttribute  //브라우저의 링크랑 같이 연결이된다. 
		return "redirect:/board/list"; //이 뒤에 파라미터 따라붙는방식
	}
	
	//조회 + 수정
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get or modify");
		model.addAttribute("board", service.get(bno));
	}
	
	//수정
	@PostMapping("/modify")
	public String modify(BoardVO board,  Criteria cri, RedirectAttributes rttr) {
		log.info("modify: " + board);
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		//redirect 방식으로 데이터를 주고받으면, 모델에 담아봤자, 브라우저는 거기서 끝나고 새로 요구하는것이기때문에 모델에담아봤자 쓸모없다.
		//링크를 갖다 붙여줘야한다.
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		
		return "redirect:/board/list";
	}
	
	
	//삭제 (반드시 Post방식으로만 처리)
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr) {
		log.info("remove..." + bno);
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
			
			
		}
		
		//redirect 방식으로 데이터를 주고받으면, 모델에 담아봤자, 브라우저는 거기서 끝나고 새로 요구하는것이기때문에 모델에담아봤자 쓸모없다.
		//링크를 갖다 붙여줘야한다.
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list";
	}
	
	
	
	
	
	
	
	
	
	
}
