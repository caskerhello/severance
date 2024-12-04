package com.third.severance.controller;


import com.third.severance.dto.*;
import com.third.severance.service.DoctorService;
import com.third.severance.service.ReservationService;
import jakarta.servlet.http.HttpServletRequest;

//import net.minidev.json.JSONArray;

import org.json.JSONArray;
//import org.json.JSONObject;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDate;

@Controller
public class ReservationController {

    @Autowired
    DoctorService ds;


    @Autowired
    private ReservationService rs;



    @GetMapping("/reservationform")
    public String reservationform(
            @RequestParam int dseq,
            HttpServletRequest req) {

        System.out.println("cont1, dseq: " + dseq);


        //        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
//        if( loginUser == null )
//            mav.setViewName("member/loginForm");
//        else{
//
//        }
//        return mav;


        int mseq =1;

        //멤버정보가져오기
        MemberVO mvo = rs.getLoginMember(mseq);
        
        // ReservationResponse를 통해 예약 정보 가져오기
        DoctorVO dvo = ds.getDoctor(dseq);
        ReservationResponse response = rs.getDoctorTimeDetails(dseq);


        // 새로운 JSONArray 생성
        JSONArray jsonArray = new JSONArray();

//        List<JSONObject> thisMonthResData = response.getThisMonthResData();
//        List<JSONObject> nextMonthResData = response.getNextMonthResData();

//        // List의 각 항목을 JSONArray에 추가
//        for (JSONObject item : thisMonthResData) {
//            jsonArray.put(item);
//        }
//
//        // List의 각 항목을 JSONArray에 추가
//        for (JSONObject item : nextMonthResData) {
//            jsonArray.put(item);
//        }
        // ReservationResponse에서 thisMonthResData와 nextMonthResData를 추출
        JSONArray thisMonthResData = response.getThisMonthResData();
        JSONArray nextMonthResData = response.getNextMonthResData();


        // request에 데이터 저장
        req.setAttribute("detail", dvo);
        req.setAttribute("mvo", mvo);
        req.setAttribute("dseq",1);
        req.setAttribute("thisMonthResData", thisMonthResData);
        req.setAttribute("nextMonthResData", nextMonthResData);

        // view 이름 반환 (viewResolver가 "reservation/reservationform.jsp"로 자동 변환)
        return "reservation/reservationform";
    }

//    @GetMapping("/doctor-times")
//    public ResponseEntity<ReservationResponse> getDoctorTimes(
//            @RequestParam int dseq,
//            @RequestParam LocalDate bookdate) {
//        ReservationResponse response = rs.getDoctorTimeDetails(dseq, bookdate);
//        return ResponseEntity.ok(response);
//    }


    @PostMapping("/reservation")
    public ModelAndView reservation(@RequestParam("dseq") int dseq,
                              @RequestParam("mseq") int mseq,
                              @RequestParam("selectedDate") LocalDate bookdate,
                              @RequestParam("selectedTime2") int time,
                              HttpServletRequest req)
    {
        ModelAndView mav = new ModelAndView();

        System.out.println("cont2, dseq: " + dseq);
        System.out.println("cont2, dseq: " + mseq);
        System.out.println("cont2, selectedDate: " + bookdate);
        System.out.println("cont2, selectedTime: " + time);

        rs.insertReservation(dseq, mseq, bookdate, time);
        System.out.println(" 데이터 입력 성공 ");




        int rseq = rs.lookupMaxOseq(mseq);

        System.out.println(rseq);
        System.out.println(" 입력 데이터 출력 성공");

        ReservationResultVO rrvo = rs.getReserveResult(rseq);
        

        mav.addObject("rrvo", rrvo);
        mav.setViewName("reservation/reservationresult");

        return mav;

    }



    @GetMapping("/cancelreservation")
    public String reservation(@RequestParam("rseq") int rseq,
                                                                HttpServletRequest req){

    rs.cancelreservation(rseq);

    return "redirect:/mypage";}

}
