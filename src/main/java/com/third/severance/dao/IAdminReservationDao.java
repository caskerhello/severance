package com.third.severance.dao;

import com.third.severance.dto.DoctorVO;
import com.third.severance.dto.Paging;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IAdminReservationDao {
    List<DoctorVO> getReservationList(Paging paging, String key);
}
