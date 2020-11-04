package co.soft.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.soft.beans.CommentBean;
import co.soft.dao.CommentDao;

@Service
public class CommentService {

	@Autowired
	CommentDao c_dao;
	
	public  List<CommentBean> getComment(int t_no){
		return c_dao.getComment(t_no);
	}
	
	public void addcomment(CommentBean c_bean) {
		c_dao.addcomment(c_bean);
	}
	
	public int getCommentCount(int t_no) {
		return c_dao.getCommentCount(t_no);
	}
}
