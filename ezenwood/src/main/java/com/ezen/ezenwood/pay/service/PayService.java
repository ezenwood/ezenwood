package com.ezen.ezenwood.pay.service;

import java.util.List;
import java.util.Map;

public interface PayService {
	
	public Map<String, Object> step1(Map<String, Object> insertMap);
	
	public Map<String, Object> step2(Map<String, Object> insertMap);
	
	public Map<String, Object> step3(Map<String, Object> insertMap);
	
	

}
