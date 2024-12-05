package com.third.severance.controller;

import com.third.severance.dto.QnaVO;
import com.third.severance.service.QnaService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;

@Controller
public class QnaController {

    @Autowired
    QnaService qs;

    @GetMapping("/qnaList")
    public ModelAndView qnaList(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        HashMap<String , Object> result = qs.getQnaList( request );
        mav.addObject("qnaList", result.get("qnaList") );
        mav.addObject("paging", result.get("paging") );
        mav.setViewName("qna/qnaList");
        return mav;
    }


    @GetMapping("/qnaView")
    public ModelAndView qnaView(@RequestParam("qseq") int qseq) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("qnaVO",  qs.getQna(qseq) );
        mav.setViewName("qna/qnaView");
        return mav;
    }

    @GetMapping("/writeQnaForm")
    public String writeQnaForm() {
        return "qna/writeQna";
    }


    @PostMapping("/writeQna")
    public ModelAndView writeQna(
            @RequestParam("userid") String userid,
            @RequestParam("subject") String subject,
            @RequestParam("content") String content
    ) {
        ModelAndView mav = new ModelAndView();

        // 입력값 검증
        if (userid == null || userid.trim().isEmpty()) {
            mav.addObject("errorMessage1", "작성자명을 입력하세요.");
            mav.addObject("userid", userid); // 입력값 유지
            mav.addObject("subject", subject);
            mav.addObject("content", content);
            mav.setViewName("qna/writeQna");
        } else if (subject == null || subject.trim().isEmpty()) {
            mav.addObject("errorMessage2", "제목을 입력하세요.");
            mav.addObject("userid", userid);
            mav.addObject("subject", subject); // 입력값 유지
            mav.addObject("content", content);
            mav.setViewName("qna/writeQna");
        } else if (content == null || content.trim().isEmpty()) {
            mav.addObject("errorMessage3", "질문 내용을 입력하세요.");
            mav.addObject("userid", userid);
            mav.addObject("subject", subject);
            mav.addObject("content", content); // 입력값 유지
            mav.setViewName("qna/writeQna");
        } else {
            // 데이터 저장
            QnaVO qvo = new QnaVO();
            qvo.setUserid(userid);
            qvo.setSubject(subject);
            qvo.setContent(content);
            qs.insertQna(qvo);

            // 성공 시 목록 페이지로 리다이렉트
            mav.setViewName("redirect:/qnaList");
        }
        return mav;
    }



}