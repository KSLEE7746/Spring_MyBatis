package kr.co.bit.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bit.board.service.BoardService;
import kr.co.bit.board.vo.BoardVO;

@Controller 
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService service;
	
	@RequestMapping("/list.do")
	public ModelAndView list() {
		
		List<BoardVO> list = service.selectAllBoard();
		ModelAndView mav = new ModelAndView("/board/list");
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping("/detail.do")
	public String detail(@RequestParam("no") int no, Model model){	
		BoardVO board = service.selectByNoBoard(no);
		model.addAttribute("board", board);
		
		return "board/detail";
		//System.out.println(" no : " + no);
		//System.out.println(board);
	}
	
	@RequestMapping("/{no}/detail.do")
	public ModelAndView detailNo(@PathVariable int no){	
		BoardVO board = service.selectByNoBoard(no);
		ModelAndView mav = new ModelAndView("/board/detail");
		mav.addObject("board", board);
		
		return mav;	
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.GET)
	public String writeForm(){
		System.out.println("get write do");
		return "board/writeForm";
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public String write(BoardVO board){	
		System.out.println("post write do");			
		service.insertBoard(board);	
		
		return "redirect:/board/list.do";
	}
	
	@RequestMapping(value="/{no}/update.do", method=RequestMethod.GET)
	public ModelAndView updateForm(@PathVariable int no){
		System.out.println("get update do");
		
		BoardVO board = service.selectByNoBoard(no);
		
		ModelAndView mav = new ModelAndView("/board/updateForm");
		mav.addObject("board", board);
		
		return mav;
	}	
	
	@RequestMapping(value="/{no}/update.do", method=RequestMethod.POST)
	public String update(BoardVO board){
	
		System.out.println("post update do");
		service.updateBoard(board);

		return "redirect:/board/list.do";
	}
	
	@RequestMapping("/{no}/delete.do")
	public String deleteForm(@PathVariable int no){
		System.out.println("delete");
		service.deleteBoard(no);
		return "redirect:/board/list.do";		
	}
}













