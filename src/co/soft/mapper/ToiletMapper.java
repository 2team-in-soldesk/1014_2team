package co.soft.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;

import co.soft.beans.ToiletBean;


public interface ToiletMapper {

	// �˻� Ű����� ȭ��� ������ �������� ������
	@Select("select * from toilet where t_nm_name like '%'||#{searchKey}||'%' or t_m_name like '%'||#{searchKey}||'%'")
	List<ToiletBean> getToiletBean(String searchKey);
	
	// �Ű������� ���� ȭ��� �⺻Ű�� ���� �ϳ��� ȭ��� ������ �������� ������
	@Select("select * from toilet where t_no=#{t_no}")
	ToiletBean getOneToilet(int t_no);
	
	// �˻��� ȭ����� �� ���� ���ϴ� ������
	@Select("select count(*) from toilet where t_nm_name like '%'||#{searchKey}||'%' or t_m_name like '%'||#{searchKey}||'%'")
	int getToiletCount(String searchKey);
}
