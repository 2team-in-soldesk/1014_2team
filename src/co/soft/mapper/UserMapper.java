package co.soft.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import co.soft.beans.UserBean;

public interface UserMapper {

	// ȸ������
	@Insert("insert into t_user values(#{t_user_name},#{t_user_id},#{t_user_pw},#{t_user_email},#{t_user_tel})")
	public void insertUser(UserBean userbean);
	
	//ȸ�� ��ü����(���Ե�ϵȰ� Ȯ���Ϸ��� ����������-�׽�Ʈ)
	@Select("select * from t_user")
	public List<UserBean> getUser();
	
	// id �������� ����
	@Select("select t_user_id from t_user")
	public List<String> getId();

	// pw �������� ����
	@Select("select t_user_pw from t_user")
	public List<String> getPw();
	
	// id�� ���� �Ѹ��� ���� ������ �������� ����
	@Select("select * from t_user where t_user_id=#{t_user_id}")
	public UserBean getOneUserbean(String t_user_id);
	
	// Ż��
	@Delete("delete from t_user where t_user_id=#{t_user_id}")
	public void deleteUser(String t_user_id);
}
