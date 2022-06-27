package com.ezen.common;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;
import org.springframework.web.util.HtmlUtils;
 

public class CustomMapArgumentResolver implements HandlerMethodArgumentResolver{
	@Override 
	public boolean supportsParameter(MethodParameter parameter) {
		return CommandMap.class.isAssignableFrom(parameter.getParameterType());
	}
 
	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer, NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
		CommandMap commandMap = new CommandMap();
		
		HttpServletRequest request = (HttpServletRequest) webRequest.getNativeRequest();
		Enumeration<?> enumeration = request.getParameterNames();
		
		String key = null;
		String[] values = null; //같은 값이 올때 처리하기 위해서 배열로 저장
		while(enumeration.hasMoreElements()){
			key = (String) enumeration.nextElement();
			values = request.getParameterValues(key);
			for(int i= 0 ; i<values.length;i++) {
				values[i] = HtmlUtils.htmlEscape((values[i]));
			}
			if(values != null){
				commandMap.put(key, (values.length > 1) ? values:values[0] );
			}
		}
		return commandMap;
	}

}
//commandmap파라미터들을 받아서 처리 (<태그 방지함)&gt
