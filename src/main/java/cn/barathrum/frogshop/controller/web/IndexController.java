package cn.barathrum.frogshop.controller.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {
	
	@RequestMapping(value={"/","/index","/index.do","/index.html","index.action"},method=RequestMethod.GET)
	public String index() {
		System.out.println("adfsssss");
		return "home/home";
	}
	
	@RequestMapping("/person/index.html")
	public String personIndex() {
		return "person/index";
	}
}
