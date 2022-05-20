package com.ezen.common;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookieBox {

	private Map<String, Cookie> cookieMap = new HashMap<String, Cookie>();

	public CookieBox(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
			for (int i = 0; i < cookies.length; i++) {
				cookieMap.put(cookies[i].getName(), cookies[i]);
			}
		}
	}
	
	
	public static Cookie createCookie(String name, String value) throws IOException {
		return new Cookie(name,URLEncoder.encode(value,"EUC-KR"));
		
	}
	
	
	public static Cookie createCookie(String name, String value, String path, int maxAge) throws IOException {
		Cookie CK = new Cookie(name, URLEncoder.encode(value, "EUC-KR"));
		CK.setPath(path);
		CK.setMaxAge(maxAge);
		return CK;
	}
	
	public static Cookie createCookie(String name, String value, String domain, String path, int maxAge) throws IOException{
		Cookie CK = new Cookie(name,URLEncoder.encode(value,"EUC-KR"));
		CK.setDomain(domain);
		CK.setPath(path);
		CK.setMaxAge(maxAge);
		return CK;
	}
	
	public Cookie getCookie(String name) {
		if(cookieMap.get(name)==null) {
			return null;
		}
		return cookieMap.get(name);
	}
	
	public String getValue(String name) throws IOException {
		if(cookieMap.get(name)==null) {
			return null;
		}
		return URLDecoder.decode(cookieMap.get(name).getValue(), "EUC-KR");
		
	}
	
	public boolean exists(String name) {
		return cookieMap.get(name) !=null;
	}
	
	
	
	

}
