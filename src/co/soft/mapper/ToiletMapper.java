package co.soft.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;

import co.soft.beans.ToiletBean;


public interface ToiletMapper {

	@Select("select * from toilet")
	List<ToiletBean> getToiletBean(RowBounds row);
}
