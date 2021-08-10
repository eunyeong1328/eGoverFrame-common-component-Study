package egovframework.example.sample.service.impl;

import java.util.List;

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
	//	목록출력	vo-> sql에 전달할 데이터
	public List<?> selectCodesList(CodeVO vo) {
		return list("codeDAO.selectCodesList",vo);
	}
	public int selectCodesCount(CodeVO vo) {
		return (int) select("codeDAO.selectCodesCount",vo);
	}
	public int deleteCodes(int code) {
		return delete("codeDAO.deleteCodes",code);
	}
	public CodeVO selectCodesDetail(int code) {
		return (CodeVO) select("codeDAO.selectCodeDetail",code);
	}
	public int codeModifyWrite(CodeVO vo) {
		return (int) update("codeDAO.updateCodes",vo);
	}



}
