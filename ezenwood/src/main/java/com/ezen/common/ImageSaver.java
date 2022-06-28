package com.ezen.common;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class ImageSaver {
	private static final String filePath = Path.UPLOAD_PATH;

	// 하나의 파일만 저장 가능한 상태, 이미지 테이블에만 저장가능한 상태, 맵에 이미지 테이블이름 부모글 넣어줘야됨
	public Map<String, Object> saveImageFile(Map<String, Object> map, HttpServletRequest request)
			throws IllegalStateException, IOException {

		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;

		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();

		MultipartFile multipartFile = null;

		String originalFileName = null;

		String originalFileExtension = null;

		String storedFileName = null;

		while (iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());

			if (!multipartFile.isEmpty()) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = UUID.randomUUID().toString().replace("-", "") + originalFileExtension;

				File file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);

				map.put("IMAGE_ORG", originalFileName);
				map.put("IMAGE_STD", storedFileName);

			}
		}

		return map;
	}

	public Map<String, Object> insertGoods(Map<String, Object> map) throws IllegalStateException, IOException {

		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) map.get("request");

		MultipartFile subImageFile = multipartHttpServletRequest.getFile("subImage");
		MultipartFile mainImageFile = multipartHttpServletRequest.getFile("mainImage");

		if (subImageFile.isEmpty()) {
			map.put("noSubImage", "1");
		} else {
			map.put("noSubImage", "0");

			String subImageORG = subImageFile.getOriginalFilename();
			String subImageExtension = subImageORG.substring(subImageORG.lastIndexOf("."));
			String subImageSTD = UUID.randomUUID().toString().replace("-", "") + subImageExtension;

			File subImage = new File(filePath + subImageSTD);
			subImageFile.transferTo(subImage);
			map.put("parent", map.get("GOODS_NUM"));
			map.put("org", subImageORG);
			map.put("std", subImageSTD);
		}
		if (mainImageFile.isEmpty()) {
			map.put("noMainImage", "1");
		} else {
			map.put("noMainImage", "0");

			String mainImageORG = mainImageFile.getOriginalFilename();
			String mainImageExtension = mainImageORG.substring(mainImageORG.lastIndexOf("."));
			String mainImageSTD = UUID.randomUUID().toString().replace("-", "") + mainImageExtension;

			File mainImage = new File(filePath + mainImageSTD);

			mainImageFile.transferTo(mainImage);

			map.put("IMAGE_ORG", mainImageORG);
			map.put("IMAGE_STD", mainImageSTD);

		}

		return map;
	}

	public List<Map<String,Object>> insertOTO(Map<String, Object> map) throws IllegalStateException, IOException {

		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) map.get("request");

		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		
		MultipartFile otoImageFile = null;
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		
		
		while(iterator.hasNext()) {
			
					
			String otoImageORG = null;
			String otoImageExtension = null;
			String otoImageSTD = null;
			otoImageFile = multipartHttpServletRequest.getFile(iterator.next());
			if(!otoImageFile.isEmpty()) {
				Map<String,Object> mapa  = new HashMap<String, Object>();
				 otoImageORG = 	otoImageFile.getOriginalFilename();
				otoImageExtension = otoImageORG.substring(otoImageORG.lastIndexOf("."));
				otoImageSTD = UUID.randomUUID().toString().replace("-", "") + otoImageExtension;
				mapa.put("IMAGE_STD", otoImageSTD);
				
				mapa.put("IMAGE_ORG", otoImageORG);
				File otoImage = new File(filePath + otoImageSTD);
				otoImageFile.transferTo(otoImage);
				list.add(mapa);
				
			}
			
		}

			
		return list;
	}

	public void updateGoods(Map<String, Object> insertMap) throws IllegalStateException, IOException {

		HttpServletRequest request = (HttpServletRequest) insertMap.get("request");
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest) request;

		String subImageExist = request.getParameter("subcheck");

		if (subImageExist.isEmpty() || subImageExist == "" || subImageExist == null) {
			insertMap.put("newSubImage", "1");
		} else {
			insertMap.put("newSubImage", "0");
		}

		String mainImageExist = request.getParameter("maincheck");
		if (mainImageExist.isEmpty() || mainImageExist == "" || mainImageExist == null) {
			insertMap.put("newMainImage", "1");
		} else {
			insertMap.put("newMainImage", "0");
		}

		MultipartFile subImageFile = multi.getFile("subImage");
		MultipartFile mainImageFile = multi.getFile("mainImage");

		if (subImageFile.isEmpty()) {
			insertMap.put("noSubImage", "1");
		} else {
			insertMap.put("noSubImage", "0");

			String subImageORG = subImageFile.getOriginalFilename();
			String subImageExtension = subImageORG.substring(subImageORG.lastIndexOf("."));
			String subImageSTD = UUID.randomUUID().toString().replace("-", "") + subImageExtension;

			File subImage = new File(filePath + subImageSTD);
			subImageFile.transferTo(subImage);
			insertMap.put("parent", insertMap.get("GOODS_NUM"));
			insertMap.put("org", subImageORG);
			insertMap.put("std", subImageSTD);
		}

		if (mainImageFile.isEmpty()) {
			insertMap.put("noMainImage", "1");
		} else {
			insertMap.put("noMainImage", "0");

			String mainImageORG = mainImageFile.getOriginalFilename();
			String mainImageExtension = mainImageORG.substring(mainImageORG.lastIndexOf("."));
			String mainImageSTD = UUID.randomUUID().toString().replace("-", "") + mainImageExtension;

			File mainImage = new File(filePath + mainImageSTD);

			mainImageFile.transferTo(mainImage);

			insertMap.put("IMAGE_ORG", mainImageORG);
			insertMap.put("IMAGE_STD", mainImageSTD);

		}
	}

	public Map<String, Object> insertNotice(Map<String, Object> map) throws IllegalStateException, IOException {

		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) map.get("request");

		MultipartFile noticeImageFile = multipartHttpServletRequest.getFile("noticeImage");  // 여기에 널값이라는 데 file name 이랑 매칭되는 부분 아닌가요...ㅠㅠ

		String noticeImageORG = noticeImageFile.getOriginalFilename();
		String noticeImageExtension = noticeImageORG.substring(noticeImageORG.lastIndexOf("."));
		String noticeImageSTD = UUID.randomUUID().toString().replace("-", "") + noticeImageExtension;

		File noticeImage = new File(filePath + noticeImageSTD);

		noticeImageFile.transferTo(noticeImage);

		map.put("parent", map.get("NOTICE_NUM"));
		map.put("IMAGE_ORG", noticeImageORG);
		map.put("IMAGE_STD", noticeImageSTD);
		return map;
	}
	

}
