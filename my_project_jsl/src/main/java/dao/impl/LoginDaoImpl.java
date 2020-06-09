package dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.LoginDao;
import model.AdminUser;
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
	public AdminUser adminGetIDPWD(String id) {
		return session.selectOne("LoginMapper.adminGetIDPWD",id);
	}
	public List formalGetID(String email) {
		return session.selectList("LoginMapper.formalGetID",email);
	}
	public List companyGetID(String email) {
		return session.selectList("LoginMapper.companyGetID",email);
	}
	public Integer formalGetPWD(FormalUser user) {
		return session.selectOne("LoginMapper.formalGetPWD",user);
	}
	public Integer companyGetPWD(CompanyUser user) {
		return session.selectOne("LoginMapper.companyGetPWD",user);
	}
	public void formalChangePWD(FormalUser user) {
		session.update("LoginMapper.formalchangePWD", user);
		
	}
	public void companyChangePWD(CompanyUser user) {
		 session.update("LoginMapper.companychangePWD", user);
		
	}
	
}