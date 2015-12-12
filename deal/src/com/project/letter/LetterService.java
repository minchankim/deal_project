package com.project.letter;

import java.util.List;
import java.util.Map;

public interface LetterService {
	

	
	public int insertLetter(Letter dto);

	public int dataCountReceive(Map<String, Object> map);
	public List<Letter> listReceive(Map<String, Object> map);
	
	public int dataCountSend(Map<String, Object> map);
	public List<Letter> listSend(Map<String, Object> map);
	
	public Letter readReceive(int num);
	public Letter preReadReceive(Map<String, Object> map);
	public Letter nextReadReceive(Map<String, Object> map);
	public Letter readSend(int num);
	public Letter preReadSend(Map<String, Object> map);
	public Letter nextReadSend(Map<String, Object> map);
	
	public Letter readReplReceive(int num);
	
	public int updateIdentifyDay(int num);
	
	public int deleteLetter(Map<String, Object> map);
	
	public int newLetterCount(String userId);

	public List<Letter> listSend(String userId);
	public List<Letter> listReceive(String userId);
}
