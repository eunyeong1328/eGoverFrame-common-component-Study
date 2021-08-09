package egovframework.example.sample.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.DeptVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("deptDAO")
public class DeptDAO extends EgovAbstractDAO { 
	//extends상속,상위클래스에 있는 메서드 
	public String InsertDept(DeptVO vo) {//SQL ID값
		return (String) insert("deptDAO.InsertDept",vo); 
	}

	public List<?> SelectDeptList(DeptVO vo) {
		return (List<?>) list("deptDAO.SelectDeptList",vo);
	}

	public DeptVO selectDeptDetail(int deptno) {
		return (DeptVO) select("deptDAO.selectDeptDetail",deptno);
	}
	//extends상속,상위클래스에 있는 메서드 
	public int deleteDept(int deptno) {
		return delete("deptDAO.deleteDept",deptno);
	}

	public int updateDept(DeptVO vo) {
		return update("deptDAO.updateDept",vo);
	}
}
