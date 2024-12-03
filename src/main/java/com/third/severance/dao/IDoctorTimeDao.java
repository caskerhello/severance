package com.third.severance.dao;

import com.third.severance.dto.Doctor_TimeVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IDoctorTimeDao {

    List<Doctor_TimeVO> getDoctorTimes(int dseq);
}
