package com.third.severance.controller;

import com.third.severance.dto.AdminVO;
import com.third.severance.dto.DoctorVO;
import com.third.severance.dto.ReservationVO;
import com.third.severance.service.AdminDoctorService;
import com.third.severance.service.AdminReservationService;
import com.third.severance.service.AdminService;
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
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;

@Controller
public class AdminController1 {

    @Autowired
    AdminService as;

    @Autowired
    AdminDoctorService ads;

    @Autowired
    AdminReservationService ars;

    @GetMapping("/admin")
    public String admin(Model model) {

        return "admin/adminLogin";
    }





    @PostMapping("/adminLogin")
    public String adminLogin(@ModelAttribute("dto") @Valid AdminVO adminvo, BindingResult result, Model model, HttpSession session) {
        String url = "admin/adminLogin";


        System.out.println(adminvo);

        if (result.getFieldError("adminid") != null)
            model.addAttribute("message", "아이디를 입력하세요");
        else if (result.getFieldError("pwd") != null)
            model.addAttribute("message", "패스워드를 입력하세요");
        else {

            AdminVO avo = as.getAdmin(adminvo.getAdminid());

            System.out.println(avo);

            if ((avo == null) || (!adminvo.getPwd().equals(avo.getPwd())))
                model.addAttribute("message", "아이디 패스워드를 확인하세요");
            else {
                session.setAttribute("adminUser", avo);
                url = "admin/adminBoard";
            }
        }
        return url;
    }


    @GetMapping("/adminDoctorList")
    public ModelAndView adminDoctorList(Model model, HttpServletRequest request)
    {


        ModelAndView mav = new ModelAndView();

        HashMap<String, Object> result = ads.getAdminDoctorList( request );
        System.out.println(result);
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

    @GetMapping("/adminReservationList")
    public ModelAndView adminReservationList(Model model, HttpServletRequest request)
    {
        System.out.println("adminReservationList");
        ModelAndView mav = new ModelAndView();


        HashMap<String, Object> result = ars.getAdminReservationList( request );
        System.out.println(result);
        List<ReservationVO> list = (List<ReservationVO>) result.get("reservationList");
//        System.out.println("list.size() : "+list.size());
//        System.out.println(list);

//
//        System.out.println("result.get("doctorList"):"+result.get("doctorList"));


        mav.addObject( "reservationList", list );
        mav.addObject( "paging", result.get("paging") );
        mav.addObject( "key", result.get("key") );





        mav.setViewName("admin/adminReservationList");


        return mav;
    }

//    @GetMapping("/adminReservationList")
//    public String adminReservationList(Model model)
//    {
//        System.out.println("adminReservationList");
//        return "admin/adminReservationList";
//    }

//    @GetMapping("/adminMemberList")
//    public String adminMemberList(Model model)
//    {
//        System.out.println("adminMemberList");
//        return "admin/adminMemberList";
//    }
//
//    @GetMapping("/adminQnaList")
//    public String adminQnaList(Model model)
//    {
//        System.out.println("adminQnaList");
//        return "admin/adminQnaList";
//    }

}
