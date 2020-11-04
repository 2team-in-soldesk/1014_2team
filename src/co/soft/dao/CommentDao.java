package co.soft.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.soft.beans.CommentBean;
import co.soft.mapper.CommentMapper;

@Repository
public class CommentDao {

	@Autowired
	CommentMapper c_mapper;
	
	public List<CommentBean> getComment(int t_no){
		return c_mapper.getComment(t_no);
	}
	
	public void addcomment(CommentBean c_bean) {
		c_mapper.addcomment(c_bean);
	}
	
	public int getCommentCount(int t_no) {
		return c_mapper.getCommentCount(t_no);
	}
}
