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
	
	public Map<String,Object> insertGoods(Map<String,Object> map) throws IllegalStateException, IOException{
		
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) map.get("request");
		
		
		MultipartFile subImageFile = multipartHttpServletRequest.getFile("subImage");
		MultipartFile mainImageFile = multipartHttpServletRequest.getFile("mainImage");
		
		
		String subImageORG = subImageFile.getOriginalFilename();
		String subImageExtension = subImageORG.substring(subImageORG.lastIndexOf("."));
		String subImageSTD = UUID.randomUUID().toString().replace("-", "") + subImageExtension;
		
		String mainImageORG = mainImageFile.getOriginalFilename();
		String mainImageExtension = mainImageORG.substring(mainImageORG.lastIndexOf("."));
		String mainImageSTD = UUID.randomUUID().toString().replace("-", "") + mainImageExtension;
		
		
		File subImage = new File(filePath+subImageSTD);
		File mainImage = new File(filePath+mainImageSTD);
		
		subImageFile.transferTo(subImage);
		mainImageFile.transferTo(mainImage);
		
		
		map.put("IMAGE_ORG", mainImageORG);
		map.put("IMAGE_STD", mainImageSTD);
		
		
		map.put("parent", map.get("GOODS_NUM"));
		map.put("org", subImageORG);
		map.put("std", subImageSTD);
		
		return map;
	}
	
public Map<String,Object> insertOTO(Map<String,Object> map) throws IllegalStateException, IOException{
		
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) map.get("request");
		
		
		MultipartFile otoImageFile = multipartHttpServletRequest.getFile("otoImage");
		
		
		String otoImageORG = otoImageFile.getOriginalFilename();
		String otoImageExtension = otoImageORG.substring(otoImageORG.lastIndexOf("."));
		String otoImageSTD = UUID.randomUUID().toString().replace("-", "") + otoImageExtension;
	
		
		File otoImage = new File(filePath+otoImageSTD);
		
		otoImageFile.transferTo(otoImage);

		
		map.put("parent", map.get("SONETOONE_NUM"));
		map.put("IMAGE_ORG", otoImageORG);
		map.put("IMAGE_STD", otoImageSTD);
		return map;
	}
	
	
	

}
