package com.third.severance.controller;

import com.third.severance.dto.MemberVO;
import com.third.severance.service.ReservationService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class mypageController2 {

    @Autowired
    ReservationService rs;


    @GetMapping("/updateMemberForm")
    public ModelAndView updateMemberForm(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        mav.addObject("dto", loginUser);
        mav.setViewName("mypage/updateMember");
        return mav;
    }

    @PostMapping("/updateMember")
    public String updateMember(@ModelAttribute("dto") @Valid MemberVO membervo, BindingResult result ,
                               @RequestParam(value="pwdCheck", required = false) String pwdCheck,
                               HttpSession session, Model model  ) {
        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        String url = "mypage/updateMember";
        if (result.getFieldError("pwd") != null)
            model.addAttribute("message", "패스워드를 입력하세요");
        else if (!membervo.getPwd().equals(pwdCheck))
            model.addAttribute("message", "패스워드 확인이 일치하지 않습니다");
        else if (result.getFieldError("name") != null)
            model.addAttribute("message", "이름을 입력하세요");
        else if (result.getFieldError("phone") != null)
            model.addAttribute("message", "전화번호를 입력하세요");
        else if (result.getFieldError("email") != null)
            model.addAttribute("message", "이메일을 입력하세요");
        else {
            rs.updateMember(membervo);
            session.setAttribute("loginUser", membervo);
            url = "redirect:/";
        }
        return url;
    }

    @GetMapping("/deleteMember")
    public String deleteMember(HttpSession session, Model model) {
        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        rs.deleteMember(loginUser.getUserid());
        model.addAttribute("message", "회원탈퇴가 정상적으로 처리되었습니다. ");
        return "redirect:/";
    }
}
