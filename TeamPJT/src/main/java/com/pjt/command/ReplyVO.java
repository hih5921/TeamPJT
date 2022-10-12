package com.pjt.command;

import java.sql.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private int reply_num;
	private String reply_content;
	private String user_id;
	private int board_num;
	private Date reply_date;
	private int reply_recommend;

}
