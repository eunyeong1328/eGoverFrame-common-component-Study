package egovframework.example.sample.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.CodeService;
import egovframework.example.sample.service.CodeVO;

@Controller
public class CodeController {
	
	@Resource(name = "codeService")
	private CodeService codeService;
	
	@RequestMapping(value = "/codeWrite.do")
	public String codeWrite(){
		
		return "code/codeWrite";
	}
	
	@RequestMapping(value = "/codeWriteSave.do")
	public String insertCode(CodeVO vo) throws Exception{
		
		//String result = null;성공여부를 null값으로 return해준다.
		//insert는 그냥 오류를 뱉는다.
		String result = codeService.insertCodes(vo);
		if(result == null) { //이게 성공!!
			System.out.println("저장완료");
		}else {//이게 실패!!
			System.out.println("저장실패");
		}
		//UPDATE, DELETE 숫자 형태로 return(결과)를 알려준다.-->실패 시(저장 안될 시)= 0
		return "redirect:codeList.do"; //이 페이지로 이동
	}
}
