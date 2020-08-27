package com.togedog.vo;

public class UserDTO
{
	// 회원 코드, 견주 코드, 워커 코드, 회원구분 코드, 회원 구분
	private String code, ownCd, wokCd, userTypeCd, userType;
	
	// 아이디, 패스워드, 이름, 생일, 성별코드, 성별, 전화번호, 이메일, 은행코드, 은행 , 계좌번호, 체크리스트, 사진, 정지, 탈퇴
	private String id, pwd, name, birthday, genderCd, gender, tel, email, bankCd, bank, accNum, checkList, photo, stoped, bye;
	
	// 주소코드1, 주소코드2, 주소코드3, 주소1, 주소2, 주소3, 상세주소
	private String addrCd1, addrCd2, addrCd3, addr1, addr2, addr3, addrDetail;
	
	// 닉네임, 관심사코드, 관심사, 상세관심사, 단계, 최근 산책일
	private String nickName, intrCd, intr, intrDetail, grade, recentWalk;
	
	// 요일코드, 요일
	private String dayCd, day;
	
	// 선호 시작시간, 선호끝시간
	private int favStart, favEnd;
	
	// 직업 코드, 직업, 양육경험, 경력사항 , 워커신청메세지
	private String jobCd, job, nurtureExp, careerName, msg;
	
	// 추가
	private String question1, question2;
	
	// 워커 자격증 코드, 자격증 이름
	private String crtCd, crtItem;
	
	// 나이, 받은 피드백 수, 통합포인트, 산책 횟수, 대행 횟수
	private int age, fdbCount, point, walkCount, agcCount;
	
	// 평점
	private double rate;

	// OUT 매개변수 반환값 담는 변수 추가 
	private String result;
	
	// 알림 코드, 쪽지코드, 등록일, 열람일
	private String notiCd, noteCd, insDate, openDate;
	
	// 정지 등록일, (정지 등록일 + 정지기간)
	private String stopDate, stopNumDate;
	
	// 정지기간, 기간지났는지 판별 변수
	private int stopNum, stopEnd;
	
	// 강제탈퇴 사유 코드, 항목
	private String blkItemCd, blackItem;
	
	// 추가
	private String pointItemCd;
	private String pointItem;
	private int score;
	private String beforePwd; 
	
	private String itemCd, item;
	
	// 추가
	private String wokApplyCd;
	
	

	public String getItemCd()
	{
		return itemCd;
	}

	public void setItemCd(String itemCd)
	{
		this.itemCd = itemCd;
	}

	public String getItem()
	{
		return item;
	}

	public void setItem(String item)
	{
		this.item = item;
	}

	public String getNotiCd() {
		return notiCd;
	}

	public String getBlkItemCd()
	{
		return blkItemCd;
	}

	public void setBlkItemCd(String blkItemCd)
	{
		this.blkItemCd = blkItemCd;
	}

	public String getBlackItem() {
		return blackItem;
	}

	public void setBlackItem(String blackItem) {
		this.blackItem = blackItem;
	}

	public String getStopDate() {
		return stopDate;
	}

	public void setStopDate(String stopDate) {
		this.stopDate = stopDate;
	}

	public String getStopNumDate() {
		return stopNumDate;
	}

	public void setStopNumDate(String stopNumDate) {
		this.stopNumDate = stopNumDate;
	}

	public int getStopNum() {
		return stopNum;
	}

	public void setStopNum(int stopNum) {
		this.stopNum = stopNum;
	}

	public int getStopEnd() {
		return stopEnd;
	}

	public void setStopEnd(int stopEnd) {
		this.stopEnd = stopEnd;
	}

	public void setNotiCd(String notiCd) {
		this.notiCd = notiCd;
	}
	
	public String getNoteCd() {
		return noteCd;
	}

	public void setNoteCd(String noteCd) {
		this.noteCd = noteCd;
	}

	public String getInsDate() {
		return insDate;
	}

	public void setInsDate(String insDate) {
		this.insDate = insDate;
	}
	
	public String getOpenDate() {
		return openDate;
	}

	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}

	public String getPhoto()
	{
		return photo;
	}
	
	public void setPhoto(String photo)
	{
		this.photo = photo;
	}
	
	public String getUserType()
	{
		return userType;
	}
	
	public void setUserType(String userType)
	{
		this.userType = userType;
	}
	
	public String getBye()
	{
		return bye;
	}

	public String getStoped()
	{
		return stoped;
	}

	public void setStoped(String stoped)
	{
		this.stoped = stoped;
	}


	public void setBye(String bye)
	{
		this.bye = bye;
	}

	//--끝
	
	
	public void setResult(String result)
	{
		this.result = result;
	}


	public String getResult()
	{
		return result;
	}


	public String getMsg()
	{
		return msg;
	}

	public void setMsg(String msg)
	{
		this.msg = msg;
	}

	public String getCode()
	{
		return code;
	}

	public void setCode(String code)
	{
		this.code = code;
	}

	public String getOwnCd()
	{
		return ownCd;
	}

	public void setOwnCd(String ownCd)
	{
		this.ownCd = ownCd;
	}

	public String getWokCd()
	{
		return wokCd;
	}

	public void setWokCd(String wokCd)
	{
		this.wokCd = wokCd;
	}

	public String getUserTypeCd()
	{
		return userTypeCd;
	}

	public void setUserTypeCd(String userTypeCd)
	{
		this.userTypeCd = userTypeCd;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getPwd()
	{
		return pwd;
	}

	public void setPwd(String pwd)
	{
		this.pwd = pwd;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getBirthday()
	{
		return birthday;
	}

	public void setBirthday(String birthday)
	{
		this.birthday = birthday;
	}

	public String getGenderCd()
	{
		return genderCd;
	}

	public void setGenderCd(String genderCd)
	{
		this.genderCd = genderCd;
	}

	public String getGender()
	{
		return gender;
	}

	public void setGender(String gender)
	{
		this.gender = gender;
	}

	public String getTel()
	{
		return tel;
	}

	public void setTel(String tel)
	{
		this.tel = tel;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getBankCd()
	{
		return bankCd;
	}

	public void setBankCd(String bankCd)
	{
		this.bankCd = bankCd;
	}

	public String getBank()
	{
		return bank;
	}

	public void setBank(String bank)
	{
		this.bank = bank;
	}

	public String getAccNum()
	{
		return accNum;
	}

	public void setAccNum(String accNum)
	{
		this.accNum = accNum;
	}

	public String getCheckList()
	{
		return checkList;
	}

	public void setCheckList(String checkList)
	{
		this.checkList = checkList;
	}

	public String getAddrCd1()
	{
		return addrCd1;
	}

	public void setAddrCd1(String addrCd1)
	{
		this.addrCd1 = addrCd1;
	}

	public String getAddrCd2()
	{
		return addrCd2;
	}

	public void setAddrCd2(String addrCd2)
	{
		this.addrCd2 = addrCd2;
	}

	public String getAddrCd3()
	{
		return addrCd3;
	}

	public void setAddrCd3(String addrCd3)
	{
		this.addrCd3 = addrCd3;
	}

	public String getAddr1()
	{
		return addr1;
	}

	public void setAddr1(String addr1)
	{
		this.addr1 = addr1;
	}

	public String getAddr2()
	{
		return addr2;
	}

	public void setAddr2(String addr2)
	{
		this.addr2 = addr2;
	}

	public String getAddr3()
	{
		return addr3;
	}

	public void setAddr3(String addr3)
	{
		this.addr3 = addr3;
	}

	public String getAddrDetail()
	{
		return addrDetail;
	}

	public void setAddrDetail(String addrDetail)
	{
		this.addrDetail = addrDetail;
	}

	public String getNickName()
	{
		return nickName;
	}

	public void setNickName(String nickName)
	{
		this.nickName = nickName;
	}

	public String getIntrCd()
	{
		return intrCd;
	}

	public void setIntrCd(String intrCd)
	{
		this.intrCd = intrCd;
	}

	public String getIntr()
	{
		return intr;
	}

	public void setIntr(String intr)
	{
		this.intr = intr;
	}

	public String getIntrDetail()
	{
		return intrDetail;
	}

	public void setIntrDetail(String intrDetail)
	{
		this.intrDetail = intrDetail;
	}

	public String getGrade()
	{
		return grade;
	}

	public void setGrade(String grade)
	{
		this.grade = grade;
	}

	public String getRecentWalk()
	{
		return recentWalk;
	}

	public void setRecentWalk(String recentWalk)
	{
		this.recentWalk = recentWalk;
	}

	public String getDayCd()
	{
		return dayCd;
	}

	public void setDayCd(String dayCd)
	{
		this.dayCd = dayCd;
	}

	public String getDay()
	{
		return day;
	}

	public void setDay(String day)
	{
		this.day = day;
	}

	public int getFavStart()
	{
		return favStart;
	}

	public void setFavStart(int favStart)
	{
		this.favStart = favStart;
	}

	public int getFavEnd()
	{
		return favEnd;
	}

	public void setFavEnd(int favEnd)
	{
		this.favEnd = favEnd;
	}

	public String getJobCd()
	{
		return jobCd;
	}

	public void setJobCd(String jobCd)
	{
		this.jobCd = jobCd;
	}

	public String getJob()
	{
		return job;
	}

	public void setJob(String job)
	{
		this.job = job;
	}

	public String getNurtureExp()
	{
		return nurtureExp;
	}

	public void setNurtureExp(String nurtureExp)
	{
		this.nurtureExp = nurtureExp;
	}

	public String getCareerName()
	{
		return careerName;
	}

	public void setCareerName(String careerName)
	{
		this.careerName = careerName;
	}

	public int getAge()
	{
		return age;
	}

	public void setAge(int age)
	{
		this.age = age;
	}

	public int getFdbCount()
	{
		return fdbCount;
	}

	public void setFdbCount(int fdbCount)
	{
		this.fdbCount = fdbCount;
	}

	public int getPoint()
	{
		return point;
	}

	public void setPoint(int point)
	{
		this.point = point;
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

	public double getRate()
	{
		return rate;
	}

	public void setRate(double rate)
	{
		this.rate = rate;
	}

	public String getQuestion1()
	{
		return question1;
	}

	public void setQuestion1(String question1)
	{
		this.question1 = question1;
	}

	public String getQuestion2()
	{
		return question2;
	}

	public void setQuestion2(String question2)
	{
		this.question2 = question2;
	}

	public String getCrtCd()
	{
		return crtCd;
	}

	public void setCrtCd(String crtCd)
	{
		this.crtCd = crtCd;
	}

	public String getCrtItem()
	{
		return crtItem;
	}

	public void setCrtItem(String crtItem)
	{
		this.crtItem = crtItem;
	}

	public String getPointItemCd()
	{
		return pointItemCd;
	}

	public void setPointItemCd(String pointItemCd)
	{
		this.pointItemCd = pointItemCd;
	}

	public String getPointItem()
	{
		return pointItem;
	}

	public void setPointItem(String pointItem)
	{
		this.pointItem = pointItem;
	}

	public int getScore()
	{
		return score;
	}

	public void setScore(int score)
	{
		this.score = score;
	}

	public String getBeforePwd()
	{
		return beforePwd;
	}

	public void setBeforePwd(String beforePwd)
	{
		this.beforePwd = beforePwd;
	}

	public String getWokApplyCd()
	{
		return wokApplyCd;
	}

	public void setWokApplyCd(String wokApplyCd)
	{
		this.wokApplyCd = wokApplyCd;
	}

	
	
	
	
	
}