package co.soft.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;

import co.soft.beans.ToiletBean;


public interface ToiletMapper {

	@Select("select * from toilet where t_nm_name like '%'||#{searchKey}||'%' or t_m_name like '%'||#{searchKey}||'%'")
	List<ToiletBean> getToiletBean(RowBounds row, String searchKey);
}
