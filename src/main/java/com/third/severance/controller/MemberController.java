package com.third.severance.controller;

import com.google.gson.Gson;
import com.third.severance.dao.IMemberDao;
import com.third.severance.dto.KakaoProfile;
import com.third.severance.dto.MemberVO;
import com.third.severance.dto.OAuthToken;
import com.third.severance.service.MemberService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
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

    @GetMapping("/loginForm")
    public String loginForm() {
        return "member/loginForm";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute("dto") @Valid MemberVO membervo, BindingResult result,
                        HttpServletRequest request, Model model) {
        String url = "member/loginForm";
        if (result.getFieldError("userid") != null)
            model.addAttribute("message", "아이디를 입력하세요");
        else if (result.getFieldError("pwd") != null)
            model.addAttribute("message", "패스워드를 입력하세요");
        else {
            MemberVO mvo = ms.getMember(membervo.getUserid());
            if (mvo == null)
                model.addAttribute("message", "아이디 비밀번호를 확인하세요. ");
            else if (!mvo.getPwd().equals(membervo.getPwd()))
                model.addAttribute("message", "아이디 비밀번호를 확인하세요. ");
            else if (mvo.getPwd().equals(membervo.getPwd())) {
                HttpSession session = request.getSession();
                session.setAttribute("loginUser", mvo);
                url = "redirect:/";
            }
        }
        return url;
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("loginUser");
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
                                @RequestParam(value = "marketingConsent", required = false) boolean marketingConsent) {
        if (termsService && privacyPolicy) {
            return "redirect:/joinForm"; // 리다이렉트
        } else {
            return "member/contract"; // 약관 동의 페이지로 돌아감
        }
    }

    @GetMapping("/joinForm")
    public String joinForm(Model model) {
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

        // 결과 페이지 반환
        return "member/search_id_page";
    }

}
