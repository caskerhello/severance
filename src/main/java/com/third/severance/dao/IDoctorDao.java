package com.third.severance.dao;


import com.third.severance.dto.DoctorVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IDoctorDao {
    



    List<DoctorVO> selectSection(int doctorsection);

    DoctorVO getDoctor(int dseq);


}
