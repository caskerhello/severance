package com.third.severance.controller;

import com.third.severance.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;

@Controller
public class DoctorController {

    @Autowired
    DoctorService ds = new DoctorService();

    @GetMapping("/")
    public ModelAndView index() {
        ModelAndView mav = new ModelAndView();

//        HashMap<String, Object> result = ds.selectNewBestList();
//        mav.addObject( "bestList", result.get("bestList") );

        mav.setViewName("index");
        return mav;

    }

}
