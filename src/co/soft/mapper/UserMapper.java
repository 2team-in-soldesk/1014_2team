package co.soft.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import co.soft.beans.UserBean;

public interface UserMapper {

	// 회원가입
	@Insert("insert into t_user values(#{t_user_name},#{t_user_id},#{t_user_pw},#{t_user_email},#{t_user_tel})")
	public void insertUser(UserBean userbean);
	
	//회원 전체보기(가입등록된거 확인하려고 만든쿼리문-테스트)
	@Select("select * from t_user")
	public List<UserBean> getUser();
	
	// id 가져오는 쿼리
	@Select("select t_user_id from t_user")
	public List<String> getId();

	// pw 가져오는 쿼리
	@Select("select t_user_pw from t_user")
	public List<String> getPw();
	
	// id를 통해 한명의 유저 데이터 가져오는 쿼리
	@Select("select * from t_user where t_user_id=#{t_user_id}")
	public UserBean getOneUserbean(String t_user_id);
	
	// 탈퇴
	@Delete("delete from t_user where t_user_id=#{t_user_id}")
	public void deleteUser(String t_user_id);
}
