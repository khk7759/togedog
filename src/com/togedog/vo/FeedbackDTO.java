package com.togedog.vo;

public class FeedbackDTO
{
   // 산책 관련 dto
   private String walkLastCd, walkPetSelCd, insDate;
   
   // 강아지 관련 dto
   private String dogFdbItemCd; // 피드백 항목 코드
   private String dogFdbItem; // 피드백 항목
   private int dogFdbScore; // 피드백 항목마다의 점수
   
   //-- 견주 관련 dto
   private String ownFdbItemCd; // 피드백 항목 코드
   private String ownFdbItem; // 피드백 항목
   private int ownFdbScore; // 피드백 항목마다의 점수

   // 대행 관련 dto
   //-- 워커 관련 dto
   private String wokFdbItemCd; // 피드백 항목 코드
   private String wokFdbItem; // 피드백 항목
   private int wokFdbScore; // 피드백 항목마다의 점수
   
   
   // 추가
   private String ownFdbCd;	// 견주피드백코드
   private String dogFdbCd;	// 펫피드백코드
   private String wokFdbCd;	// 워커피드백코드
   private String ownCd;	// 피드백한견주코드
   
   
   // getter / setter 구성
   public String getWalkLastCd()
   {
      return walkLastCd;
   }
   public void setWalkLastCd(String walkLastCd)
   {
      this.walkLastCd = walkLastCd;
   }
   public String getWalkPetSelCd()
   {
      return walkPetSelCd;
   }
   public void setWalkPetSelCd(String walkPetSelCd)
   {
      this.walkPetSelCd = walkPetSelCd;
   }
   public String getInsDate()
   {
      return insDate;
   }
   public void setInsDate(String insDate)
   {
      this.insDate = insDate;
   }
   
   public String getDogFdbItemCd()
   {
      return dogFdbItemCd;
   }
   public void setDogFdbItemCd(String dogFdbItemCd)
   {
      this.dogFdbItemCd = dogFdbItemCd;
   }
   public String getDogFdbItem()
   {
      return dogFdbItem;
   }
   public void setDogFdbItem(String dogFdbItem)
   {
      this.dogFdbItem = dogFdbItem;
   }
   public int getDogFdbScore()
   {
      return dogFdbScore;
   }
   public void setDogFdbScore(int dogFdbScore)
   {
      this.dogFdbScore = dogFdbScore;
   }
   public String getOwnFdbItemCd()
   {
      return ownFdbItemCd;
   }
   public void setOwnFdbItemCd(String ownFdbItemCd)
   {
      this.ownFdbItemCd = ownFdbItemCd;
   }
   public String getOwnFdbItem()
   {
      return ownFdbItem;
   }
   public void setOwnFdbItem(String ownFdbItem)
   {
      this.ownFdbItem = ownFdbItem;
   }
   public int getOwnFdbScore()
   {
      return ownFdbScore;
   }
   public void setOwnFdbScore(int ownFdbScore)
   {
      this.ownFdbScore = ownFdbScore;
   }
   public String getWokFdbItemCd()
   {
      return wokFdbItemCd;
   }
   public void setWokFdbItemCd(String wokFdbItemCd)
   {
      this.wokFdbItemCd = wokFdbItemCd;
   }
   public String getWokFdbItem()
   {
      return wokFdbItem;
   }
   public void setWokFdbItem(String wokFdbItem)
   {
      this.wokFdbItem = wokFdbItem;
   }
   public int getWokFdbScore()
   {
      return wokFdbScore;
   }
   public void setWokFdbScore(int wokFdbScore)
   {
      this.wokFdbScore = wokFdbScore;
   }
public String getOwnFdbCd()
{
	return ownFdbCd;
}
public void setOwnFdbCd(String ownFdbCd)
{
	this.ownFdbCd = ownFdbCd;
}
public String getDogFdbCd()
{
	return dogFdbCd;
}
public void setDogFdbCd(String dogFdbCd)
{
	this.dogFdbCd = dogFdbCd;
}
public String getWokFdbCd()
{
	return wokFdbCd;
}
public void setWokFdbCd(String wokFdbCd)
{
	this.wokFdbCd = wokFdbCd;
}
public String getOwnCd()
{
	return ownCd;
}
public void setOwnCd(String ownCd)
{
	this.ownCd = ownCd;
}

}