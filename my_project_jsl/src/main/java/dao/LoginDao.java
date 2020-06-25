package dao;

import java.util.List;

import model.AdminUser;
import model.CompanyUser;
import model.FormalUser;

public interface LoginDao {
	public Integer formalDupCheck(String id);
	public Integer companyDupCheck(String id);
	public void formalregister(FormalUser user);
	public void companyregister(CompanyUser user);
	public FormalUser formalGetIDPWD(String id);
	public CompanyUser companyGetIDPWD(String id);
	public AdminUser adminGetIDPWD(String id);
	public List formalGetID(String email);
	public List companyGetID(String email);
	public Integer formalGetPWD(FormalUser user);
	public Integer companyGetPWD(CompanyUser user);
	public void formalChangePWD(FormalUser user);
	public void companyChangePWD(CompanyUser user);
	public Integer visitorCheck(String date);
	public void visitorAdder(String date);
	public void visitrCreate(String date);
	public void formalChangeInfo(FormalUser user);
	public void formalDelete(String id);
	public void companyChangeInfo(CompanyUser user);
	public void companyDelete(String id);
	public Integer visitSum();
	public Integer visitToday();
	public void adminChangePWD(AdminUser user);
}
