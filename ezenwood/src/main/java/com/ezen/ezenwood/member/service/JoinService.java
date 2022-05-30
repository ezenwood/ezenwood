package com.ezen.ezenwood.member.service;

import com.ezen.ezenwood.member.MemberDTO;

public interface JoinService {
	public int join(MemberDTO memberDTO);
	public int idCheck(String MEMBER_ID);

}
