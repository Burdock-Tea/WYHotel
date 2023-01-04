package com.ictproject.wyhotel.promotion.service;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ictproject.wyhotel.command.PromotionUploadVO;
import com.ictproject.wyhotel.command.PromotionVO;
import com.ictproject.wyhotel.promotion.mapper.IPromotionMapper;

import lombok.extern.log4j.Log4j;

@Service
public class PromotionServiceImpl implements IPromotionService {

	@Autowired
	private IPromotionMapper mapper;

	@Override
	public void insert(PromotionUploadVO upload) {
		// Controller를 통해 들어오는건 form태그의 값을 받기위한 VO이므로 따로 정제작업 필요
		// 정제작업은 startDate의 값과 endDate의 값을 TimeStamp로 변환 해주는 작업,
		// 그리고 MultipartFile 타입의 file의 data를 로컬 저장소에 저장하고, DB에는 저장되어 있는 위치를 저장!
		PromotionVO promotion = new PromotionVO();
		// 변환 필요없는건 VO로 그냥 넣기
		promotion.setHotelCode(upload.getHotelCode());
		promotion.setRoomCode(upload.getRoomCode());
		promotion.setPromotionName(upload.getPromotionName());
		promotion.setPromotionPrice(upload.getPromotionPrice());
		promotion.setPromotionContent(upload.getPromotionContent());

		// String을 TimeStamp로 변환 작업
		Timestamp startDate = Timestamp.valueOf(upload.getStartDate() + " 00:00:00.0");
		Timestamp endDate = Timestamp.valueOf(upload.getEndDate() + " 00:00:00.0");

		// TimeStamp 값 넣어주기
		promotion.setStartDate(startDate);
		promotion.setEndDate(endDate);

		// 파일 업로드 진행
		MultipartFile file = upload.getFile();

		try {
			// 파일의 파일명을 바꾸기전, 업로드 된 파일의 진짜 이름을 추출
			String fileRealName = file.getOriginalFilename();
			// 업로드된 파일의 확장자 추출
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());

			// 날짜별로 파일을 저장하기 위해 폴더 형식 세팅 (ex: 20230102)
			String folderName = new SimpleDateFormat("yyyyMMdd").format(new Date()); // 오늘날짜
			String uploadFolder = "C:/test/upload/";

			// 업로드 되는 경로 C:/test/upload/날짜
			File folder = new File(uploadFolder + folderName);
			if (!folder.exists()) {
				folder.mkdirs();
			}

			// 업로드 되는 파일명의 중복을 피하기 위한 고유아이디 생성
			String fileName = UUID.randomUUID().toString().replaceAll("-", "");

			File saveFile = new File(uploadFolder + folderName + "/" + fileName + fileExtension);
			file.transferTo(saveFile);

			promotion.setFileLocation(folderName);
			promotion.setFileName(fileName + fileExtension);
			promotion.setFileRealName(fileRealName);
			promotion.setUploadPath(uploadFolder);

		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		mapper.insert(promotion);
	}

	@Override
	public List<PromotionVO> getList(String hotelCode, String startDate, String endDate) {
		List<PromotionVO> list = mapper.getList(hotelCode);
		
		list.forEach((promotion) -> {
			String start = promotion.getStartDate().toString();
			String end = promotion.getEndDate().toString();		
		});
		
		return list;
	}

	@Override
	public PromotionVO getPromotion(String promotionCode) {
		return mapper.getPromotion(promotionCode);
	}

	@Override
	public void update(PromotionUploadVO upload, String imageUpdate) {

		// imageUpdate 값에 상관없이 정제 작업 진행
		// 변환 필요없는건 VO로 그냥 넣기
		PromotionVO promotion = new PromotionVO();
		promotion.setPromotionCode(upload.getPromotionCode());
		promotion.setHotelCode(upload.getHotelCode());
		promotion.setRoomCode(upload.getRoomCode());
		promotion.setPromotionName(upload.getPromotionName());
		promotion.setPromotionPrice(upload.getPromotionPrice());
		promotion.setPromotionContent(upload.getPromotionContent());
		
		// String을 TimeStamp로 변환 작업
		Timestamp startDate = Timestamp.valueOf(upload.getStartDate() + " 00:00:00.0");
		Timestamp endDate = Timestamp.valueOf(upload.getEndDate() + " 00:00:00.0");
		
		// TimeStamp 값 넣어주기
		promotion.setStartDate(startDate);
		promotion.setEndDate(endDate);
		
		
		if(imageUpdate != null) {
			// 이미지 업데이트 진행
			// 기존 파일경로에 있는 파일 삭제 작업 진행			
			PromotionVO tempPromotion = mapper.getPromotion(upload.getPromotionCode());
			new File(tempPromotion.getUploadPath() + tempPromotion.getFileLocation() + "/" + tempPromotion.getFileName()).delete();
			// 삭제 작업 끝, 새롭게 파일 업로드 진행하자
			
			try {
				MultipartFile newFile = upload.getFile();
				
				String fileRealName = newFile.getOriginalFilename();
				String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
				
				String folderName = new SimpleDateFormat("yyyyMMdd").format(new Date());
				String uploadFolder = "C:/test/upload/";
				
				File folder = new File(uploadFolder + folderName);
				
				if(!folder.exists()) {
					folder.mkdirs();
				}
				
				String fileName = UUID.randomUUID().toString().replaceAll("-", "");
				File saveFile = new File(uploadFolder + folderName + "/" + fileName + fileExtension);
				newFile.transferTo(saveFile);
				
				promotion.setFileLocation(folderName);
				promotion.setFileName(fileName + fileExtension);
				promotion.setFileRealName(fileRealName);
				promotion.setUploadPath(uploadFolder);
				
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		
		Map<String, Object> data = new HashMap<>();
		
		data.put("vo", promotion);
		data.put("imageUpdate", imageUpdate);
		
		mapper.update(data);
	}
	
	@Override
	public void delete(String promotionCode) {
		
		PromotionVO tempPromotion = mapper.getPromotion(promotionCode);
		new File(tempPromotion.getUploadPath() + tempPromotion.getFileLocation() + "/" + tempPromotion.getFileName()).delete();
		
		mapper.delete(promotionCode);
	}

}
