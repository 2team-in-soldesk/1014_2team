package co.soft.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.soft.beans.ToiletBean;
import co.soft.mapper.ToiletMapper;

@Repository
public class ToiletDao {

	@Autowired
	private ToiletMapper t_mapper;
	
	public List<ToiletBean> getToiletBean(RowBounds row){
		return t_mapper.getToiletBean(row);
	}
}
