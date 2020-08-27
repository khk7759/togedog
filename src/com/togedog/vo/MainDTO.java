package com.togedog.vo;

public class MainDTO
{
	// 산책한 펫 수, 대행한 펫 수, 견주 수, 펫 수, 워커 수, 그룹 수
	private int walkPetCount, agcPetCount, ownCount, petCount, wokCount, groupCount;

	public int getWalkPetCount()
	{
		return walkPetCount;
	}

	public void setWalkPetCount(int walkPetCount)
	{
		this.walkPetCount = walkPetCount;
	}

	public int getAgcPetCount()
	{
		return agcPetCount;
	}

	public void setAgcPetCount(int agcPetCount)
	{
		this.agcPetCount = agcPetCount;
	}

	public int getOwnCount()
	{
		return ownCount;
	}

	public void setOwnCount(int ownCount)
	{
		this.ownCount = ownCount;
	}

	public int getPetCount()
	{
		return petCount;
	}

	public void setPetCount(int petCount)
	{
		this.petCount = petCount;
	}

	public int getWokCount()
	{
		return wokCount;
	}

	public void setWokCount(int wokCount)
	{
		this.wokCount = wokCount;
	}

	public int getGroupCount()
	{
		return groupCount;
	}

	public void setGroupCount(int groupCount)
	{
		this.groupCount = groupCount;
	}
}
