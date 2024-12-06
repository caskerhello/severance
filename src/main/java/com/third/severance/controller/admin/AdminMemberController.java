package com.third.severance.controller.admin;

import com.third.severance.dto.MemberVO;
import com.third.severance.service.admin.*;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;

@Controller
public class AdminMemberController {
    @Autowired
    AdminService as;

    @Autowired
    AdminDoctorService ads;

    @Autowired
    AdminReservationService ars;

    @Autowired
    AdminMemberService ams;

    @Autowired
    AdminQnaService aqs;

    @GetMapping("/adminMemberList")
    public ModelAndView adminMemberList(Model model, HttpServletRequest request)
    {
        System.out.println("adminMemberList");
        ModelAndView mav = new ModelAndView();

        System.out.println("key 첫 수신 : "+request.getParameter("key"));


        HashMap<String, Object> result = ams.getAdminMemberList( request );
//        System.out.println(result);
        List<MemberVO> list = (List<MemberVO>) result.get("memberList");
//        System.out.println("list.size() : "+list.size());
//        System.out.println(list);

//
//        System.out.println("result.get("doctorList"):"+result.get("doctorList"));


        mav.addObject( "memberList", list );
        mav.addObject( "paging", result.get("paging") );
        mav.addObject( "key", result.get("key") );
        mav.setViewName("admin/adminMemberList");



        return mav;
    }
}
