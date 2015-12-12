package com.project.member;

import java.util.List;
import java.util.Map;

public interface PhotoService {
	public int insertPhoto(Photo pdto, String path);
	public int dataCount();
	public List<Photo> listPhoto(Map<String, Object> map);
	public Photo readPhoto(String userId);
	public int updatePhoto(Photo dto, String path);
	public int deletePhoto(int num, String imageFilename, String path);
	
	public int deletePhotoId(String userId, String root);
	

	public int replyDataCount(Map<String, Object> map);
	public int replyCountAnswer(int answer);
	public int deleteReply(Map<String, Object> map);


	public int deleteReplyLike(Map<String, Object> map);
	public Map<String, Object> replyCountLike(int replyNum);
	
	public List<Photo> listInPeople(int num);
}
