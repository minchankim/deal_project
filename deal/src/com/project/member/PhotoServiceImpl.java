package com.project.member;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.common.FileManager;
import com.project.common.dao.CommonDAO;
import com.project.deal.DealReply;


@Service("photo.photoServiceImpl")
public class PhotoServiceImpl implements PhotoService {
	@Autowired
	private CommonDAO  dao;
	@Autowired
	private FileManager fileManager;

	@Override
	public int insertPhoto(Photo pdto, String path) {
		int result=0;
		
		try {
			if(pdto.getUpload()!=null && ! pdto.getUpload().isEmpty()) {
				// 파일 업로드
				String newFilename=fileManager.doFileUpload(pdto.getUpload(), path);
				pdto.setImageFilename(newFilename);

				result=dao.insertData("member.insertPhoto", pdto);
			}
		} catch (Exception e) {
		}
		
		return result;
	}

	@Override
	public Photo readPhoto(String userId) {
		Photo dto=null;
	
		try {
			dto=dao.getReadData("member.readPhoto", userId);
		} catch (Exception e) {
		}
		
		return dto;
	}

	@Override
	public int deletePhotoId(String userId, String root) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int replyDataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int replyCountAnswer(int answer) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReplyLike(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Map<String, Object> replyCountLike(int replyNum) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public int dataCount() {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public List<Photo> listPhoto(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}




	@Override
	public int updatePhoto(Photo dto, String path) {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public int deletePhoto(int num, String imageFilename, String path) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Photo> listInPeople(int num) {
		List<Photo> list=null;
		try {
			list=dao.getListData("member.listInPeople", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}





}
