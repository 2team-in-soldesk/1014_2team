package co.soft.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.soft.beans.ToiletBean;
import co.soft.service.ToiletService;

@Controller
@RequestMapping("/toilet")
public class ToiletController {
	
	@Autowired
	ToiletService t_service;
	
	@GetMapping("/list")
	public String list(Model model, HttpServletRequest request ) {
		String searchKey=request.getParameter("searchKey");
		List<ToiletBean> li=t_service.getToiletBeans(searchKey);
		model.addAttribute("li", li);
		return "toilet/list";
	}

}
