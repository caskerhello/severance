package com.third.severance.controller;


import com.third.severance.dto.*;
import com.third.severance.service.DoctorService;
import com.third.severance.service.ReservationService;
import jakarta.servlet.http.HttpServletRequest;

//import net.minidev.json.JSONArray;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.json.JSONArray;
//import org.json.JSONObject;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDate;
import java.util.List;

@Controller
public class ReservationController {

    @Autowired
    DoctorService ds;


    @Autowired
    private ReservationService rs;




    @GetMapping("/beforereservation")
    public ModelAndView beforereservation(ModelAndView mv, HttpServletRequest request) {


        int doctorsection=1;

        ModelAndView mav = new ModelAndView();

        List<DoctorVO> dvo = ds.selectSection( doctorsection );


        mav.addObject("doctorList", dvo );

        mav.setViewName("reservation/beforereservation");
        return mav;



    }




    @GetMapping("/beforedoctorsection")
    public ModelAndView beforedoctorsection(@RequestParam("doctorsection") int doctorsection ){



        ModelAndView mav = new ModelAndView();

        List<DoctorVO> dvo = ds.selectSection( doctorsection );

//        mav.addObject("doctorsection", doctorsection );


        System.out.println("dvo 입력 전 "+dvo);

        mav.addObject("doctorList", dvo );

        System.out.println("dvo 입력 후 "+dvo);



        mav.setViewName("reservation/beforereservation");
        return mav;

    };


    @GetMapping("/reservationform")
    public ModelAndView reservationform(
            @RequestParam int dseq,
            HttpServletRequest req,
            HttpSession session) {


        ModelAndView mav = new ModelAndView();

        System.out.println("cont1, dseq: " + dseq);


        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        if( loginUser == null )
            mav.setViewName("member/loginForm");
        else{



//            System.out.println(loginUser);
//            System.out.println(loginUser.getUserid() );



            //멤버정보가져오기
            MemberVO mvo = rs.getLoginMember(loginUser.getUserid() );

//            System.out.println(loginUser);
//            System.out.println(loginUser.getUserid() );
//
//            System.out.println(mvo);

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
            req.setAttribute("dseq",dvo.getDseq());
            req.setAttribute("mseq",mvo.getMseq());
            req.setAttribute("thisMonthResData", thisMonthResData);
            req.setAttribute("nextMonthResData", nextMonthResData);

            // view 이름 반환 (viewResolver가 "reservation/reservationform.jsp"로 자동 변환)

            mav.setViewName("reservation/reservationform");
//            return "reservation/reservationform";

        }
        return mav;




    }

    @PostMapping("/reservation")
    public ModelAndView reservation(
            @ModelAttribute("dto") @Valid ReservationVO rvo, BindingResult result,

            Model model,


            @RequestParam("dseq") int dseq,
            @RequestParam("mseq") int mseq,
//                              @RequestParam("selectedDate") LocalDate bookdate,
//                              @RequestParam("selectedTime2") int time,
                              HttpServletRequest req,HttpSession session)
    {
        ModelAndView mav = new ModelAndView();



        String url = "reservation/reservationform";

        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        MemberVO mvo = rs.getLoginMember(loginUser.getUserid() );

//            System.out.println(loginUser);
//            System.out.println(loginUser.getUserid() );
//
//            System.out.println(mvo);

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
        req.setAttribute("dseq",dvo.getDseq());
        req.setAttribute("mseq",mvo.getMseq());
        req.setAttribute("thisMonthResData", thisMonthResData);
        req.setAttribute("nextMonthResData", nextMonthResData);


        if( result.getFieldError("bookdate") != null)
            mav.addObject("validmsg", result.getFieldError("bookdate").getDefaultMessage());

        else if( result.getFieldError("time") != null)
            mav.addObject("validmsg", result.getFieldError("time").getDefaultMessage());


        else {

            url = "reservation/reservationresult";
//            model.addAttribute("message", "회원가입이 완료되었습니다. 로그인하세요");

            rs.insertReservation2(rvo);


            int rseq = rs.lookupMaxOseq(mseq);

            System.out.println(rseq);
            System.out.println(" 입력 데이터 출력 성공");

            ReservationResultVO rrvo = rs.getReserveResult(rseq);

            System.out.println(rrvo);


            mav.addObject("rrvo", rrvo);
        }

        mav.setViewName(url);
        return mav;





    }



    @GetMapping("/cancelreservation")
    public String reservation(@RequestParam("rseq") int rseq,
                                                                HttpServletRequest req){

    rs.cancelreservation(rseq);

    return "redirect:/mypage";}

}
