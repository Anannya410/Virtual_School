package vs.model;

public class LoginBean {
	private static String uname;
	private String pass;
	
	public static String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		LoginBean.uname = uname;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}


}
