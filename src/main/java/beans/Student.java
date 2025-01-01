package beans;

import java.io.Serializable;

public class Student implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7875200131351384230L;
	private  int student_id;
	private String student_name;
	private String student_pass;
	private String student_phone;
	@Override
	public String toString() {
		return "Student [student_id=" + student_id + ", student_name=" + student_name + ", student_pass=" + student_pass
				+ ", student_phone=" + student_phone + ", parent_phone=" + parent_phone + ", student_balance="
				+ student_balance + ", image_name=" + image_name + "]";
	}
	private String parent_phone;
	private int student_balance;
	private String image_name;
	public String getStudent_name() {
		return student_name;
	}
	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}
	public String getStudent_pass() {
		return student_pass;
	}
	public void setStudent_pass(String student_pass) {
		this.student_pass = student_pass;
	}
	public String getStudent_phone() {
		return student_phone;
	}
	public void setStudent_phone(String student_phone) {
		this.student_phone = student_phone;
	}
	public String getParent_phone() {
		return parent_phone;
	}
	public void setParent_phone(String parent_phone) {
		this.parent_phone = parent_phone;
	}
	public int getStudent_balance() {
		return student_balance;
	}
	public void setStudent_balance(int student_balance) {
		this.student_balance = student_balance;
	}
	public String getImage_name() {
		return image_name;
	}
	public void setImage_name(String image_name) {
		this.image_name = image_name;
	}
	public int getStudent_id() {
		return student_id;
	}
	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}
	
}
