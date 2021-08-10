package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.CodeService;
import egovframework.example.sample.service.CodeVO;
//ServiceImpl은 구체적인 프로그램 작성이 이루어짐
@Service("codeService") //Service파일을 Service한다는 의미이다.
public class CodeServiceImpl implements CodeService{
	
	//다른 클래스(CodeDAO)를 사용하기 위해서는  리소스@(어노테이션) 설정하기
	@Resource(name = "codeDAO")
	private CodeDAO codeDAO;

	@Override
	public String insertCodes(CodeVO vo) throws Exception {
		return codeDAO.insertCodes(vo);
	}

	@Override //다형성(오버라이딩 객체지향의 3대 요소)
	public List<?> selectCodesList(CodeVO vo) throws Exception {
		return codeDAO.selectCodesList(vo);
	}
}
