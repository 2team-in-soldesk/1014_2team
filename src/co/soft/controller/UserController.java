package co.soft.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.soft.beans.UserBean;
import co.soft.service.UserService;

@Controller
@RequestMapping(value="/user")
public class UserController {

	@Autowired
	UserService userservice;
	
	@GetMapping("/join")
	public String userJoin(@ModelAttribute("userbean")UserBean userbean) {
		return "user/join";
	}
	
	@PostMapping("/joinpass")
	public String userJoinPass(@Valid @ModelAttribute("userbean")UserBean userbean, BindingResult r) {
		if(r.hasErrors()) {
			return "user/join";
			
		}
		userservice.insertUser(userbean);
		return "user/joinpass";
	}
	
	@GetMapping("/select")
	public String userSelect(Model model) {
		List<UserBean> li=userservice.getUser();
		model.addAttribute("li",li);
		return "user/select";
	}
	
	@GetMapping("/login")
	public String login() {
		return "user/login";
	}
	
	@PostMapping("/loginpass")
	public String loginpass(HttpServletRequest request) {
		String id=request.getParameter("t_user_id");
		String pw=request.getParameter("t_user_pw");
		List<String> id_list=userservice.getId();
		List<String> pw_list=userservice.getPw();
		if(id_list.contains(id)&&pw_list.contains(pw)) {
			request.setAttribute("t_user_id",id);
			return "user/loginpass";
		}return "user/loginfail";
	}
	
	@GetMapping("/logout")
	public String logout() {
		return "user/logout";
	}
	
	@GetMapping("/user_delete")
	public String delete(HttpServletRequest request) {
		String t_user_id=request.getParameter("t_user_id");
		request.setAttribute("t_user_id",t_user_id);
		return "user/user_delete";
	}
	
	@PostMapping("/user_deletepass")
	public String deletepass(HttpServletRequest request, UserBean userbean) {
		String t_user_id=request.getParameter("t_user_id");
		
		// 사용자가 입력한 비밀번호 가져옴
		String t_user_pw=request.getParameter("t_user_pw");
		
		//전달된 아이디로 해당 유저의 데이터 가져와 객체에 저장
		userbean=userservice.getOneUserbean(t_user_id);
		//id로 얻어낸 디비값에 있는 비번과 사용자가 입력한 비번 비교
		if(userbean.getT_user_pw().equals(t_user_pw)) {
			// 비번 일치시 데이터 삭제 후 deletepass로 이동
			userservice.deleteUser(t_user_id);
			return "user/user_deletepass";
		}else {
			// 비번 불일치시 다시 탈퇴폼으로 이동
			request.setAttribute("t_user_id",t_user_id);
			return "user/user_delete_fail";
		}
		
		
	}
	
}
