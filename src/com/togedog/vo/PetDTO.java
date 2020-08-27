package com.togedog.vo;

public class PetDTO
{
	private String petCd; // 펫코드
	private String ownCd; // 견주코드
	private String sharePetCd; // 소유코드
	private String petName; // 펫이름
	private String petGenderCd; // 펫성별코드
	private String petGender; // 펫성별
	private String petBirthday; // 생년월일
	private int petAge; // 나이 
	private String neutralDate; // 중성화일자
	private String neutral; // 중성화여부
	private double weight; // 몸무게
	private int disaCount; // 장애 수 
	private String disaName; // 장애명
	private String allergeCd; // 알러지코드
	private int allergeCount; // 알러지 수
	private String allergeName; // 알러지명
	
	// 추가
	private String vacCd;	// 예방접종 코드
	private String vacItem; // 예방접종명
	
	private int vacCount; // 예방접종 수
	private String dogItemCd; // 견종코드
	private String dogItem; // 견종명
	
	private int stanWeight; // 표준몸무게
	private String petPhoto; // 사진
	private String currentMedalCd; // 현재칭호코드
	private String currentMedal; // 현재칭호
	private double petRate; // 평점
	private int fdbCount; // 피드백수
	private String petSize; // 사이즈
	private int walkCount; // 산책횟수
	private int agcCount; // 대행횟수
	private int goodDog; // 명예강아지여부
	private String dogTypeCd; // 강아지구분코드
	private String dogType; // 강아지구분

	// OUT 매개변수 받는 변수 추가
	private String result;

	// 0729 추가
	private String walkPetSel;	// 산책펫 선택
	private String walkCd;		// 산책코드
	private String photo;		// 사진
	private String mdHead;		// 칭호 머리
	private String mdBody;		// 칭호 몸
	
	public String getPetCd()
	{
		return petCd;
	}

	public void setPetCd(String petCd)
	{
		this.petCd = petCd;
	}

	public String getOwnCd()
	{
		return ownCd;
	}

	public void setOwnCd(String ownCd)
	{
		this.ownCd = ownCd;
	}

	public String getSharePetCd()
	{
		return sharePetCd;
	}

	public void setSharePetCd(String sharePetCd)
	{
		this.sharePetCd = sharePetCd;
	}

	public String getPetName()
	{
		return petName;
	}

	public void setPetName(String petName)
	{
		this.petName = petName;
	}

	public String getPetGenderCd()
	{
		return petGenderCd;
	}

	public void setPetGenderCd(String petGenderCd)
	{
		this.petGenderCd = petGenderCd;
	}

	public String getPetGender()
	{
		return petGender;
	}

	public void setPetGender(String petGender)
	{
		this.petGender = petGender;
	}

	public int getPetAge()
	{
		return petAge;
	}

	public void setPetAge(int petAge)
	{
		this.petAge = petAge;
	}

	public String getNeutralDate()
	{
		return neutralDate;
	}

	public void setNeutralDate(String neutralDate)
	{
		this.neutralDate = neutralDate;
	}

	public String getNeutral()
	{
		return neutral;
	}

	public void setNeutral(String neutral)
	{
		this.neutral = neutral;
	}

	public double getWeight()
	{
		return weight;
	}

	public void setWeight(double weight)
	{
		this.weight = weight;
	}

	public int getDisaCount()
	{
		return disaCount;
	}

	public void setDisaCount(int disaCount)
	{
		this.disaCount = disaCount;
	}

	public String getDisaName()
	{
		return disaName;
	}

	public void setDisaName(String disaName)
	{
		this.disaName = disaName;
	}

	public String getAllergeCd()
	{
		return allergeCd;
	}

	public void setAllergeCd(String allergeCd)
	{
		this.allergeCd = allergeCd;
	}

	public int getAllergeCount()
	{
		return allergeCount;
	}

	public void setAllergeCount(int allergeCount)
	{
		this.allergeCount = allergeCount;
	}

	public String getAllergeName()
	{
		return allergeName;
	}

	public void setAllergeName(String allergeName)
	{
		this.allergeName = allergeName;
	}

	public int getVacCount()
	{
		return vacCount;
	}

	public void setVacCount(int vacCount)
	{
		this.vacCount = vacCount;
	}

	public String getDogItemCd()
	{
		return dogItemCd;
	}

	public void setDogItemCd(String dogItemCd)
	{
		this.dogItemCd = dogItemCd;
	}


	public String getPetPhoto()
	{
		return petPhoto;
	}

	public void setPetPhoto(String petPhoto)
	{
		this.petPhoto = petPhoto;
	}

	public String getCurrentMedalCd()
	{
		return currentMedalCd;
	}

	public void setCurrentMedalCd(String currentMedalCd)
	{
		this.currentMedalCd = currentMedalCd;
	}

	public String getCurrentMedal()
	{
		return currentMedal;
	}

	public void setCurrentMedal(String currentMedal)
	{
		this.currentMedal = currentMedal;
	}

	public double getPetRate()
	{
		return petRate;
	}

	public void setPetRate(double petRate)
	{
		this.petRate = petRate;
	}

	public int getFdbCount()
	{
		return fdbCount;
	}

	public void setFdbCount(int fdbCount)
	{
		this.fdbCount = fdbCount;
	}


	public int getWalkCount()
	{
		return walkCount;
	}

	public void setWalkCount(int walkCount)
	{
		this.walkCount = walkCount;
	}

	public int getAgcCount()
	{
		return agcCount;
	}

	public void setAgcCount(int agcCount)
	{
		this.agcCount = agcCount;
	}

	public int getGoodDog()
	{
		return goodDog;
	}

	public void setGoodDog(int goodDog)
	{
		this.goodDog = goodDog;
	}

	public String getDogTypeCd()
	{
		return dogTypeCd;
	}

	public void setDogTypeCd(String dogTypeCd)
	{
		this.dogTypeCd = dogTypeCd;
	}

	public String getDogType()
	{
		return dogType;
	}

	public void setDogType(String dogType)
	{
		this.dogType = dogType;
	}

	public String getResult()
	{
		return result;
	}

	public void setResult(String result)
	{
		this.result = result;
	}

	public int getStanWeight()
	{
		return stanWeight;
	}

	public void setStanWeight(int stanWeight)
	{
		this.stanWeight = stanWeight;
	}

	public String getVacCd()
	{
		return vacCd;
	}

	public void setVacCd(String vacCd)
	{
		this.vacCd = vacCd;
	}

	public String getVacItem()
	{
		return vacItem;
	}

	public void setVacItem(String vacItem)
	{
		this.vacItem = vacItem;
	}

	public String getWalkPetSel()
	{
		return walkPetSel;
	}

	public void setWalkPetSel(String walkPetSel)
	{
		this.walkPetSel = walkPetSel;
	}

	public String getWalkCd()
	{
		return walkCd;
	}

	public void setWalkCd(String walkCd)
	{
		this.walkCd = walkCd;
	}

	public String getPhoto()
	{
		return photo;
	}

	public void setPhoto(String photo)
	{
		this.photo = photo;
	}

	public String getMdHead()
	{
		return mdHead;
	}

	public void setMdHead(String mdHead)
	{
		this.mdHead = mdHead;
	}

	public String getMdBody()
	{
		return mdBody;
	}

	public void setMdBody(String mdBody)
	{
		this.mdBody = mdBody;
	}

	public String getPetSize()
	{
		return petSize;
	}

	public void setPetSize(String petSize)
	{
		this.petSize = petSize;
	}

	public String getPetBirthday()
	{
		return petBirthday;
	}

	public void setPetBirthday(String petBirthday)
	{
		this.petBirthday = petBirthday;
	}

	public String getDogItem()
	{
		return dogItem;
	}

	public void setDogItem(String dogItem)
	{
		this.dogItem = dogItem;
	}
	
	
	
	
	
	
}
