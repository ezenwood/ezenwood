package com.ezen.common;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


public class ImageSaver {
	private static final String filePath = Path.UPLOAD_PATH;
	
	//하나의 파일만 저장 가능한 상태, 이미지 테이블에만 저장가능한 상태, 맵에 이미지 테이블이름 부모글 넣어줘야됨
	public Map<String, Object> saveImageFile(Map<String, Object> map, HttpServletRequest request) throws IllegalStateException, IOException{
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		
		String originalFileName = null;
		
		String originalFileExtension = null;
		
		String storedFileName = null;
		
		while(iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			
			if(!multipartFile.isEmpty()) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension= originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = UUID.randomUUID().toString().replace("-", "") + originalFileExtension;
				
				File file = new File(filePath+storedFileName);
				multipartFile.transferTo(file);
				
				map.put("IMAGE_ORG", originalFileName);
				map.put("IMAGE_STD", storedFileName);
				
			}
		}
		
		
		
		return map;
	}

}
