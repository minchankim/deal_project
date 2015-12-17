package com.project.deal;

import java.util.List;
import java.util.Map;



public interface DealService {
	
	public int insertDeal(Deal dto, String path);
	public Deal readDeal(int num);
	public List<Deal> readDealGraph(int smillarNum);
	public int insertDealReply(DealReply dto);
	public List<DealReply> dealReplyList(Map<String, Object> map);
	public int insertDealLike(DealLike dto);
	public List<DealCategory> listBigCategory();
	public List<DealCategory> listSmallCategory(int bcNum);
	public List<DealCategory> listSmillarDeal(int smNum);
	
	
	public int updateDealIn(Deal dto);
	public int updateDealOut(Deal dto);
	public List<Deal> listDealIn(String userId);
	
	public List<Deal> listDealSuccess();
	public int updateDealSuccess(Deal dto);
	public int updateDealFail(Deal dto);
	
	
	public int readDealJoinCount(String userId);
	
}
