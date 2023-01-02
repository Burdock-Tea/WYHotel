package com.ictproject.wyhotel.promotion.service;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ictproject.wyhotel.command.PromotionUploadVO;
import com.ictproject.wyhotel.command.PromotionVO;
import com.ictproject.wyhotel.promotion.mapper.IPromotionMapper;

@Service
public class PromotionServiceImpl implements IPromotionService {

	@Autowired
	private IPromotionMapper mapper;
	
	@Override
	public void insert(PromotionUploadVO upload) {
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
			String fileRealName = file.getOriginalFilename();
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
						
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			
			String folderName = sdf.format(new Date()); // 오늘날짜
			String uploadFolder = "C:/test/upload/";
			
			File folder = new File(uploadFolder + folderName);
			if(!folder.exists()) {
				folder.mkdirs();
			}
			
			UUID uuid = UUID.randomUUID();
			String fileName = uuid.toString().replaceAll("-", "");
			
			File saveFile = new File(uploadFolder + folderName + "\\" + fileName + fileExtension);
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
	public List<PromotionVO> getList() {		
		return mapper.getList();
	}
	
	@Override
	public PromotionVO getPromotion(String promotionCode) {		
		return mapper.getPromotion(promotionCode);
	}

}
