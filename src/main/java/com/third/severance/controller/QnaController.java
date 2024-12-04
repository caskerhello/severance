package com.third.severance.controller;

import com.third.severance.dto.QnaVO;
import com.third.severance.service.QnaService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
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
            QnaVO qvo = new QnaVO();
            qvo.setUserid(userid);
            qvo.setSubject(subject);
            qvo.setContent(content);
            qs.insertQna(qvo);
            mav.setViewName("redirect:/qnaList");

        return mav;
    }
}