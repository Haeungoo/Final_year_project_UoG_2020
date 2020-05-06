package com.fyp.controller;

import java.io.File;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fyp.service.BoardService;
import com.fyp.service.ChatService;
import com.fyp.service.CommentService;
import com.fyp.vo.BoardVO;
import com.fyp.vo.CommentVO;
import com.fyp.vo.MemberBoardVO;
import com.fyp.vo.PageMaker;
import com.fyp.vo.SearchCriteria;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService service;
	
	@Inject
	CommentService commentService;
	
	@Inject
	ChatService chatService;
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! the client locale is "+ locale.toString());
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/board/home";
	}
	
	
	//form of the post
	@RequestMapping(value = "/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception{
		logger.info("writeView");
		
	}
	
	//create a post
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(BoardVO boardVO, MultipartHttpServletRequest fypRequest) throws Exception{
		logger.info("write");	
		service.write(boardVO, fypRequest);
		
		return "redirect:/board/list";
	}

	
	//select the list of posts
	@RequestMapping(value = "/list", method=RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		logger.info("list");
		
		model.addAttribute("list", service.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker",pageMaker);
		
		return "board/list";
	}
	
	
	//select the post
	@RequestMapping(value="/readView", method=RequestMethod.GET)
	public String read(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		logger.info("read");
		
		model.addAttribute("read",service.read(boardVO.getBno()));
		model.addAttribute("scri",scri);
		
		List<CommentVO> commentList = commentService.readComment(boardVO.getBno());
		model.addAttribute("commentList",commentList);
		
		List<Map<String, Object>> fileList = service.selectFileList(boardVO.getBno());
		model.addAttribute("file",fileList);
		return "board/readView";
	}
	
	//Update View
	@RequestMapping(value="/updateView", method=RequestMethod.GET)
	public String updateView(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		logger.info("updateView");
		
		model.addAttribute("update", service.read(boardVO.getBno()));
		model.addAttribute("scri", scri);
		
		List<Map<String, Object>> fileList = service.selectFileList(boardVO.getBno());
		model.addAttribute("file", fileList);
		return "board/updateView";
	}
	
	//Update 
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String update(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, 
			RedirectAttributes rttr, 
			@RequestParam(value="fileNoDel[]") String[] files, // Number of files to delete
			@RequestParam(value="fileNameDel[]") String[] fileNames, // Name of files to delete 
			MultipartHttpServletRequest fypRequest) throws Exception{
		
		logger.info("update");
		service.update(boardVO, files, fileNames, fypRequest);
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
	
		return "redirect:/board/list";
	}

	//delete the post
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("delete");
		
		service.delete(boardVO.getBno());
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/list";
	}
	
	//insert the comment
	@RequestMapping(value="/commentWrite", method=RequestMethod.POST)
	public String commentWrite(CommentVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("comment Write");
		
		commentService.writeComment(vo);
		
		rttr.addAttribute("bno",vo.getBno());
		rttr.addAttribute("page",scri.getPage());
		rttr.addAttribute("perPageNum",scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/readView";
	}
	
	//Comment Update (GET)
	@RequestMapping(value="/commentUpdateView", method=RequestMethod.GET)
	public String commentUpdateView(CommentVO vo, SearchCriteria scri, Model model) throws Exception{
		logger.info("comment Update");
		
		model.addAttribute("commentUpdate", commentService.selectComment(vo.getRno()));
		model.addAttribute("scri",scri);
		
		return "board/commentUpdateView";
	}
	
	//Comment Update (POST)
	@RequestMapping(value="/commentUpdate", method=RequestMethod.POST)
	public String commentUpdate(CommentVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("comment Update");

		commentService.updateComment(vo);
		
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());	
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/readView";
	}

	//Comment Delete (GET)
	@RequestMapping(value="/commentDeleteView", method=RequestMethod.GET)
	public String commentDeleteView(CommentVO vo, SearchCriteria scri, Model model) throws Exception{
		logger.info("comment Delete");
		
		model.addAttribute("commentDelete", commentService.selectComment(vo.getRno()));
		model.addAttribute("scri",scri);
		
		return "board/commentDeleteView";
	}
	
	//Comment Delete (POST)
	@RequestMapping(value="/commentDelete", method=RequestMethod.POST)
	public String commentDelete(CommentVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("comment Delete");
		
		commentService.deleteComment(vo);
		
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
	
		return "redirect:/board/readView";
	}
	
	//File download (Reference: https://melonpeach.tistory.com/53?category=806570)
	@RequestMapping(value="/fileDown")
	public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception{
		Map<String, Object> resultMap = service.selectFileInfo(map);
		String storedFileName = (String) resultMap.get("STORED_FILE_NAME");
		String originalFileName = (String) resultMap.get("ORG_FILE_NAME");
		
		//Read the attachment and return it in byte[] format
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("C:\\fyp\\file\\"+storedFileName));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}

	
	//like the post
	@RequestMapping(value = "/like", method = RequestMethod.POST)
	public String like(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("like");
		
		service.boardHeart(boardVO.getBno());
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/list";
	}	
	
	
}

 