package com.third.severance.controller;

import com.third.severance.dto.DoctorVO;
import com.third.severance.dto.MemberVO;
import com.third.severance.service.DoctorService;
import com.third.severance.service.MemberService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private MemberService ms;
    @Autowired
    private DoctorService ds;

    @GetMapping("/")
    public ModelAndView index(HttpServletRequest request, HttpSession session) {
        ModelAndView mav = new ModelAndView();

    // 쿠키에서 loginUser 정보를 가져옴   ㅌ
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                System.out.println("쿠키 이름: " + cookie.getName() + ", 쿠키 값: " + cookie.getValue()); // 쿠키 디버깅 로그
                if ("loginUser".equals(cookie.getName())) {
                    String userid = cookie.getValue();
                    System.out.println("로그인 사용자 ID: " + userid); // 쿠키에서 읽은 사용자 ID 로그
                    MemberVO mvo = ms.getMember(userid); // 사용자 정보 조회
                    if (mvo != null) {
                        session.setAttribute("loginUser", mvo); // 세션에 사용자 정보 저장
                        System.out.println("세션에 사용자 정보 저장 완료: " + mvo); // 세션 저장 로그
                    } else {
                        System.out.println("해당 ID로 사용자를 찾을 수 없습니다: " + userid); // 사용자 조회 실패 로그
                    }
                }
            }
        } else {
            System.out.println("쿠키가 존재하지 않습니다."); // 쿠키가 없는 경우 로그
        }

        // 기존 DoctorController의 index 로직
        int doctorsection = 1;
        List<DoctorVO> dvo = ds.selectSection(doctorsection);
        System.out.println("dvo 입력 전 "+dvo);
        mav.addObject("doctorList", dvo);
        System.out.println("dvo 입력 후 "+dvo);
        mav.setViewName("index");
        return mav;
    }
}
