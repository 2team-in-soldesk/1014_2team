package co.soft.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import co.soft.beans.CommentBean;

public interface CommentMapper {

	@Select("select * from t_comment where t_no=#{t_no} order by t_com_date desc")
	List<CommentBean> getComment(int t_no);
	
	@Insert("insert into t_comment values(t_com_seq.nextval,#{t_com_profileimg} ,#{t_user_id}, #{t_no},#{t_com_score},#{t_com_com}, null,sysdate)")
	void addcomment(CommentBean c_bean);
	
	// 등록된 후기의 총 개수 구하는 쿼리문
	@Select("select count(*) from t_comment where t_no=#{t_no}")
	int getCommentCount(int t_no);	
}
