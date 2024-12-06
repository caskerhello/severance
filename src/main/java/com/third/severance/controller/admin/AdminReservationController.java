package com.third.severance.controller.admin;

import com.third.severance.dto.ReservationResultVO;
import com.third.severance.dto.ReservationVO;
import com.third.severance.service.admin.*;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;

@Controller
public class AdminReservationController {
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


    @GetMapping("/adminReservationList")
    public ModelAndView adminReservationList(Model model, HttpServletRequest request)
    {
        System.out.println("adminReservationList");
        ModelAndView mav = new ModelAndView();


        HashMap<String, Object> result = ars.getAdminReservationList( request );
//        System.out.println(result);
        List<ReservationResultVO> list = (List<ReservationResultVO>) result.get("reservationList");
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


    @GetMapping("/admincancelreservation")
    public ModelAndView reservation(@RequestParam("rseq") int rseq,
                              HttpServletRequest req){
        ModelAndView mav = new ModelAndView();

        System.out.println(rseq);

        ars.cancelreservation(rseq);

        mav.setViewName("admin/adminReservationList");


        return mav;

        }
}
