package com.ezen.ezenwood.pay.dao;

import java.util.List;
import java.util.Map;

public interface PayDAO {
	
	public List<Map<String, Object>> step1(Map<String, Object> insertMap);

	
	
	public Map<String, Object> step2(Map<String, Object> insertMap);
	
	public int step3Save(Map<String, Object> insertMap);
	
	
	
	
	
}
