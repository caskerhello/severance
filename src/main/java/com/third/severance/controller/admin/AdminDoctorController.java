package com.third.severance.controller.admin;

import com.third.severance.dto.DoctorVO;
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
public class AdminDoctorController {
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


    @GetMapping("/adminDoctorList")
    public ModelAndView adminDoctorList(Model model, HttpServletRequest request)
    {
        ModelAndView mav = new ModelAndView();

        System.out.println("key 첫 수신 : "+request.getParameter("key"));

        HashMap<String, Object> result = ads.getAdminDoctorList( request );
//        System.out.println(result);
        List<DoctorVO> list = (List<DoctorVO>) result.get("doctorList");
//        System.out.println("list.size() : "+list.size());
//        System.out.println(list);

//
//        System.out.println("result.get("doctorList"):"+result.get("doctorList"));


        mav.addObject( "doctorList", list );
        mav.addObject( "paging", result.get("paging") );
        mav.addObject( "key", result.get("key") );
        mav.setViewName("admin/adminDoctorList");



        return mav;
    }
}
