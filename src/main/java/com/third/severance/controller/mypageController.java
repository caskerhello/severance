package com.third.severance.controller;

import com.third.severance.dto.MemberVO;
import com.third.severance.service.ReservationService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class mypageController {

    @Autowired
    ReservationService rs;

@GetMapping("/mypage")
public ModelAndView mypage(HttpSession session ) {
    ModelAndView mav = new ModelAndView();

//억지로 id로 멤버 조회
MemberVO mvo = rs.getMember( "one" );

session.setAttribute("loginUser", mvo);

MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

    System.out.println(loginUser);
    System.out.println(loginUser.getUserid() );


//    if (loginUser == null)
//        mav.setViewName("member/login");
//    else {


        mav.addObject( "reserveList" , rs.reserveIng( loginUser.getUserid() ) );

//        System.out.println(rs.reserveIng( loginUser.getUserid() ));

        mav.addObject("title", "예약 진행 내역");
        mav.setViewName("mypage/mypage");

    return mav;
}





}
