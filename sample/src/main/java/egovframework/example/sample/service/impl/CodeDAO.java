package egovframework.example.sample.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.CodeService;
import egovframework.example.sample.service.CodeVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

//sql과 직접적인 연결
@Repository("codeDAO") //!!반드시 설정!!!
public class CodeDAO extends EgovAbstractDAO{

	public String insertCodes(CodeVO vo){
							//" 해당 클래스 이름, ID이름 " 
		return (String) insert("codeDAO.insertCodes",vo);
	}



}
