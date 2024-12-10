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

//    @GetMapping("/")
//    public ModelAndView index() {
//
//        int doctorsection=1;
//
//        ModelAndView mav = new ModelAndView();
//
//        List<DoctorVO> dvo = ds.selectSection( doctorsection );
//
////        mav.addObject("doctorsection", doctorsection );
//
//
//        System.out.println("dvo 입력 전 "+dvo);
//
//        mav.addObject("doctorList", dvo );
//
//        System.out.println("dvo 입력 후 "+dvo);
//
//
//
//        mav.setViewName("index");
//        return mav;
//
//    }

    @GetMapping("/doctorsection")
    public ModelAndView doctorsection(@RequestParam("doctorsection") int doctorsection ){



        ModelAndView mav = new ModelAndView();

        List<DoctorVO> dvo = ds.selectSection( doctorsection );

//        mav.addObject("doctorsection", doctorsection );


        System.out.println("dvo 입력 전 "+dvo);

        mav.addObject("doctorList", dvo );

        System.out.println("dvo 입력 후 "+dvo);



        mav.setViewName("index");
        return mav;

    };











    @GetMapping("/doctorDetail")
    public ModelAndView doctorDetail(@RequestParam("dseq") int dseq ) {
        ModelAndView mav = new ModelAndView();

        DoctorVO dvo = ds.getDoctor( dseq );

//        List<DoctorVO> dvos = ds.getDoctor( dseq );





//        for( DoctorVO dvo : dvos ){
//            String resume = dvo.getResume();  // 각 dvo 객체에서 resume 값 가져오기
//            resume = resume.replaceAll("(?<=\\.)\\s*(?!<br>)", ".<br>").replaceAll("\\.\\.<br>", ".<br>");
//            resume = resume.replaceAll("(?<=\\.<br>)", "<br>");  // 문장 뒤에 한 줄 띄우기
//            resume = resume.replaceAll("(^|<br>)([^<]+)", "$1<span style='font-size: 12px;'>●</span> $2");  // 각 문장 앞에 작은 ● 추가
//
//            dvo.setResume(resume);
//        }






        String resume = dvo.getResume();
        resume = resume.replaceAll("(?<=\\.)\\s*(?!<br>)", ".<br>").replaceAll("\\.\\.<br>", ".<br>");
        resume = resume.replaceAll("(?<=\\.<br>)", "<br>"); // 문장 뒤에 한 줄 띄우기
        resume = resume.replaceAll("(^|<br>)([^<]+)", "$1 $2");  // 각 문장 앞에 작은 ● 추가

         //dvo 객체에 처리된 content 값을 다시 설정
        dvo.setResume(resume);

        mav.addObject("dvo", dvo );
        mav.setViewName("doctor/doctorDetail");
       return mav;
    }




}
