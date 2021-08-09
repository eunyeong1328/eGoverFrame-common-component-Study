package egovframework.example.sample.service;

public class DeptVO {

	//객체지향 : 캡슐화(접근지정자 세팅)
	private String deptno; //이 변수에 데이터가 담긴다.
	private String dname;
	private String loc;
	//자동완성(어디에서나 접근가능)
	public String getDeptno() { //return
		return deptno;
	}
	public void setDeptno(String deptno) { //매개변수 실행
		this.deptno = deptno;	
		//this는 지금 실행되고 있는 클래스
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
}
