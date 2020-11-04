package co.soft.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;

import co.soft.beans.ToiletBean;


public interface ToiletMapper {

	// 검색 키워드로 화장실 데이터 가져오는 쿼리문
	@Select("select * from toilet where t_nm_name like '%'||#{searchKey}||'%' or t_m_name like '%'||#{searchKey}||'%'")
	List<ToiletBean> getToiletBean(String searchKey);
	
	// 매개변수에 넣은 화장실 기본키를 가진 하나의 화장실 데이터 가져오는 쿼리문
	@Select("select * from toilet where t_no=#{t_no}")
	ToiletBean getOneToilet(int t_no);
	
	// 검색한 화장실의 총 개수 구하는 쿼리문
	@Select("select count(*) from toilet where t_nm_name like '%'||#{searchKey}||'%' or t_m_name like '%'||#{searchKey}||'%'")
	int getToiletCount(String searchKey);
}
