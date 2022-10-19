package com.pjt.member.commend;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	
	
	private String user_id;
	private String user_pw;
	private String user_phone;
	private String user_address;
	private String user_email;
	private String user_nick;                                                                                                                                                          
	private Date user_regdate;

	
}