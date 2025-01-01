package beans;

import java.io.Serializable;

public class Course implements Serializable {
	@Override
	public String toString() {
		return "Course [course_id=" + course_id + ", course_name=" + course_name + ", image_name=" + image_name + "]";
	}
	private int course_id;
	private String course_name;
	private String image_name;
	public int getCourse_id() {
		return course_id;
	}
	public void setCourse_id(int course_id) {
		this.course_id = course_id;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public String getImage_name() {
		return image_name;
	}
	public void setImage_name(String image_name) {
		this.image_name = image_name;
	}

}
