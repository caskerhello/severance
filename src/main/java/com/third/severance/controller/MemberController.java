package com.third.severance.controller;

import com.google.gson.Gson;
import com.third.severance.dao.IMemberDao;
import com.third.severance.dto.KakaoProfile;
import com.third.severance.dto.MemberVO;
import com.third.severance.dto.OAuthToken;
import com.third.severance.service.MemberService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.net.ssl.HttpsURLConnection;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.UUID;

@Controller
public class MemberController {

    @Autowired
    MemberService ms;

    
//    // 자동로그인 시작
//    @GetMapping("/")
//    public String index(HttpServletRequest request, HttpSession session) {
//        // 쿠키에서 loginUser 정보를 가져옴
//        Cookie[] cookies = request.getCookies();
//        if (cookies != null) {
//            for (Cookie cookie : cookies) {
//                System.out.println("쿠키 이름: " + cookie.getName() + ", 쿠키 값: " + cookie.getValue()); // 쿠키 디버깅 로그
//                if ("loginUser".equals(cookie.getName())) {
//                    String userid = cookie.getValue();
//                    System.out.println("로그인 사용자 ID: " + userid); // 쿠키에서 읽은 사용자 ID 로그
//                    MemberVO mvo = ms.getMember(userid); // 사용자 정보 조회
//                    if (mvo != null) {
//                        session.setAttribute("loginUser", mvo); // 세션에 사용자 정보 저장
//                        System.out.println("세션에 사용자 정보 저장 완료: " + mvo); // 세션 저장 로그
//                    } else {
//                        System.out.println("해당 ID로 사용자를 찾을 수 없습니다: " + userid); // 사용자 조회 실패 로그
//                    }
//                }
//            }
//        } else {
//            System.out.println("쿠키가 존재하지 않습니다."); // 쿠키가 없는 경우 로그
//        }
//        return "index"; // 메인 페이지로 리다이렉트
//    }
//
//    // 자동로그인 끝

    @GetMapping("/loginForm")
    public String loginForm() {
        return "member/loginForm";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute("dto") @Valid MemberVO membervo, BindingResult result,
                        HttpServletRequest request, HttpServletResponse response, Model model) {
        String url = "member/loginForm";
        if (result.getFieldError("userid") != null) {
            model.addAttribute("message", "아이디를 입력하세요");
        } else if (result.getFieldError("pwd") != null) {
            model.addAttribute("message", "패스워드를 입력하세요");
        } else {
            MemberVO mvo = ms.getMember(membervo.getUserid());
            if (mvo == null) {
                model.addAttribute("message", "아이디 또는 비밀번호를 확인하세요.");
            } else if (!mvo.getPwd().equals(membervo.getPwd())) {
                model.addAttribute("message", "아이디 또는 비밀번호를 확인하세요.");
            } else if (mvo.getPwd().equals(membervo.getPwd())) {
                HttpSession session = request.getSession();
                session.setAttribute("loginUser", mvo);
                // 자동로그인 시작
                // 자동 로그인 체크 시 쿠키 생성
                if ("on".equals(request.getParameter("rememberMe"))) {
                    // 쿠키 생성: 아이디를 쿠키에 저장
                    Cookie userCookie = new Cookie("loginUser", mvo.getUserid());
                    userCookie.setMaxAge(60 * 60 * 24 * 7); // 7일 동안 쿠키 유지
                    userCookie.setPath("/"); // 모든 경로에서 접근 가능하도록 설정
                    response.addCookie(userCookie);
                }
                // 자동로그인 끝
                url = "redirect:/";
            }
        }
        return url;
    }


    @GetMapping("/logout")
    public String logout(HttpSession session, HttpServletResponse response) {
        session.removeAttribute("loginUser");

        // 쿠키 삭제
        Cookie loginCookie = new Cookie("loginUser", null);
        loginCookie.setMaxAge(0);  // 만료 시간을 0으로 설정하여 쿠키 삭제
        loginCookie.setPath("/");   // 쿠키의 경로를 설정
        response.addCookie(loginCookie);

        return "redirect:/";
    }

    @GetMapping("/kakaoLogin")
    public String login(HttpServletRequest request) throws IOException {
        String code = request.getParameter("code");

        String endpoint = "https://kauth.kakao.com/oauth/token";
        URL url = new URL(endpoint);
        String bodyData = "grant_type=authorization_code";
        bodyData += "&client_id=7f54d0fdaa5df081339a616842e2b48e";
        bodyData += "&redirect_uri=http://localhost:8070/kakaoLogin";
        bodyData += "&code=" + code;

        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
        conn.setDoOutput(true);

        BufferedWriter bw = new BufferedWriter(
                new OutputStreamWriter(conn.getOutputStream(), "UTF-8")
        );
        bw.write(bodyData);
        bw.flush();
        BufferedReader br = new BufferedReader(
                new InputStreamReader(conn.getInputStream(), "UTF-8")
        );

        String input = "";
        StringBuilder sb = new StringBuilder();
        while ((input = br.readLine()) != null) {
            sb.append(input);
            System.out.println(input);
        }

        Gson gson = new Gson();
        OAuthToken oAuthToken = gson.fromJson(sb.toString(), OAuthToken.class);

        endpoint = "https://kapi.kakao.com/v2/user/me";
        url = new URL(endpoint);
        conn = (HttpsURLConnection) url.openConnection();

        conn.setRequestProperty("Authorization", "Bearer " + oAuthToken.getAccess_token());
        conn.setDoOutput(true);

        br = new BufferedReader(
                new InputStreamReader(conn.getInputStream(), "UTF-8")
        );
        input = "";
        sb = new StringBuilder();
        while ((input = br.readLine()) != null) {
            sb.append(input);
            System.out.println(input);
        }

        gson = new Gson();
        com.third.severance.dto.KakaoProfile kakaoProfile = gson.fromJson(sb.toString(), KakaoProfile.class);

        System.out.println(kakaoProfile.getId());
        com.third.severance.dto.KakaoProfile.KakaoAccount ac = kakaoProfile.getAccount();
        com.third.severance.dto.KakaoProfile.KakaoAccount.Profile pf = ac.getProfile();
        System.out.println(pf.getNickname());

        MemberVO mvo = ms.getMember(kakaoProfile.getId());
        if (mvo == null) {
            mvo = new MemberVO();
            mvo.setUserid(kakaoProfile.getId());
            mvo.setEmail(pf.getNickname());
            mvo.setName(pf.getNickname());

            ms.insertMember(mvo);
        }
        HttpSession session = request.getSession();
        session.setAttribute("loginUser", mvo);
        return "redirect:/";
    }

    @GetMapping("/contract")
    public String contract(Model model) {
        return "member/contract";
    }

    @PostMapping("/contractAgree")
    public String contractAgree(@RequestParam(value = "termsService", required = true) boolean termsService,
                                @RequestParam(value = "privacyPolicy", required = true) boolean privacyPolicy,
                                @RequestParam(value = "marketingConsent", required = false) boolean marketingConsent,
                                HttpSession session) {
        if (termsService && privacyPolicy) {
            session.setAttribute("agreedToTerms", true);
            return "redirect:/joinForm"; // 리다이렉트
        } else {
            return "member/contract"; // 약관 동의 페이지로 돌아감
        }
    }

    @GetMapping("/joinForm")
    public String joinForm(HttpSession session, Model model) {
        // 세션에 'agreedToTerms' 속성이 없으면, 즉 약관 동의를 하지 않았으면
        if (session.getAttribute("agreedToTerms") == null || !(boolean) session.getAttribute("agreedToTerms")) {
            return "redirect:/contract"; // 약관 동의 페이지로 리다이렉트
        }
        return "member/joinForm";
    }

    @PostMapping("/idcheck")
    @ResponseBody
    public HashMap<String, Object> idcheck(@RequestParam("userid") String userid) {
        System.out.println(userid);
        MemberVO mvo = ms.getMember(userid);
        System.out.println(mvo);

        HashMap<String, Object> result = new HashMap<>();
        if (mvo == null) {
            result.put("idmessage", 1);
            result.put("userid", userid);
        } else {
            result.put("idmessage", -1);
        }
        return result;
    }

    @PostMapping("/join")
    public String join(@ModelAttribute("dto") @Valid MemberVO membervo, BindingResult result, Model model, @RequestParam(value = "reid", required = false) String reid, @RequestParam(value = "pwdCheck", required = false) String pwdCheck) {
        String url = "member/joinForm";
        model.addAttribute("reid", reid);
        if (result.getFieldError("userid") != null)
            model.addAttribute("validmsg", "아이디를 입력하세요");
        else if (result.getFieldError("pwd") != null)
            model.addAttribute("validmsg", "패스워드를 입력하세요");
        else if (result.getFieldError("name") != null)
            model.addAttribute("validmsg", "이름을 입력하세요");
        else if (result.getFieldError("email") != null)
            model.addAttribute("validmsg", "이메일을 입력하세요");
        else if (result.getFieldError("phone") != null)
            model.addAttribute("validmsg", "전화번호를 입력하세요");
        else if (!membervo.getUserid().equals(reid))
            model.addAttribute("validmsg", "아이디 중복검사를 실행하세요");
        else if (!membervo.getPwd().equals(pwdCheck))
            model.addAttribute("validmsg", "비밀번호 확인이 일치하지 않습니다");
        else {
            url = "member/loginForm";
            model.addAttribute("message", "회원가입이 완료되었습니다. 로그인하세요");
            ms.insertMember(membervo);
        }
        return url;
    }

    // -------------------------------------------------------------------------------

    @Autowired
    private MemberService memberService;

    @GetMapping("/search_id")
    public String search_id(Model model) {
        return "member/search_id";
    }

    @PostMapping("/search_id_page")
    public String search_id_page(@ModelAttribute("dto") MemberVO searchVO, Model model) {
        try {
            // Service 호출
            MemberVO memberSearch = memberService.memberIdSearch(searchVO);

            // 결과를 모델에 추가
            if (memberSearch != null) {
                model.addAttribute("MemberVO", memberSearch);
                System.out.println("MemberVO: " + memberSearch);

            } else {
                model.addAttribute("msg", "일치하는 회원 정보를 찾을 수 없습니다.");
            }
        } catch (Exception e) {
            // 예외 처리
            e.printStackTrace();
            model.addAttribute("msg", "오류가 발생되었습니다.");
        }

         // 결과 페이지  반환
        return "member/search_id_page";
    }

    @Autowired
    private JavaMailSender mailSender; // JavaMailSender 이메일 전송 기능을 제공하는 인터페이스

    @GetMapping("/search_pwd")
    public String search_pwd(Model model) {
        return "member/search_pwd";
    }

    @PostMapping("/search_pwd_page")
    public String search_pwd_page(@RequestParam String email, @RequestParam String name, Model model) {
        // 사용자 존재 확인 및 임시 비밀번호 처리
        System.out.println("Email: " + email + ", Name: " + name);
        System.out.println("User exists: " + ms.isUserExist(email, name));

        if (ms.isUserExist(email, name)) {
            String tempPassword = ms.generateTempPassword();
            System.out.println("Temporary password: " + tempPassword);
            ms.updatePassword(email, tempPassword, name);
            sendEmail(email, tempPassword);
            model.addAttribute("successMessage", "임시 비밀번호가 발급되었습니다. 이메일을 확인하세요."); // 성공 시 안내팝업
            return "member/search_pwd_success"; // 메인 페이지로 리다이렉트
        } else {
            model.addAttribute("error", "이메일 또는 이름을 확인해주세요");
            return "member/search_pwd"; // 오류 시 다시 비밀번호 찾기 페이지로
        }
    }
    @GetMapping("/search_pwd_success")
    public String search_pwd_success() {
        return "member/search_pwd_success";
    }

    @GetMapping("/search_pwd_page")
    public String handleGetRequest(Model model) {
        model.addAttribute("error", "잘못된 접근입니다. 비밀번호 찾기를 다시 시도해주세요.");
        return "member/search_pwd";
    }

//   하단 코드 메일 발송 양식
    private void sendEmail(String email, String tempPassword) {
        try {
            if (mailSender == null) {
                System.out.println("JavaMailSender is null");
                throw new RuntimeException("JavaMailSender not initialized");
            }
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(email);
            message.setSubject("임시 비밀번호 발급 안내");
            message.setText("귀하의 임시 비밀번호는 " + tempPassword + " 입니다.");
            mailSender.send(message);
            System.out.println("Email sent to " + email);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("이메일 전송에 실패했습니다.");
        }
    }

}
