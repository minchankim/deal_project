package com.project.main;

import java.util.List;
import java.util.Map;

import com.project.deal.Deal;

public interface MainService {
	
	public List<Deal> listDeal(Map<String, Object> map);
	public List<Deal> listDeal2(Map<String, Object> map);
	public List<Deal> dealInList(Map<String, Object> map);
	public List<Deal> dealUploadList(Map<String, Object> map);
}
