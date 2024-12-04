package com.third.severance.service;


import com.third.severance.dao.IDoctorTimeDao;
import com.third.severance.dao.IReservationDao;
import com.third.severance.dto.*;

import org.json.JSONArray;
import org.json.JSONObject;

//import net.minidev.json.JSONArray;
//import net.minidev.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Service
public class ReservationService {

    @Autowired
    private IDoctorTimeDao dtdao;

    @Autowired
    private IReservationDao rdao;

    public ReservationResponse getDoctorTimeDetails(int dseq) {
        ReservationResponse response = new ReservationResponse();
        System.out.println("serv1, dseq: " + dseq);










        // DAO 호출로 데이터 가져오기
        List<ReservationVO> dtvoList =rdao.getBookedTimes(dseq);

        System.out.println(dtvoList);

        // 이번 달과 다음 달 데이터를 담을 리스트
        List<ReservationVO> thisMonthList = new ArrayList<>();
        List<ReservationVO> nextMonthList = new ArrayList<>();

        // 현재 날짜를 기준으로 이번 달과 다음 달 판별
        LocalDate today = LocalDate.now();
        int currentMonth = today.getMonthValue();
        int currentYear = today.getYear();

        // 다음 달 계산
        LocalDate firstDayOfNextMonth = today.plusMonths(1).withDayOfMonth(1);

        // 데이터 분류
        for (ReservationVO dto : dtvoList) {
            LocalDate bookDate = dto.getBookdate(); // DTO의 날짜 가져오기

            if (bookDate.getYear() == currentYear && bookDate.getMonthValue() == currentMonth) {
                thisMonthList.add(dto); // 이번 달
            } else if (bookDate.equals(firstDayOfNextMonth) ||
                    (bookDate.isAfter(firstDayOfNextMonth) &&
                            bookDate.getMonthValue() == firstDayOfNextMonth.getMonthValue())) {
                nextMonthList.add(dto); // 다음 달
            }




//        // 예약 가능 여부를 기준으로 JSON 데이터 생성
//        JSONArray thisMonthResData = convertToJSONObject(thisMonthList);
//        JSONArray nextMonthResData = convertToJSONObject(nextMonthList);


            convertToJSONObject(thisMonthList,nextMonthList);
            JSONArray thisMonthArray = convertToJSONObject(thisMonthList,nextMonthList).getJSONArray("thisMonth");
            JSONArray nextMonthArray = convertToJSONObject(thisMonthList,nextMonthList).getJSONArray("nextMonth");

            // 결과 데이터 설정
            response.setThisMonthResData(thisMonthArray);
            response.setNextMonthResData(nextMonthArray);


        }
        return response;
    }

    public JSONObject convertDoctorTimeToJSON(ReservationVO dto) {
    JSONObject jsonObj = new JSONObject();
    jsonObj.put("dseq", dto.getDseq());
    jsonObj.put("name", dto.getDoctorname());
    jsonObj.put("time", dto.getTime());
    jsonObj.put("bookdate", dto.getBookdate());  // LocalDate를 String으로 변환




    // 필요한 다른 필드도 추가
    return jsonObj;
}
    public JSONObject convertToJSONObject(List<ReservationVO> thisMonthList, List<ReservationVO> nextMonthList) {
        // 결과를 담을 JSONObject
        JSONObject result = new JSONObject();

        // 이번 달 리스트를 JSON 배열로 변환
        JSONArray thisMonthArray = new JSONArray();
        for (ReservationVO dto : thisMonthList) {
            thisMonthArray.put(convertDoctorTimeToJSON(dto));
        }

        // 다음 달 리스트를 JSON 배열로 변환
        JSONArray nextMonthArray = new JSONArray();
        for (ReservationVO dto : nextMonthList) {
            nextMonthArray.put(convertDoctorTimeToJSON(dto));
        }

        // JSONObject에 배열 추가
        result.put("thisMonth", thisMonthArray);
        result.put("nextMonth", nextMonthArray);

        return result;
    }


    public int insertReservation(int dseq, int mseq, LocalDate bookdate, int time) {
        return rdao.insertReservation(dseq,mseq,bookdate,time);
    }

    public int lookupMaxOseq(int mseq) {
        return rdao.lookupMaxOseq(mseq);
    }



    public MemberVO getLoginMember(int mseq) {
        //DAO 호출로 로그인 유저 데이터 가져오기
         return rdao.getLoginMember(mseq);
    }

    public ReservationResultVO getReserveResult(int rseq) {
        return rdao.getReserveResult(rseq);
    }

    public MemberVO getMember(String one) { return rdao.getMember(one);
    }

    public List<ReservationResultVO> reserveIng(String userid) {

        ArrayList<ReservationResultVO> reserveList = new ArrayList<ReservationResultVO>();


        // 아이디로 주문 번호(oseq)들을 조회
        List<Integer> rseqList = rdao.getRseqListIng( userid );
        System.out.println( rseqList.size() );

        // 조회된 주문번호별로  최종 리스트 구성
        for( Integer rseq : rseqList){
            List<ReservationResultVO> list = rdao.reserveListByRseq( rseq );

            ReservationResultVO temp = list.get(0);
//            temp.setPname( temp.getPname() + " 포함 " + list.size() + "건" );
//            int totalPrice = 0;
//
//            int cnt = 0;

//            for( OrderVO ovo : list) {
//                totalPrice += ovo.getPrice2() * ovo.getQuantity();
//                if( ovo.getResult() == 4 ) cnt++;
//            }
//            if( list.size() == cnt ) temp.setResult(4);
//            else temp.setResult(1);

//            temp.setPrice2(totalPrice);

            reserveList.add(temp);
        }
        return reserveList;
    }

    public void cancelreservation(int rseq) {
    rdao.cancelreservation(rseq);}
}

