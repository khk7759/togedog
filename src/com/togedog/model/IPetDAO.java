package com.togedog.model;

import java.sql.SQLException;
import java.util.List;

import com.togedog.vo.PetDTO;
import com.togedog.vo.VacDTO;

public interface IPetDAO
{
	public String petAdd(PetDTO dto) throws SQLException; 		// 강아지 등록 
	public List<VacDTO> getVacList() throws SQLException;		// 예방접종 리스트
	public List<PetDTO> getDogItemList() throws SQLException;	// 견종리스트
	public void insertVac(PetDTO dto) throws SQLException;		// 예방접종 등록
	public void insertDisable(PetDTO dto) throws SQLException;	// 장애 등록
	public void insertAllerge(PetDTO dto) throws SQLException;	// 알러지 등록
	
	
}
