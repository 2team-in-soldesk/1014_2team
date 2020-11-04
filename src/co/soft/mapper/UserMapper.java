package co.soft.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import co.soft.beans.UserBean;

public interface UserMapper {

	@Insert("insert into t_user values(#{t_user_name},#{t_user_id},#{t_user_pw},#{t_user_email},#{t_user_tel})")
	public void insertUser(UserBean userbean);
	
	@Select("select * from t_user")
	public List<UserBean> getUser();
	
	@Select("select t_user_id from t_user")
	public List<String> getId();

	@Select("select t_user_pw from t_user")
	public List<String> getPw();
}
