package com.project.category;

import java.util.List;
import java.util.Map;

import com.project.deal.Deal;

public interface CategoryService {
	
	public List<Deal> listCategoryDeal(Map<String, Object> map);
	public List<Deal> listCategoryDeal2(Map<String, Object> map);

}


