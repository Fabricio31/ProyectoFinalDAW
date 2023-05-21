package pe.edu.cibertec.Semana_08_Proyecto.model;

public class admin {

	private String name_system_user;
	private String system_password;

	public String getName_system_user() {
		return name_system_user;
	}

	public void setName_system_user(String name_system_user) {
		this.name_system_user = name_system_user;
	}

	public String getSystem_password() {
		return system_password;
	}

	public void setSystem_password(String system_password) {
		this.system_password = system_password;
	}

	public admin(String name_system_user, String system_password) {
		super();
		this.name_system_user = name_system_user;
		this.system_password = system_password;
	}

	public admin() {
		super();
		// TODO Auto-generated constructor stub
	}

}
