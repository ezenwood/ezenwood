package com.ezen.ezenwood.member.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ezen.common.DTOtoMap;
import com.ezen.ezenwood.member.MemberDTO;
import com.ezen.ezenwood.member.dao.JoinDAO;

@Service("JoinService")
public class JoinServiceImpl implements JoinService {
	
	@Resource(name="JoinDAO")
	JoinDAO joinDao;
	
	DTOtoMap dtoToMap;

	@Override
	public int join(MemberDTO memberDTO) {
		Map<String, Object> insertMap =dtoToMap.toMap(memberDTO);
		
		return joinDao.InsertMember(insertMap);
	}

	@Override
	public int idCheck(String MEMBER_ID) {
		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("MEMBER_ID", MEMBER_ID);
		
		return joinDao.idCheck(insertMap);
	}

	
	
}
