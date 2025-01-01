package beans;

import java.io.Serializable;

public class invoices implements Serializable {
	private int invoice_id;
	private int student_id;
	private int lecture_id;
	private int ammount;
	private boolean attendendence;
	private String date;
	public int getInvoice_id() {
		return invoice_id;
	}
	public void setInvoice_id(int invoice_id) {
		this.invoice_id = invoice_id;
	}
	public int getStudent_id() {
		return student_id;
	}
	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}
	@Override
	public String toString() {
		return "invoices [invoice_id=" + invoice_id + ", student_id=" + student_id + ", lecture_id=" + lecture_id
				+ ", ammount=" + ammount + ", attendendence=" + attendendence + ", date=" + date + "]";
	}
	public int getLecture_id() {
		return lecture_id;
	}
	public void setLecture_id(int lecture_id) {
		this.lecture_id = lecture_id;
	}
	public int getAmmount() {
		return ammount;
	}
	public void setAmmount(int ammount) {
		this.ammount = ammount;
	}
	public boolean isAttendendence() {
		return attendendence;
	}
	public void setAttendendence(boolean attendendence) {
		this.attendendence = attendendence;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
}
