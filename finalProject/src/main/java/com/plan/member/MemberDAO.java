package com.plan.member;

public interface MemberDAO {

	
	public MemberDTO login(MemberDTO mdto)throws Exception;
	
	public void join(MemberDTO mdto)throws Exception;
	
}
