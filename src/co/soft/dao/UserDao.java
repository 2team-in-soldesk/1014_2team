package co.soft.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.soft.beans.UserBean;
import co.soft.mapper.UserMapper;

@Repository
public class UserDao {

	@Autowired
	private UserMapper usermapper;
	
	public void insertUser(UserBean userbean) {
		usermapper.insertUser(userbean);
	}
	
	public List<UserBean> getUser(){
		return usermapper.getUser();
	}
}
