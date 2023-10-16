package com.sist.vo;
import java.util.*;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class MemberVO {
	private String id,pwd,name,sex,birth,email,post,
					addr1,addr2,phone,phone1,content,admin,dbday,msg;
	private Date regdate;
	private String role;
}
