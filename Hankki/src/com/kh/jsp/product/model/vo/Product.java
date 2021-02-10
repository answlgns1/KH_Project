package com.kh.jsp.product.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

import com.kh.jsp.attachment.model.vo.Attachment;

public class Product implements Serializable {

	private static final long serialVersionUID = 1004L;

	private ArrayList<Attachment> attachments; // 저장된 사진들을 불러와 저장할 목록 (저장한 사진들의 정보를 담을 목록임)
	
	private int p_no;            // 상품 고유 번호
	private String p_type;       // 상품의 타입 (예) 야채, 과일 등
	private String p_name;       // 상품의 이름
	private int p_price;      // 상품의 가격
	private int p_amount;        // 상품의 수량
	private String p_weight;     // 상품의 무게
	private String p_explain;    // 상품의 상세 설명
	private String p_attachment; // 첨부파일 이미지(썸네일에 표기될 사진의 이름)
	private Date p_date;
	private int p_discount;
	private int p_count;
	private int p_attach_existence; // 첨부파일 이미지의 유무 	0 - 없음, 1- 있음
	private int p_at_type; 
	private String p_category;
	
	public Product() {
		super();
	}
	
	
	public Product(int p_no, String p_type, String p_name, int p_price, String p_attachment,String p_category) {
		super();
		this.p_no = p_no;
		this.p_type = p_type;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_attachment = p_attachment;
		this.p_category=p_category;
	}


	public Product(int p_no, String p_type, String p_name, int p_price, int p_amount, String p_weight,
			String p_explain, String p_attachment, Date p_date, int p_discount, int p_count, int p_attach_existence,
			int p_at_type) {
		super();
		this.p_no = p_no;
		this.p_type = p_type;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_amount = p_amount;
		this.p_weight = p_weight;
		this.p_explain = p_explain;
		this.p_attachment = p_attachment;
		this.p_date = p_date;
		this.p_discount = p_discount;
		this.p_count = p_count;
		this.p_attach_existence = p_attach_existence;
		this.p_at_type = p_at_type;
	}

	@Override
	public String toString() {
		return "Product [attachments=" + attachments + ", p_no=" + p_no + ", p_type=" + p_type + ", p_name=" + p_name
				+ ", p_price=" + p_price + ", p_amount=" + p_amount + ", p_weight=" + p_weight + ", p_explain="
				+ p_explain + ", p_attachment=" + p_attachment + ", p_date=" + p_date + ", p_discount=" + p_discount
				+ ", p_count=" + p_count + ", p_attach_existence=" + p_attach_existence + ", p_at_type=" + p_at_type
				+ ", p_category=" + p_category + "]";
	}

	public String getP_category() {
		return p_category;
	}

	public void setP_category(String p_category) {
		this.p_category = p_category;
	}


	public Date getP_date() {
		return p_date;
	}


	public int getP_discount() {
		return p_discount;
	}


	public int getP_count() {
		return p_count;
	}


	public int getP_at_type() {
		return p_at_type;
	}


	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}


	public void setP_discount(int p_discount) {
		this.p_discount = p_discount;
	}


	public void setP_count(int p_count) {
		this.p_count = p_count;
	}


	public void setP_at_type(int p_at_type) {
		this.p_at_type = p_at_type;
	}


	public ArrayList<Attachment> getAttachments() {
		return attachments;
	}

	public int getP_no() {
		return p_no;
	}

	public String getP_type() {
		return p_type;
	}

	public String getP_name() {
		return p_name;
	}

	public int getP_price() {
		return p_price;
	}

	public int getP_amount() {
		return p_amount;
	}

	public String getP_weight() {
		return p_weight;
	}

	public String getP_explain() {
		return p_explain;
	}

	public String getP_attachment() {
		return p_attachment;
	}

	public int getP_attach_existence() {
		return p_attach_existence;
	}

	public void setAttachments(ArrayList<Attachment> attachments) {
		this.attachments = attachments;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public void setP_type(String p_type) {
		this.p_type = p_type;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public void setP_amount(int p_amount) {
		this.p_amount = p_amount;
	}

	public void setP_weight(String p_weight) {
		this.p_weight = p_weight;
	}

	public void setP_explain(String p_explain) {
		this.p_explain = p_explain;
	}

	public void setP_attachment(String p_attachment) {
		this.p_attachment = p_attachment;
	}

	public void setP_attach_existence(int p_attach_existence) {
		this.p_attach_existence = p_attach_existence;
	}



	
}
