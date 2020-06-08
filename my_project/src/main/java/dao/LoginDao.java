package dao;

import model.CompanyUser;
import model.FormalUser;

public interface LoginDao {
	public Integer formalDupCheck(String id);
	public Integer companyDupCheck(String id);
	public void formalregister(FormalUser user);
	public void companyregister(CompanyUser user);
	public FormalUser formalGetIDPWD(String id);
	public CompanyUser companyGetIDPWD(String id);
	
}
