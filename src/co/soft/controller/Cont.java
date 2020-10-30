package co.soft.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import co.soft.beans.ToiletBean;
import co.soft.service.ToiletService;

@Controller
public class Cont {
	
	@GetMapping("/main")
	public String main() {
		
		return "main";
	}

}
