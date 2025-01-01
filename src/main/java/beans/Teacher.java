package beans;

import java.io.Serializable;

public class Teacher  implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 7437359665363170348L;
	private int teacher_id;
	private String teacher_name;
	private String teacher_phone;
	@Override
	public String toString() {
		return "Teacher [teacher_id=" + teacher_id + ", teacher_name=" + teacher_name + ", teacher_phone="
				+ teacher_phone + ", teacher_pass=" + teacher_pass + ", teacher_balance=" + teacher_balance
				+ ", course_id=" + course_id + ", image_name=" + image_name + "]";
	}
	private String teacher_pass;
	private int teacher_balance;
	private int course_id;
	private  String image_name;
	public int getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(int teacher_id) {
		this.teacher_id = teacher_id;
	}
	public String getTeacher_name() {
		return teacher_name;
	}
	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}
	public String getTeacher_phone() {
		return teacher_phone;
	}
	public void setTeacher_phone(String teacher_phone) {
		this.teacher_phone = teacher_phone;
	}
	public String getTeacher_pass() {
		return teacher_pass;
	}
	public void setTeacher_pass(String teacher_password) {
		this.teacher_pass = teacher_password;
	}
	public int getTeacher_balance() {
		return teacher_balance;
	}
	public void setTeacher_balance(int teacher_balance) {
		this.teacher_balance = teacher_balance;
	}
	public int getCourse_id() {
		return course_id;
	}
	public void setCourse_id(int course_id) {
		this.course_id = course_id;
	}
	public String getImage_name() {
		return image_name;
	}
	public void setImage_name(String image_name) {
		this.image_name = image_name;
	}
	
	
	
	
}
