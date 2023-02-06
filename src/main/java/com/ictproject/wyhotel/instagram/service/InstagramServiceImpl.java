package com.ictproject.wyhotel.instagram.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ictproject.wyhotel.command.InstagramVO;
import com.ictproject.wyhotel.instagram.mapper.IInstagramMapper;
import com.ictproject.wyhotel.util.paging.PageVO;

@Service
public class InstagramServiceImpl implements IInstagramService {
	
	@Autowired
	private IInstagramMapper mapper;
	
	@Override
	public void insert(InstagramVO vo, MultipartFile file) {
		//날짜별 폴더 생성 후 관리
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyMMdd");
		String strDate = dateFormat.format(new Date());
		
		//기본 경로는 C:/test/upload
		String uploadFolder = "C:/test/upload/" + strDate;
		String uploadPath = "C:/test/upload/";
		
		//폴더 없으면 새로 생성
		File folder = new File(uploadFolder);
		if(!folder.exists()) {
			folder.mkdirs(); //폴더 없으면 생성
		}
		
		//저장할 파일명을 UUID를 이용하여 파일명을 저장, UUID가 생성한 고유한 랜덤 문자열을 파일명으로 사용
		String fileRealName = file.getOriginalFilename();//파일 진짜이름
		
		UUID uuid = UUID.randomUUID();
		String uuids = uuid.toString().replaceAll("-", ""); //하이폰 제거
		
		//확장자 추출
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
		
		//변경해서 저장할 파일 명
		String fileName = uuids + fileExtension;
		
		//업로드한 파일을 지정한 로컬 경로로 저장
		File saveFile = new File(uploadFolder + "/" + fileName);
		
		try {
			file.transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		vo.setUploadPath(uploadPath);
		vo.setFileLoca(strDate);
		vo.setFileName(fileName);
		vo.setFileRealName(fileRealName);
		
		mapper.insert(vo);
		
	}
	
	@Override
	public List<InstagramVO> getList(PageVO paging) {
		return mapper.getList(paging);
	}
	
	@Override
	public InstagramVO getDetail(int bno) {
		return mapper.getDetail(bno);
	}
	
	@Override
	public void delete(int bno) {
		mapper.delete(bno);
	}
	@Override
	public void modify(InstagramVO vo) {
		mapper.modify(vo);
	}
	
}
