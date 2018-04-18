package cn.barathrum.frogshop.controller.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	@RequestMapping(value={"/","/index","/index.do","/index.html","index.action"})
	public String index() {
		System.out.println("adfsssss");
		return "home";
	}
}
