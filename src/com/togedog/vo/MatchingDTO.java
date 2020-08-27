package com.togedog.vo;

public class MatchingDTO
{
	// 사진, 산책코드, 대행코드, 워커코드, 견주코드, 이름, 닉네임, 나이, 성별코드, 성별, 단계코드, 단계
	private String photo, walkCd, agcCd, wokCd, ownCd, name, nickName, age, genderCd, gender, gradeCd, grade;
	
	// 주소 시도 코드, 주소 시군구 코드, 주소 동읍면 코드, 주소 시도, 주소 시군구, 주소 동읍면, 상세주소
	private String addrCd1, addrCd2, addrCd3, addr1, addr2, addr3, addrDetail;
	
	// 관심사 코드, 관심사, 상세관심사
	private String intrCd, intr, intrDetail;
	
	// 산책일, 시작시간, 종료시간, 등록일, 최근산책일
	private String walkDate, startTime, endTime, insDate, lastWalk;
	
	// 펫 코드, 펫 이름, 펫 나이, 펫 성별 코드, 펫 성별, 중성화 일시, 견종, 펫 생일, 장애코드, 장애명, 알러지 코드, 알러지명, 사이즈 
	private String petCd, petName, petAge, petGenderCd, petGender, neutralDate, dogItemCd, dogItem, petBirthday, disaCd, disaName, alleCd, alleName, petSize;
	
	// 칭호(달성횟수), 칭호(칭호명), 대표강아지
	private String mdHead, mdBody, dogType;
	
	// 번호, 펫 수, 피드백 수, 명강
	private int rowN, petCount, fdbCount, goodDog, price;
	
	// 피드백 평점, 몸무게, 항목별 점수
	private double fdbAvg, weight, itemScore;
	
	// 항목
	private String itemName;
	
	// 0728 추가
	private String walkLastCd;	// 최종산책매칭 코드
	private String walkCd2;		// 산책선택 산책코드
	private String ownCd1;		// 산책등록 견주코드
	private String ownCd2;		// 산책선택 견주코드
	private String status;		// 상태
	private String userCd1;		// 회원코드1 (산책등록한 회원)
	private String userCd2;		// 회원코드2 (산책신청한 회원)
	private String weatherCd;	// 날씨 코드
	private String msg;
	
	/// 0818 추가
	private String agcSelCd;	// 대행선택코드(워커가 선택)
	

	public String getMsg()
	{
		return msg;
	}

	public void setMsg(String msg)
	{
		this.msg = msg;
	}

	public String getWokCd()
	{
		return wokCd;
	}

	public void setWokCd(String wokCd)
	{
		this.wokCd = wokCd;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getWeatherCd()
	{
		return weatherCd;
	}

	public void setWeatherCd(String weatherCd)
	{
		this.weatherCd = weatherCd;
	}

	public String getDogItem()
	{
		return dogItem;
	}

	public void setDogItem(String dogItem)
	{
		this.dogItem = dogItem;
	}

	public String getPetSize()
	{
		return petSize;
	}

	public void setPetSize(String petSize)
	{
		this.petSize = petSize;
	}

	public String getWalkLastCd()
	{
		return walkLastCd;
	}

	public void setWalkLastCd(String walkLastCd)
	{
		this.walkLastCd = walkLastCd;
	}

	public String getWalkCd2()
	{
		return walkCd2;
	}

	public void setWalkCd2(String walkCd2)
	{
		this.walkCd2 = walkCd2;
	}

	public String getOwnCd2()
	{
		return ownCd2;
	}

	public void setOwnCd2(String ownCd2)
	{
		this.ownCd2 = ownCd2;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getWalkCd() {
		return walkCd;
	}

	public void setWalkCd(String walkCd) {
		this.walkCd = walkCd;
	}

	public String getAgcCd() {
		return agcCd;
	}

	public void setAgcCd(String agcCd) {
		this.agcCd = agcCd;
	}

	public String getOwnCd() {
		return ownCd;
	}

	public void setOwnCd(String ownCd) {
		this.ownCd = ownCd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getGenderCd() {
		return genderCd;
	}

	public void setGenderCd(String genderCd) {
		this.genderCd = genderCd;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getGradeCd() {
		return gradeCd;
	}

	public void setGradeCd(String gradeCd) {
		this.gradeCd = gradeCd;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getAddrCd1() {
		return addrCd1;
	}

	public void setAddrCd1(String addrCd1) {
		this.addrCd1 = addrCd1;
	}

	public String getAddrCd2() {
		return addrCd2;
	}

	public void setAddrCd2(String addrCd2) {
		this.addrCd2 = addrCd2;
	}

	public String getAddrCd3() {
		return addrCd3;
	}

	public void setAddrCd3(String addrCd3) {
		this.addrCd3 = addrCd3;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getAddr3() {
		return addr3;
	}

	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}

	public String getAddrDetail() {
		return addrDetail;
	}

	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}

	public String getIntrCd() {
		return intrCd;
	}

	public void setIntrCd(String intrCd) {
		this.intrCd = intrCd;
	}

	public String getIntr() {
		return intr;
	}

	public void setIntr(String intr) {
		this.intr = intr;
	}

	public String getIntrDetail() {
		return intrDetail;
	}

	public void setIntrDetail(String intrDetail) {
		this.intrDetail = intrDetail;
	}

	public String getWalkDate() {
		return walkDate;
	}

	public void setWalkDate(String walkDate) {
		this.walkDate = walkDate;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getInsDate() {
		return insDate;
	}

	public void setInsDate(String insDate) {
		this.insDate = insDate;
	}

	public String getLastWalk() {
		return lastWalk;
	}

	public void setLastWalk(String lastWalk) {
		this.lastWalk = lastWalk;
	}

	public String getPetCd() {
		return petCd;
	}

	public void setPetCd(String petCd) {
		this.petCd = petCd;
	}

	public String getPetName() {
		return petName;
	}

	public void setPetName(String petName) {
		this.petName = petName;
	}

	public String getPetAge() {
		return petAge;
	}

	public void setPetAge(String petAge) {
		this.petAge = petAge;
	}

	public String getPetGenderCd() {
		return petGenderCd;
	}

	public void setPetGenderCd(String petGenderCd) {
		this.petGenderCd = petGenderCd;
	}

	public String getPetGender() {
		return petGender;
	}

	public void setPetGender(String petGender) {
		this.petGender = petGender;
	}

	public String getNeutralDate() {
		return neutralDate;
	}

	public void setNeutralDate(String neutralDate) {
		this.neutralDate = neutralDate;
	}

	public String getDogType() {
		return dogType;
	}

	public void setDogType(String dogType) {
		this.dogType = dogType;
	}

	public String getPetBirthday() {
		return petBirthday;
	}

	public void setPetBirthday(String petBirthday) {
		this.petBirthday = petBirthday;
	}

	public String getDisaCd() {
		return disaCd;
	}

	public void setDisaCd(String disaCd) {
		this.disaCd = disaCd;
	}

	public String getDisaName() {
		return disaName;
	}

	public void setDisaName(String disaName) {
		this.disaName = disaName;
	}

	public String getAlleCd() {
		return alleCd;
	}

	public void setAlleCd(String alleCd) {
		this.alleCd = alleCd;
	}

	public String getAlleName() {
		return alleName;
	}

	public void setAlleName(String alleName) {
		this.alleName = alleName;
	}

	public String getMdHead() {
		return mdHead;
	}

	public void setMdHead(String mdHead) {
		this.mdHead = mdHead;
	}

	public String getMdBody() {
		return mdBody;
	}

	public void setMdBody(String mdBody) {
		this.mdBody = mdBody;
	}

	public int getGoodDog() {
		return goodDog;
	}

	public void setGoodDog(int goodDog) {
		this.goodDog = goodDog;
	}

	public int getRowN() {
		return rowN;
	}

	public void setRowN(int rowN) {
		this.rowN = rowN;
	}

	public int getPetCount() {
		return petCount;
	}

	public void setPetCount(int petCount) {
		this.petCount = petCount;
	}

	public int getFdbCount() {
		return fdbCount;
	}

	public void setFdbCount(int fdbCount) {
		this.fdbCount = fdbCount;
	}

	public double getFdbAvg() {
		return fdbAvg;
	}

	public void setFdbAvg(double fdbAvg) {
		this.fdbAvg = fdbAvg;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public double getItemScore() {
		return itemScore;
	}

	public void setItemScore(double itemScore) {
		this.itemScore = itemScore;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getStatus()
	{
		return status;
	}

	public void setStatus(String status)
	{
		this.status = status;
	}

	public String getUserCd1()
	{
		return userCd1;
	}

	public void setUserCd1(String userCd1)
	{
		this.userCd1 = userCd1;
	}

	public String getUserCd2()
	{
		return userCd2;
	}

	public void setUserCd2(String userCd2)
	{
		this.userCd2 = userCd2;
	}

	public String getOwnCd1()
	{
		return ownCd1;
	}

	public void setOwnCd1(String ownCd1)
	{
		this.ownCd1 = ownCd1;
	}

	public String getDogItemCd()
	{
		return dogItemCd;
	}

	public void setDogItemCd(String dogItemCd)
	{
		this.dogItemCd = dogItemCd;
	}

	public String getAgcSelCd()
	{
		return agcSelCd;
	}

	public void setAgcSelCd(String agcSelCd)
	{
		this.agcSelCd = agcSelCd;
	}
}
