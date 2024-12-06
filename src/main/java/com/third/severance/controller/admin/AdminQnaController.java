package com.third.severance.controller.admin;

import com.third.severance.dto.QnaVO;
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
public class AdminQnaController {
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

    @GetMapping("/adminQnaList")
    public ModelAndView adminQnaList(Model model, HttpServletRequest request)
    {
        System.out.println("adminQnaList");
        ModelAndView mav = new ModelAndView();

        System.out.println("key 첫 수신 : "+request.getParameter("key"));

        HashMap<String, Object> result = aqs.getAdminQnaList( request );
//        System.out.println(result);
        List<QnaVO> list = (List<QnaVO>) result.get("qnaList");
        System.out.println("list.size() (컨트롤러 내부) : "+list.size());
        System.out.println("list (컨트롤러 내부) : "+list);

//
//        System.out.println("result.get("doctorList"):"+result.get("doctorList"));


        mav.addObject( "qnaList", list );
        mav.addObject( "paging", result.get("paging") );
        mav.addObject( "key", result.get("key") );
        mav.setViewName("admin/adminQnaList");



        return mav;
    }
}
