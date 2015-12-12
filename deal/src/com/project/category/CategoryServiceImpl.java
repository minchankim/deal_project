package com.project.category;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/*import com.project.common.FileManager;*/
import com.project.common.dao.CommonDAO;
import com.project.deal.Deal;


@Service("category.categoryService")
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	private CommonDAO  dao;
/*	@Autowired
	private FileManager fileManager;*/
	
	@Override
	public List<Deal> listCategoryDeal(Map<String, Object> map) {
	List<Deal> list=null;
		
		try{
			list=dao.getListData("category.listDeal", map);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public List<Deal> listCategoryDeal2(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
