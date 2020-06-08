package dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.LoginDao;
import model.CompanyUser;
import model.FormalUser;

@Repository
public class LoginDaoImpl implements LoginDao {
	@Autowired
	private SqlSession session;
	public Integer formalDupCheck(String id) {
		return session.selectOne("LoginMapper.formaldupcheck",id);
	}
	public Integer companyDupCheck(String id) {
		return session.selectOne("LoginMapper.companyDupCheck",id);
		
	}
	public void formalregister(FormalUser user) {
		session.insert("LoginMapper.formalregister", user);
	}
	public void companyregister(CompanyUser user) {
		session.insert("LoginMapper.companyregister",user);
	}
	public CompanyUser companyGetIDPWD(String id) {
		return session.selectOne("LoginMapper.companyGetIDPWD",id);
	}
	public FormalUser formalGetIDPWD(String id) {
		return session.selectOne("LoginMapper.formalGetIDPWD",id);
	}
	
	


}
