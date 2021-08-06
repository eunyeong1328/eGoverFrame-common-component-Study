package egovframework.example.sample.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller//서버가 인식할 수 있는 주석을 설정해야 한다.
public class DeptController {

	@RequestMapping(value ="/deptWrite.do")
	public String deptWrite() { 
		
		return "dept/deptWrite";  //jsp 위치 경로
	}
}
