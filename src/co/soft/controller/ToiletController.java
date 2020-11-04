package co.soft.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.soft.beans.PageNumBean;
import co.soft.beans.ToiletBean;
import co.soft.service.ToiletService;

@Controller
@RequestMapping("/toilet")
public class ToiletController {
	
	
	@Autowired
	ToiletService t_service;
	
	@GetMapping("/list")
	public String list(Model model, HttpServletRequest request ) {
		// �˻��� �� ��������
		String searchKey=request.getParameter("searchKey");
		
		////////////////// �������� ��ü �̿��Ͽ� �Խ��� ���·� ���
		// ������ ��ȣ Ŭ���� �� ���޹���
		String current_page_num=request.getParameter("current_page_num");
		// ���޵� ���� ������-> ó�� ����Ʈ �������� �������� 1�� ����
		if(current_page_num==null) {
			current_page_num="1";
		}
		int current=Integer.parseInt(current_page_num);
		
		// �˻��� ��� ȭ��� ���� ����
		int total_list=t_service.getToiletCount(searchKey);
		
		// �������� �Ű����� �����ؼ� jsp�� ����
		PageNumBean pagenumbean=new PageNumBean(current, total_list);
		request.setAttribute("pagenumbean", pagenumbean);
		
		System.out.println("������: "+pagenumbean.getPage_num_min()+" "+pagenumbean.getPage_num_max());
		
		//////////////// id ����
		String t_user_id=request.getParameter("t_user_id");
		request.setAttribute("t_user_id", t_user_id);
		System.out.println(t_user_id);
		
		
		////////////////// üũ�ڽ� ���� �� ����
		String mwm=request.getParameter("mwm");
		String child=request.getParameter("child");
		String handicap=request.getParameter("handicap");
		
		if(mwm==null) {
			mwm="Y";
		}
		if(child==null) {
			child="0";
		}
		if(handicap==null) {
			handicap="0";
		}
		
		System.out.println("mwm: "+mwm);
		System.out.println("child: "+child);
		System.out.println("handicap: "+handicap);
		
		request.setAttribute("mwm",mwm);
		request.setAttribute("child",Integer.parseInt(child));
		request.setAttribute("handicap",Integer.parseInt(handicap));
		
		
		/////////////// �˻��� Ű���� ����
		
		request.setAttribute("searchKey", searchKey);
		List<ToiletBean> li=t_service.getToiletBeans(searchKey);
		model.addAttribute("li", li);
		return "toilet/list";
	}
	
	@GetMapping("/detail")
	public String detail(HttpServletRequest request) {
		String t_user_id=request.getParameter("t_user_id");
		request.setAttribute("t_user_id", t_user_id);
		System.out.println(t_user_id);
		
		int t_no=Integer.parseInt(request.getParameter("t_no"));
		ToiletBean oneToilet=t_service.getOneToilet(t_no);
		request.setAttribute("oneToilet", oneToilet);
		
		
		return "toilet/detail";
	}

}
