package com.third.severance.dao.admin;

import com.third.severance.dto.DoctorVO;
import com.third.severance.dto.Paging;
import com.third.severance.dto.ReservationResultVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IAdminReservationDao {
    List<ReservationResultVO> getReservationList(Paging paging, String key);

    void adminSetReservationResultUp(int rseq);

    void adminSetReservationResultDown(int rseq);

    int adminSetReservationResult(int rseq);
}
