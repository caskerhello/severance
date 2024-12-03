package com.third.severance.controller;


import com.third.severance.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DoctorController {

    @Autowired
    DoctorService ds = new DoctorService();

    @GetMapping("/")
    public String index() {

        return "index";

    }



    @GetMapping("/doctorsection")
    public ModelAndView category(@RequestParam("doctorsection") int doctorsection ) {
        ModelAndView mav = new ModelAndView();

        mav.addObject("doctorsection", ds.selectSection( doctorsection ) );
        mav.setViewName("doctor/sectionDoctor");
        return mav;
    }





}
