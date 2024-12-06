package com.third.severance.dao.admin;

import com.third.severance.dto.DoctorVO;
import com.third.severance.dto.Paging;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IAdminDoctorDao {
    List<DoctorVO> getAllDoctor();

    int getAllCount(String doctor, String name, String key);

    List<DoctorVO> getDoctorList(Paging paging, String key);
}
