package co.soft.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import co.soft.beans.CommentBean;
import co.soft.beans.PageNumBean;
import co.soft.service.CommentService;

@Controller
@RequestMapping(value="/comment")
public class CommentController {

	@Autowired
	private CommentService c_service;
	
	@GetMapping("/commentlist")
	public String commentlist(HttpServletRequest request,
			Model model,
			@ModelAttribute(value="commentbean") CommentBean commentbean) {
		
		int t_no=Integer.parseInt(request.getParameter("t_no"));
		
		String current_page_num=request.getParameter("current_page_num");
		if(current_page_num==null) {
			current_page_num="1";
		}
		int current=Integer.parseInt(current_page_num);
		
		// �˻��� ��� �ڸ�Ʈ ���� ����
		int total_list=c_service.getCommentCount(t_no);
		
		// �������� �Ű����� �����ؼ� jsp�� ����
		PageNumBean pagenumbean=new PageNumBean(current, total_list);
		model.addAttribute("pagenumbean", pagenumbean);
		
		List<CommentBean> li=c_service.getComment(t_no); 
		model.addAttribute("li",li);
		model.addAttribute("t_no",t_no);
		return "comment/commentlist";
	}
	
	@PostMapping("/add_comment")
	public String addcomment(HttpServletRequest request,
			CommentBean commentbean) {
		String t_user_id=request.getParameter("t_user_id");
		request.setAttribute("t_user_id", t_user_id);
		System.out.println(t_user_id);
		
		String t_no=request.getParameter("t_no");
		String com=request.getParameter("t_com_com");
		String score=request.getParameter("t_com_score");
		String profileimg=request.getParameter("t_com_profileimg");
		commentbean.setT_com_com(com);
		commentbean.setT_com_score(Integer.parseInt(score));
		commentbean.setT_user_id(t_user_id);
		commentbean.setT_no(Integer.parseInt(t_no));
		commentbean.setT_com_profileimg(profileimg);
		request.setAttribute("t_no",t_no);
		c_service.addcomment(commentbean);
		return "comment/add_comment";
	}
	
}
