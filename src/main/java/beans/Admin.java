package beans;

import java.io.Serializable;

public class Admin implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2584009030667563244L;
	private int admin_id;
	private String admin_name;
	private String admin_pass;
	private String admin_phone;
	private String image_name;
	public int getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public String getAdmin_pass() {
		return admin_pass;
	}
	public void setAdmin_pass(String admin_pass) {
		this.admin_pass = admin_pass;
	}
	public String getAdmin_phone() {
		return admin_phone;
	}
	public void setAdmin_phone(String admin_phone) {
		this.admin_phone = admin_phone;
	}
	public String getImage_name() {
		return image_name;
	}
	@Override
	public String toString() {
		return "Admin [admin_id=" + admin_id + ", admin_name=" + admin_name + ", admin_pass=" + admin_pass
				+ ", admin_phone=" + admin_phone + ", image_name=" + image_name + "]";
	}
	public void setImage_name(String image_name) {
		this.image_name = image_name;
	}
	
}
