package com.third.severance.controller;


import com.third.severance.dto.DoctorVO;

import com.third.severance.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class DoctorController {

    @Autowired
    DoctorService ds = new DoctorService();

    @GetMapping("/")
    public String index() {


        return "index";

    }





    @GetMapping("/doctorsection")
    public ModelAndView category(@RequestParam("doctorsection") int doctorsection ) {
        ModelAndView mav = new ModelAndView();

        List<DoctorVO> dvo = ds.selectSection( doctorsection );

        mav.addObject("doctorsection", doctorsection );


        System.out.println("dvo 입력 전 "+dvo);

        mav.addObject("dvo", dvo );

        System.out.println("dvo 입력 후 "+dvo);

        mav.setViewName("doctor/sectionDoctor");
        return mav;
    }




    @GetMapping("/doctorDetail")
    public ModelAndView doctorDetail(@RequestParam("dseq") int dseq ) {
        ModelAndView mav = new ModelAndView();

       // List<DoctorVO> dvo = ds.doctorDetail( dseq );

       // String content = dvo.getContent();
       // content = content.replaceAll("(?<=\\.)\\s*(?!<br>)", ".<br>").replaceAll("\\.\\.<br>", ".<br>");
       // content = content.replaceAll("(?<=\\.<br>)", "<br>"); // 문장 뒤에 한 줄 띄우기
       // content = content.replaceAll("(^|<br>)([^<]+)", "$1<span style='font-size: 12px;'>●</span> $2");  // 각 문장 앞에 작은 ● 추가

        // dvo 객체에 처리된 content 값을 다시 설정
       // dvo.setContent(content);

       // mav.addObject("dvo", dvo );
       // mav.setViewName("doctor/doctorDetail");
       return mav;
    }




}
