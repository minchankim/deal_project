package com.project.deal;

import org.springframework.web.multipart.MultipartFile;

public class Deal {

		private int num;
		private int dealNum;
		private String userId,userName,subject,category1,category2,start_date,end_date,content,imageFilename,region1,region2,tag1,tag2;
		private String image1,image2,image3,image4,image5,image6,image7,image8,image9,image10,created;
		
		private int price,instantPrice,discountRate,people,approveCheck;
		private MultipartFile upload;
		private String saveFilename;
		private String originalFilename;
		private int countLike,smillarNum;
		private int dealmonth,avgprice;
		private int alarmCount;
		
		
		public int getAlarmCount() {
			return alarmCount;
		}
		public void setAlarmCount(int alarmCount) {
			this.alarmCount = alarmCount;
		}
		public int getDealNum() {
			return dealNum;
		}
		public void setDealNum(int dealNum) {
			this.dealNum = dealNum;
		}
		public int getAvgprice() {
			return avgprice;
		}
		public void setAvgprice(int avgprice) {
			this.avgprice = avgprice;
		}
		public int getDealmonth() {
			return dealmonth;
		}
		public void setDealmonth(int dealmonth) {
			this.dealmonth = dealmonth;
		}
		public String getCreated() {
			return created;
		}
		public void setCreated(String created) {
			this.created = created;
		}
		public int getSmillarNum() {
			return smillarNum;
		}
		public void setSmillarNum(int smillarNum) {
			this.smillarNum = smillarNum;
		}
		public int getCountLike() {
			return countLike;
		}
		public void setCountLike(int countLike) {
			this.countLike = countLike;
		}
		public int getNum() {
		return num;
		}
		public void setNum(int num) {
		this.num = num;
		}
		
		public MultipartFile getUpload() {
			return upload;
		}
		public void setUpload(MultipartFile upload) {
			this.upload = upload;
		}
		public String getSaveFilename() {
			return saveFilename;
		}
		public void setSaveFilename(String saveFilename) {
			this.saveFilename = saveFilename;
		}
		public String getOriginalFilename() {
			return originalFilename;
		}
		public void setOriginalFilename(String originalFilename) {
			this.originalFilename = originalFilename;
		}
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
		public String getUserName() {
			return userName;
		}
		public void setUserName(String userName) {
			this.userName = userName;
		}
		public String getSubject() {
			return subject;
		}
		public void setSubject(String subject) {
			this.subject = subject;
		}
		public String getCategory1() {
			return category1;
		}
		public void setCategory1(String category1) {
			this.category1 = category1;
		}
		public String getCategory2() {
			return category2;
		}
		public void setCategory2(String category2) {
			this.category2 = category2;
		}
		public String getStart_date() {
			return start_date;
		}
		public void setStart_date(String start_date) {
			this.start_date = start_date;
		}
		public String getEnd_date() {
			return end_date;
		}
		public void setEnd_date(String end_date) {
			this.end_date = end_date;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getImageFilename() {
			return imageFilename;
		}
		public void setImageFilename(String imageFilename) {
			this.imageFilename = imageFilename;
		}
		public String getRegion1() {
			return region1;
		}
		public void setRegion1(String region1) {
			this.region1 = region1;
		}
		public String getRegion2() {
			return region2;
		}
		public void setRegion2(String region2) {
			this.region2 = region2;
		}
		public String getTag1() {
			return tag1;
		}
		public void setTag1(String tag1) {
			this.tag1 = tag1;
		}
		public String getTag2() {
			return tag2;
		}
		public void setTag2(String tag2) {
			this.tag2 = tag2;
		}
		public int getPrice() {
			return price;
		}
		public void setPrice(int price) {
			this.price = price;
		}
		public int getInstantPrice() {
			return instantPrice;
		}
		public void setInstantPrice(int instantPrice) {
			this.instantPrice = instantPrice;
		}
		public int getDiscountRate() {
			return discountRate;
		}
		public void setDiscountRate(int discountRate) {
			this.discountRate = discountRate;
		}
		public int getPeople() {
			return people;
		}
		public void setPeople(int people) {
			this.people = people;
		}
		public int getApproveCheck() {
			return approveCheck;
		}
		public void setApproveCheck(int approveCheck) {
			this.approveCheck = approveCheck;
		}
		public String getImage1() {
			return image1;
		}
		public void setImage1(String image1) {
			this.image1 = image1;
		}
		public String getImage2() {
			return image2;
		}
		public void setImage2(String image2) {
			this.image2 = image2;
		}
		public String getImage3() {
			return image3;
		}
		public void setImage3(String image3) {
			this.image3 = image3;
		}
		public String getImage4() {
			return image4;
		}
		public void setImage4(String image4) {
			this.image4 = image4;
		}
		public String getImage5() {
			return image5;
		}
		public void setImage5(String image5) {
			this.image5 = image5;
		}
		public String getImage6() {
			return image6;
		}
		public void setImage6(String image6) {
			this.image6 = image6;
		}
		public String getImage7() {
			return image7;
		}
		public void setImage7(String image7) {
			this.image7 = image7;
		}
		public String getImage8() {
			return image8;
		}
		public void setImage8(String image8) {
			this.image8 = image8;
		}
		public String getImage9() {
			return image9;
		}
		public void setImage9(String image9) {
			this.image9 = image9;
		}
		public String getImage10() {
			return image10;
		}
		public void setImage10(String image10) {
			this.image10 = image10;
		}
		
}
