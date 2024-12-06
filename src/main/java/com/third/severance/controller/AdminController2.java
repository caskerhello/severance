package com.third.severance.controller;

import com.third.severance.dao.IMemberDao;
import com.third.severance.dto.MemberVO;
import com.third.severance.service.AdminMemberService;
import com.third.severance.service.AdminService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;

@Controller
public class AdminController2 {

    @Autowired
    AdminMemberService adms;

    @Autowired
    AdminMemberService ams;

    @Autowired
    IMemberDao imd;

    @GetMapping("/adminMemberList")
    public ModelAndView adminMemberList(HttpServletRequest request ) {
        ModelAndView mav = new ModelAndView();
        HashMap<String, Object> result = adms.adminMemberList( request );
        mav.addObject("memberList", result.get("memberList"));
        mav.addObject("paging", result.get("paging"));
        mav.addObject("key", result.get("key"));
        mav.setViewName( "admin/member/memberList" );
        return mav;
    }

}