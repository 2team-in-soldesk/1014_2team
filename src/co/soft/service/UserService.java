package co.soft.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.soft.beans.UserBean;
import co.soft.dao.UserDao;

@Service
public class UserService {

	@Autowired
	UserDao userdao;
	
	public void insertUser(UserBean userbean) {
		userdao.insertUser(userbean);
	}
	
	public List<UserBean> getUser(){
		return userdao.getUser();
	}

	public List<String> getId(){
		return userdao.getId();
	}
	
	public List<String> getPw(){
		return userdao.getPw();
	}
}
