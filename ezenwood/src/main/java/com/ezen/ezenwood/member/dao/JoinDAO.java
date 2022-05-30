package com.ezen.ezenwood.member.dao;

import java.util.Map;

public interface JoinDAO {
	public int InsertMember(Map<String, Object> insertMap);
	public int idCheck(Map<String, Object> insertMap);
}
