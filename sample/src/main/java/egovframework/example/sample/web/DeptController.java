package egovframework.example.sample.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.DeptVO;
//@Annotation(시스템 주석) : 기능
@Controller//웹 주소에 대한 인식
public class DeptController {

	@RequestMapping(value ="/deptWrite.do")//웹 주소에 대한 실행
	public String deptWrite() { //주소에 대한 실행은 메소드가 담당
		
		return "dept/deptWrite";  //jsp 위치 경로가 웹 화면에 출력
	}
//☆☆JSP의 name과 Controller의 메서드의 매개변수와 동일하게 입력되어야 한다.
	@RequestMapping(value ="/deptWriteSave.do")//저장버튼 클릭 시 
	public String deptWriteSave(DeptVO vo) { //매개변수에 데이터가 안착
		System.out.println("부서번호 : " + vo.getDeptno());
		System.out.println("부서이름 : " + vo.getDname());
		System.out.println("부서위치 : " + vo.getLoc());
		
		return "";
	}
}
