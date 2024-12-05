package com.third.severance.controller;

import com.third.severance.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController2 {

    @Autowired
    AdminService as;

    @GetMapping("/adminMemberList")
    public String adminMemberList(Model model) {
        System.out.println("adminMemberList");
        return "admin/adminMemberList";
    }
}