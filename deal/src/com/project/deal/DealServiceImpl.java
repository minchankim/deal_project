package com.project.deal;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.common.FileManager;
import com.project.common.dao.CommonDAO;




@Service("deal.dealService")
public class DealServiceImpl implements DealService{
	@Autowired
	private CommonDAO  dao;
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int insertDeal(Deal dto, String path) {
		int result=0;
		try{
			if(dto.getUpload()!=null && ! dto.getUpload().isEmpty()) {
				String saveFilename=fileManager.doFileUpload(dto.getUpload(), path);
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getUpload().getOriginalFilename());
			}
			if(dto.getSmillarNum()==0){
				result=dao.insertData("deal.insertNewDeal", dto);
			}else{
			result=dao.insertData("deal.insertDeal", dto);
			}
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Deal readDeal(int num) {
		Deal dto=null;
		try {
			dto=dao.getReadData("deal.readDeal", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int insertDealReply(DealReply dto) {
		int result=0;
	
		try{
			
			result=dao.insertData("deal.insertDealReply", dto);		
			dao.updateData("deal.updateAlarmCount", dto);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<DealReply> dealReplyList(Map<String, Object> map) {
		List<DealReply> list=null;
		try {
			list=dao.getListData("deal.listReply", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int insertDealLike(DealLike dto) {
		int result=0;
		try {
			result=dao.insertData("deal.insertDealLike", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}


	@Override
	public List<DealCategory> listBigCategory() {
		List<DealCategory> list = null;
		
		try {
			list=dao.getListData("deal.listBigCategory");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public List<DealCategory> listSmallCategory(int bcNum) {
		List<DealCategory> list = null;
		
		try {
			list=dao.getListData("deal.listSmallCategory", bcNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public List<DealCategory> listSmillarDeal(int smNum) {
		List<DealCategory> list = null;
		
		try {
			list=dao.getListData("deal.listSmillarDeal", smNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}


	@Override
	public List<Deal> readDealGraph(int smillarNum) {
		List<Deal> list=null;
	
		try {
			list=dao.getListData("deal.listDealGraph", smillarNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int updateDealIn(Deal dto) {
		int result=0;
		try{
			
	
				result=dao.insertData("deal.updateDealIn", dto);
	
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int updateDealOut(Deal dto) {
		int result=0;
		try{
	
				result=dao.deleteData("deal.updateDealOut", dto);
	
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Deal> listDealIn(String userId) {
		List<Deal> list=null;
		
		try {
			list=dao.getListData("deal.listDealIn", userId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int readDealJoinCount(String userId) {
		int result=0;
		try {
			result=dao.getReadData("deal.readDealJoinCount", userId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Deal> listDealSuccess() {
			List<Deal> list=null;
		
		try {
			list=dao.getListData("deal.listDealSuccess");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int updateDealSuccess(Deal dto) {
		int result=0;
		try{
			
	
				result=dao.insertData("deal.updateDealSuccess", dto);
	
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int updateDealFail(Deal dto) {
		int result=0;
		try{
	
				result=dao.deleteData("deal.updateDealFail", dto);
	
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}


}
