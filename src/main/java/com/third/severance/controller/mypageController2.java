package com.third.severance.controller;

import com.third.severance.dto.MemberVO;
import com.third.severance.service.ReservationService;
import com.third.severance.service.ReserveService;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class mypageController2 {

    @Autowired
    ReserveService rs2;

    @GetMapping("/updateMemberForm")
    public ModelAndView updateMemberForm(HttpSession session) {
        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            // 로그인 상태가 아니면 로그인 페이지로 리다이렉트
            return new ModelAndView("redirect:/loginForm");
        }
        ModelAndView mav = new ModelAndView();
        mav.addObject("dto", loginUser);
        mav.setViewName("mypage/updateMember");
        return mav;
    }

    @PostMapping("/updateMember")
    public String updateMember(@ModelAttribute("dto") @Valid MemberVO membervo, BindingResult result,
                               @RequestParam(value = "pwdCheck", required = false) String pwdCheck,
                               HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        // 세션에서 로그인한 사용자 정보 가져오기
        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        System.out.println(loginUser);

        // 기본 반환 URL
        String url = "mypage/updateMember";

        // 유효성 검사 및 에러 처리
        if (result.hasErrors()) {
            if (result.getFieldError("pwd") != null) {
                model.addAttribute("message", "패스워드를 입력하세요");
            } else if (result.getFieldError("phone") != null) {
                model.addAttribute("message", "전화번호를 입력하세요");
            } else if (result.getFieldError("email") != null) {
                model.addAttribute("message", "이메일을 입력하세요");
            }
        } else if (membervo.getPwd() == null || membervo.getPwd().isEmpty()) {
            model.addAttribute("message", "패스워드를 입력하세요");
        } else if (!membervo.getPwd().equals(pwdCheck)) {
            model.addAttribute("message", "패스워드 확인이 일치하지 않습니다");
        }
        else {
            // 모든 유효성 검사를 통과했을 경우
            rs2.updateMember(membervo); // 회원정보 업데이트

            int mseq = loginUser.getMseq();
            System.out.println(mseq);
            membervo.setMseq(mseq);
            System.out.println(membervo);

            session.setAttribute("loginUser", membervo); // 세션 정보 갱신
            System.out.println("Updated session user: " + session.getAttribute("loginUser"));

            url = "redirect:/"; // 성공 시 메인페이지(/) 리다이렉트
        }
        redirectAttributes.addFlashAttribute("message", "회원정보가 성공적으로 수정되었습니다.");
        return url; // 실패 시 수정 페이지 반환
    }


    @GetMapping("/deleteMember")
    public String deleteMember(HttpSession session, RedirectAttributes redirectAttributes) {
        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            // 로그인 상태가 아니면 로그인 페이지로 리다이렉트
            return "redirect:/loginForm";
        }
        // 회원탈퇴 로직 실행
        rs2.deleteMember(loginUser.getUserid());
        session.invalidate(); // 세션 완전히 무효화
        redirectAttributes.addFlashAttribute("message", "회원탈퇴가 정상적으로 처리되었습니다.");
        return "redirect:/";
    }
}
