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
	
	
	public List<ToiletBean> getToiletBeans(){
		RowBounds row=new RowBounds(0,5);
		return t_dao.getToiletBean(row);
	}
}
