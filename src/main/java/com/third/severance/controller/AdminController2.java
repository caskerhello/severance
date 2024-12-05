package com.third.severance.controller;

import com.third.severance.service.AdminService2;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;

@Controller
public class AdminController2 {

    @Autowired
    AdminService2 as2;

    @GetMapping("/adminMemberList")
    public ModelAndView adminMemberList(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        HashMap<String, Object> result = as2.adminMemberList(request);
        mav.addObject("memberList", result.get("memberList"));
        mav.addObject("paging", result.get("paging"));
        mav.addObject("key", result.get("key"));
        System.out.println("adminMemberList");
        return mav;
        // return "admin/adminMemberList";
    }
}
