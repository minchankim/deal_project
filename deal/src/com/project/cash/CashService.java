package com.project.cash;

import java.util.Map;

public interface CashService {

	public int insertCash(Cash dto);
	public int dataCount(Map<String, Object> map);
	public int readCash(String userId);
	public int returnCash(Cash dto);
}
