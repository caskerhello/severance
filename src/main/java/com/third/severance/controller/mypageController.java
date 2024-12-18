package com.third.severance.controller;

import com.third.severance.dto.MemberVO;
import com.third.severance.dto.ReservationResultVO;
import com.third.severance.service.ReservationService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;

@Controller
public class mypageController {

    @Autowired
    ReservationService rs;

    @GetMapping("/mypage")
    public ModelAndView mypage(HttpSession session, HttpServletRequest request ) {
        ModelAndView mav = new ModelAndView();


        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

//        System.out.println("loginUser.getUserid()"+loginUser.getUserid() );
//        System.out.println("loginUser"+loginUser);



        if (loginUser == null)
            mav.setViewName("member/loginForm");
        else {

            HashMap<String, Object> result = rs.getReseveIng( request );
            List<ReservationResultVO> list = (List<ReservationResultVO>) result.get("reservationResultList");
            System.out.println(list.size());

            mav.addObject( "reservationResultList", list );
            mav.addObject( "paging", result.get("paging") );
            mav.addObject( "key", result.get("key") );


//            mav.addObject("reserveList", rs.reserveIng(loginUser.getUserid()));

            //        System.out.println(rs.reserveIng( loginUser.getUserid() ));

            mav.addObject("title", "예약 진행 내역");
            mav.setViewName("mypage/mypage");

        }

        return mav;
    }
}
