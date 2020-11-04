package co.soft.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.soft.beans.ToiletBean;
import co.soft.dao.ToiletDao;

@Service
public class ToiletService {

	@Autowired
	ToiletDao t_dao;
	
	
	public List<ToiletBean> getToiletBeans(String searchKey){
		return t_dao.getToiletBean(searchKey);
	}
	
	public ToiletBean getOneToilet(int t_no) {
		return t_dao.getOneToilet(t_no);
	}
	
	public int getToiletCount(String searchKey) {
		return t_dao.getToiletCount(searchKey);
	}
}
