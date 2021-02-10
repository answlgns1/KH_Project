package com.kh.jsp.recipe.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

public class Attachment implements Serializable{

	private static final long serialVersionUID = 1008L;
	
	private ArrayList<Attachment> attachments;
	
	private int Fno        ;
	private int Rb_no        ;
	private String Originname ;
	private String Changename ;
	private String Filepath   ;
	private int Flevel     ;
	private Date Uploaddate ;
	private String Status     ;
	
	
	public Attachment() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Attachment(int fno, int rb_no, String originname, String changename, String filepath, int flevel,
			Date uploaddate, String status) {
		super();
		Fno = fno;
		Rb_no = rb_no;
		Originname = originname;
		Changename = changename;
		Filepath = filepath;
		Flevel = flevel;
		Uploaddate = uploaddate;
		Status = status;
	}
	

	public Attachment(String originname, String changename, String filepath) {
		super();
		Originname = originname;
		Changename = changename;
		Filepath = filepath;
	}


	@Override
	public String toString() {
		return "Attachment [attachments=" + attachments + ", Fno=" + Fno + ", Rb_no=" + Rb_no + ", Originname="
				+ Originname + ", Changename=" + Changename + ", Filepath=" + Filepath + ", Flevel=" + Flevel
				+ ", Uploaddate=" + Uploaddate + ", Status=" + Status + "]";
	}


	public ArrayList<Attachment> getAttachments() {
		return attachments;
	}


	public void setAttachments(ArrayList<Attachment> attachments) {
		this.attachments = attachments;
	}
	
	
	public int getFno() {
		return Fno;
	}


	public void setFno(int fno) {
		Fno = fno;
	}


	public int getRb_no() {
		return Rb_no;
	}


	public void setRb_no(int rb_no) {
		Rb_no = rb_no;
	}


	public String getOriginname() {
		return Originname;
	}


	public void setOriginname(String originname) {
		Originname = originname;
	}


	public String getChangename() {
		return Changename;
	}


	public void setChangename(String changename) {
		Changename = changename;
	}


	public String getFilepath() {
		return Filepath;
	}


	public void setFilepath(String filepath) {
		Filepath = filepath;
	}


	public int getFlevel() {
		return Flevel;
	}


	public void setFlevel(int flevel) {
		Flevel = flevel;
	}


	public Date getUploaddate() {
		return Uploaddate;
	}


	public void setUploaddate(Date uploaddate) {
		Uploaddate = uploaddate;
	}


	public String getStatus() {
		return Status;
	}


	public void setStatus(String status) {
		Status = status;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}



}
