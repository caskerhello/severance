package com.third.severance.dao;

import com.third.severance.dto.MemberVO;
import com.third.severance.dto.ReservationResultVO;
import com.third.severance.dto.ReservationVO;
import org.apache.ibatis.annotations.Mapper;

import java.time.LocalDate;
import java.util.List;

@Mapper
public interface IReservationDao {

    List<ReservationVO> getBookedTimes(int dseq);

    int insertReservation(int dseq, int mseq, LocalDate bookdate, int time);

    int lookupMaxOseq(int mseq);

    MemberVO getLoginMember(String userid);

    ReservationResultVO getReserveResult(int rseq);

    MemberVO getMember(String one);

//    List<ReservationResultVO> reserveIng(String userid);

    List<Integer> getRseqListIng(String userid);

    List<ReservationResultVO> reserveListByRseq(Integer rseq);

    void cancelreservation(int rseq);

    void updateMember(MemberVO membervo);

    void deleteMember(String userid);
}
