package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
	
	@RequestMapping(value = "/codeList.do")
	public String selectCodeList(CodeVO vo,ModelMap model) throws Exception{
		//총 갯수 출력
		int total = codeService.selectCodesCount(vo);
		List<?> list = codeService.selectCodesList(vo);
		
		model.addAttribute("resultTotal",total);
		model.addAttribute("resultList",list);
		return "code/codeList";
	}
	
	@RequestMapping(value = "/codeDelete.do")
	public String deleteCode(int code) throws Exception{
		int result = codeService.deleteCodes(code);
		return"redirect:codeList.do";
	}
	
	@RequestMapping(value = "/codeModifyWrite.do")
	public String selectCodesDetail(int code, ModelMap model) throws Exception{
		CodeVO vo = codeService.selectCodesDetail(code);
		model.addAttribute("vo",vo);
		return "code/codeModifyWrite";
	}
	
	@RequestMapping(value = "/codeModifySave.do")
	public String updateCodes(CodeVO vo) throws Exception{
		codeService.updateCodes(vo);
		return "redirect:/codeList.do";
	}
}
