package com.sist.mapper;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;
public interface MemberMapper {
	@Select("SELECT COUNT(*) FROM jeju2_member "
			+ "WHERE id=#{id}")
	public int memberIdCheck(String id);
	@Select("SELECT COUNT(*) FROM jeju2_member "
			+ "WHERE id=#{email}")
	public int memberEmailCheck(String email);
	/*
	 ID          NOT NULL VARCHAR2(30)
	 PWD         NOT NULL VARCHAR2(20)
	 NAME        NOT NULL VARCHAR2(51)
	 SEX                  VARCHAR2(6)
	 BIRTH       NOT NULL VARCHAR2(20)
	 EMAIL       NOT NULL VARCHAR2(200)
	 POST        NOT NULL VARCHAR2(10)
	 ADDR1       NOT NULL VARCHAR2(500)
	 ADDR2       NOT NULL VARCHAR2(100)
	 PHONE       NOT NULL VARCHAR2(20)
	 CONTENT              CLOB
	 ADMIN                VARCHAR2(1)
	 REGDATE              DATE
	 */
	@Insert("INSERT INTO jeju2_member VALUES("
			+ "#{id},#{pwd},#{name},#{sex},#{birth},#{email},"
			+ "#{post},#{addr1},#{addr2},#{phone},"
			+ "#{content},'n',SYSDATE,'ROLE_USER')")
	public void memberInsert(MemberVO vo);
	@Select("SELECT pwd,name,role "
			+ "FROM jeju2_member "
			+ "WHERE id=#{id}")
	public MemberVO memberInfoData(String id);
}
