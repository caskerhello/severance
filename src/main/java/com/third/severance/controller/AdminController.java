package com.third.severance.controller;

import com.third.severance.dto.AdminVO;
import com.third.severance.service.AdminService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AdminController {

    @Autowired
    AdminService as;

    @GetMapping("/admin")
    public String admin(Model model) {

        return "admin/adminLogin";
    }

    @GetMapping("/doctorList")
    public String doctorList(Model model) {
        return "doctor/doctorList";
    }

    @GetMapping("/reservationList")
    public String reservationList(Model model) {
        return "reservation/reservationList";
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

}
