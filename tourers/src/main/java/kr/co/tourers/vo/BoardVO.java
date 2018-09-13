package kr.co.tourers.vo;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {

	private int seq;
	private int parent;
	private String tr_id;
	private String title;
	private String content;
	private String cat;
	private int comment;
	private int file;
	private int hit;
	private String regip;
	private String regdate;
	private String tr_nick;
	private MultipartFile fname;

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getParent() {
		return parent;
	}

	public void setParent(int parent) {
		this.parent = parent;
	}

	public String getTr_id() {
		return tr_id;
	}

	public void setTr_id(String tr_id) {
		this.tr_id = tr_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCat() {
		return cat;
	}

	public void setCat(String cat) {
		this.cat = cat;
	}

	public int getComment() {
		return comment;
	}

	public void setComment(int comment) {
		this.comment = comment;
	}

	public int getFile() {
		return file;
	}

	public void setFile(int file) {
		this.file = file;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getRegip() {
		return regip;
	}

	public void setRegip(String regip) {
		this.regip = regip;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getTr_nick() {
		return tr_nick;
	}

	public void setTr_nick(String tr_nick) {
		this.tr_nick = tr_nick;
	}

	public MultipartFile getFname() {
		return fname;
	}

	public void setFname(MultipartFile fname) {
		this.fname = fname;
	}

}
