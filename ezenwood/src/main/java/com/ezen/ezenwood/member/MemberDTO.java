package com.ezen.ezenwood.member;

import java.sql.Timestamp;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

public class MemberDTO {
	
	public int MEMBER_NUM;
	@NotBlank(message = "아이디를 입력하지 않았거나 형식이 틀립니다")
	@Pattern(regexp = "^([a-z0-9]){8,20}$", message = "아이디를 입력하지 않았거나 형식이 틀립니다")
	public String MEMBER_ID;
	@NotBlank(message = "비밀번호는 필수항목입니다.")
	@Pattern(regexp = "(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{8,20}")
	public String MEMBER_PW;
	@NotBlank(message = "이름은 필수항목입니다.")
	public String MEMBER_NAME;
	@NotBlank(message = "이메일은 필수항목입니다.")
	@Email(message = "올바른 이메일 형식이 아닙니다.")
	public String MEMBER_EMAIL;
	@NotBlank(message = "전화번호는 필수항목입니다.")
	@Pattern(regexp = "^[0-9]{11,11}$")
	public String MEMBER_PHONE;
	@NotBlank(message = "주소는 필수항목입니다.")
	public String MEMBER_ZIP;
	@NotBlank(message = "주소는 필수항목입니다.")
	public String MEMBER_ADD1;
	@NotBlank(message = "주소는 필수항목입니다.")
	public String MEMBER_ADD2;
	
	public String MEMBER_ADD3;
	public Timestamp MEMBER_JOINDATE;
	public String MEMBER_EMAIL_CHECK;
	public String MEMBER_DEL_GB;
	
	public int getMEMBER_NUM() {
		return MEMBER_NUM;
	}
	public void setMEMBER_NUM(int mEMBER_NUM) {
		MEMBER_NUM = mEMBER_NUM;
	}
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public String getMEMBER_PW() {
		return MEMBER_PW;
	}
	public void setMEMBER_PW(String mEMBER_PW) {
		MEMBER_PW = mEMBER_PW;
	}
	public String getMEMBER_NAME() {
		return MEMBER_NAME;
	}
	public void setMEMBER_NAME(String mEMBER_NAME) {
		MEMBER_NAME = mEMBER_NAME;
	}
	public String getMEMBER_EMAIL() {
		return MEMBER_EMAIL;
	}
	public void setMEMBER_EMAIL(String mEMBER_EMAIL) {
		MEMBER_EMAIL = mEMBER_EMAIL;
	}
	public String getMEMBER_PHONE() {
		return MEMBER_PHONE;
	}
	public void setMEMBER_PHONE(String mEMBER_PHONE) {
		MEMBER_PHONE = mEMBER_PHONE;
	}
	public String getMEMBER_ZIP() {
		return MEMBER_ZIP;
	}
	public void setMEMBER_ZIP(String mEMBER_ZIP) {
		MEMBER_ZIP = mEMBER_ZIP;
	}
	public String getMEMBER_ADD1() {
		return MEMBER_ADD1;
	}
	public void setMEMBER_ADD1(String mEMBER_ADD1) {
		MEMBER_ADD1 = mEMBER_ADD1;
	}
	public String getMEMBER_ADD2() {
		return MEMBER_ADD2;
	}
	public void setMEMBER_ADD2(String mEMBER_ADD2) {
		MEMBER_ADD2 = mEMBER_ADD2;
	}
	public String getMEMBER_ADD3() {
		return MEMBER_ADD3;
	}
	public void setMEMBER_ADD3(String mEMBER_ADD3) {
		MEMBER_ADD3 = mEMBER_ADD3;
	}
	public Timestamp getMEMBER_JOINDATE() {
		return MEMBER_JOINDATE;
	}
	public void setMEMBER_JOINDATE(Timestamp mEMBER_JOINDATE) {
		MEMBER_JOINDATE = mEMBER_JOINDATE;
	}
	public String getMEMBER_EMAIL_CHECK() {
		return MEMBER_EMAIL_CHECK;
	}
	public void setMEMBER_EMAIL_CHECK(String mEMBER_EMAIL_CHECK) {
		MEMBER_EMAIL_CHECK = mEMBER_EMAIL_CHECK;
	}
	public String getMEMBER_DEL_GB() {
		return MEMBER_DEL_GB;
	}
	public void setMEMBER_DEL_GB(String mEMBER_DEL_GB) {
		MEMBER_DEL_GB = mEMBER_DEL_GB;
	}
	
	

}
