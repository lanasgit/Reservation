package com.exam.futsal;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.BoardListTO;
import model.BoardTO;

@Controller
public class BoardController {
	
	@Autowired
	private Mapper mapper;
	
	@RequestMapping("list.do")
	public String list(HttpServletRequest request, Model model) {	
		
		int cpage = 1;
		if (request.getParameter("cpage") != null && !request.getParameter("cpage").equals("")) {
			cpage = Integer.parseInt(request.getParameter("cpage"));
		}
		BoardListTO listTO = new BoardListTO();
		listTO.setCpage(cpage);
		listTO.setTotalRecord(mapper.boardTotal());
		
		int recordPerPage = listTO.getRecordPerPage();
		int blockPerPage = listTO.getBlockPerPage();
		int totalRecord = listTO.getTotalRecord();
		
		listTO.setTotalPage(((totalRecord - 1) / recordPerPage) + 1);
		listTO.setStartBlock(((cpage - 1) / blockPerPage) * blockPerPage + 1);
		listTO.setEndBlock(((cpage - 1) / blockPerPage) * blockPerPage + blockPerPage);
		if (listTO.getEndBlock() >= listTO.getTotalPage()) {
			listTO.setEndBlock (listTO.getTotalPage());
		}
		int pageStart = (cpage - 1) * recordPerPage;
		
		ArrayList<BoardTO> list = mapper.boardList(pageStart);
		listTO.setBoardLists(list);
		
		model.addAttribute("listTO", listTO);
		
		return "board_list";
	}
	
	@RequestMapping("write.do")
	public String boardWrite(HttpServletRequest request, Model model) {
		
		model.addAttribute("cpage", request.getParameter("cpage"));
		
		return "board_write";
	}
	
	@RequestMapping("write_ok.do")
	public String boardWriteOk(HttpServletRequest request, Model model) {
		
		// 자동 증가 컬럼(seq) 초기화
		mapper.boardSeq();
				
		BoardTO to = new BoardTO();
		to.setName(request.getParameter("name"));
		to.setSubject(request.getParameter("subject"));
		to.setPassword(request.getParameter("password"));
		to.setContent(request.getParameter("content"));
		to.setEmail(request.getParameter("email1") + "@" + request.getParameter("email2"));
		
		int flag = mapper.boardWriteOk(to);
		
		model.addAttribute("flag", flag);
		
		return "board_write_ok";
	}
	
	@RequestMapping("view.do")
	public String boardView(HttpServletRequest request, Model model) {
		
		String cpage = request.getParameter("cpage");
		String seq = request.getParameter("seq");
		
		// 조회수 증가
		mapper.boardViewHit(seq);
				
		BoardTO to = new BoardTO();
		to = mapper.boardView(seq);
		
		model.addAttribute("cpage", cpage);
		model.addAttribute("to", to);
		
		return "board_view";
	}
	
	@RequestMapping("modify.do")
	public String boardModify(HttpServletRequest request, Model model) {
		
		String cpage = request.getParameter("cpage");
		String seq = request.getParameter("seq");
		
		BoardTO to = mapper.boardModify(seq);
		
		model.addAttribute("cpage", cpage);
		model.addAttribute("to", to);
		
		return "board_modify";
	}
	
	@RequestMapping("modify_ok.do")
	public String boardModifyOk(HttpServletRequest request, Model model) {
		
		String cpage = request.getParameter("cpage");
		String seq = request.getParameter("seq");
		
		BoardTO to = new BoardTO();	
		to.setSeq(seq);
		to.setName(request.getParameter("name"));
		to.setSubject(request.getParameter("subject"));
		to.setPassword(request.getParameter("password"));
		to.setContent(request.getParameter("content"));
		to.setEmail(request.getParameter("email1") + "@" + request.getParameter("email2"));
		
		int flag = mapper.boardModifyOk(to);
			
		model.addAttribute("cpage", cpage);
		model.addAttribute("seq", seq);
		model.addAttribute("flag", flag);
		
		return "board_modify_ok";
	}
	
	@RequestMapping("delete.do")
	public String boardDelete(HttpServletRequest request, Model model) {
		
		String cpage = request.getParameter("cpage");
		String seq = request.getParameter("seq");
		
		BoardTO to = mapper.boardDelete(seq);
		
		model.addAttribute("cpage", cpage);
		model.addAttribute("to", to);
		
		return "board_delete";
	}
	
	@RequestMapping("delete_ok.do")
	public String boardDeleteOk(HttpServletRequest request, Model model) {
		
		BoardTO to = new BoardTO();
		to.setSeq(request.getParameter("seq"));
		to.setPassword(request.getParameter("password"));
		
		int flag = mapper.boardDeleteOk(to);
		
		model.addAttribute("flag", flag);
		
		return "board_delete_ok";
	}
	
}
