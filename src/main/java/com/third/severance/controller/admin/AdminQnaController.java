package com.third.severance.controller.admin;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.third.severance.dto.DoctorVO;
import com.third.severance.dto.Paging;
import com.third.severance.dto.QnaVO;
import com.third.severance.service.admin.*;
import jakarta.servlet.http.HttpServletRequest;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;

@Controller
public class AdminQnaController {
    @Autowired
    AdminService as;

    @Autowired
    AdminDoctorService ads;

    @Autowired
    AdminReservationService ars;

    @Autowired
    AdminMemberService ams;

    @Autowired
    AdminQnaService aqs;

    @GetMapping("/adminQnaList")
    public ModelAndView adminQnaList(Model model, HttpServletRequest request)
    {
        System.out.println("adminQnaList");
        ModelAndView mav = new ModelAndView();

//        System.out.println("key 첫 수신 : "+request.getParameter("key"));

        HashMap<String, Object> result = aqs.getAdminQnaList( request );
//        System.out.println(result);
        List<QnaVO> list = (List<QnaVO>) result.get("qnaList");
//        System.out.println("list.size() (컨트롤러 내부) : "+list.size());
//        System.out.println("list (컨트롤러 내부) : "+list);

//
//        System.out.println("result.get("doctorList"):"+result.get("doctorList"));


        mav.addObject( "qnaList", list );
        mav.addObject( "paging", result.get("paging") );
        mav.addObject( "key", result.get("key") );
        mav.setViewName("admin/adminQnaList");



        return mav;
    }


    @PostMapping("/adminQnaListPaging")
    @ResponseBody
    public HashMap<String, Object> adminQnaListPaging(@RequestBody String filterJSON, HttpServletRequest request) {
        JSONObject response = new JSONObject();
        HashMap<String, Object> responseData = new HashMap<>();

        try {
            // JSON 파싱
            ObjectMapper mapper = new ObjectMapper();
            JsonNode rootNode = mapper.readTree(filterJSON);  // filterJSON을 JsonNode로 파싱

            // 필드 추출 (예: pageIndex)
            int page = rootNode.path("page").asInt();  // 예시: "pageIndex" 값
            String searchWrd = rootNode.path("searchWrd").asText();  // 예시: "searchWrd" 값

            // 파라미터 설정
            request.setAttribute("page", page);
            System.out.println("page:"+page);
//            request.setAttribute("searchWrd", searchWrd);

            // 페이징 처리
            HashMap<String, Object> result = aqs.getAdminQnaListPaging(page,request);

            List<QnaVO> List = (List<QnaVO>) result.get("qnaList");
            Paging paging = (Paging) result.get("paging");

            // JSON 변환
//            JSONArray doctorListJson = convertListToJsonArray(doctorList);
//            JSONObject pagingJson = convertPagingToJSON(paging);

            // JSON 응답 객체 생성
//            response.put("doctorList2", doctorListJson);
//            System.out.println("doctorList2 Paging:"+doctorListJson);

//            response.put("paging2", pagingJson);
//            System.out.println("paging2 Paging:"+pagingJson);

//            HashMap<String, Object> responseData = new HashMap<>();
            responseData.put("qnaList2", List);
            responseData.put("paging2", paging);


            System.out.println("responseData:"+responseData);
            // HashMap을 JSONObject로 변환하여 반환
//            response = new JSONObject(responseData);



        } catch (Exception e) {
            e.printStackTrace();
            response.put("error", "JSON 파싱 오류 발생");
        }

        return responseData;
    }




    @PostMapping("adminQnaDetail")
    @ResponseBody
    public HashMap<String, Object> adminQnaDetail(@RequestParam("qseq") int qseq, HttpServletRequest request) {
        System.out.println("adminQnaDetail");
        System.out.println(qseq);


        JSONObject response = new JSONObject();
        HashMap<String, Object> responseData = new HashMap<>();

        try {
//            // JSON 파싱
//            ObjectMapper mapper = new ObjectMapper();
//            JsonNode rootNode = mapper.readTree(filterJSON);  // filterJSON을 JsonNode로 파싱
//
//            // 필드 추출 (예: pageIndex)
//            int page = rootNode.path("page").asInt();  // 예시: "pageIndex" 값
//            String searchWrd = rootNode.path("searchWrd").asText();  // 예시: "searchWrd" 값
//
//            // 파라미터 설정
//            request.setAttribute("page", page);
//            System.out.println("page:"+page);
////            request.setAttribute("searchWrd", searchWrd);

            // 페이징 처리
            HashMap<String, Object> result = aqs.getAdminQnaDetail(qseq);

            QnaVO qvo = (QnaVO) result.get("qvo");
//            Paging paging = (Paging) result.get("paging");

            // JSON 변환
//            JSONArray doctorListJson = convertListToJsonArray(doctorList);
//            JSONObject pagingJson = convertPagingToJSON(paging);

            // JSON 응답 객체 생성
//            response.put("doctorList2", doctorListJson);
//            System.out.println("doctorList2 Paging:"+doctorListJson);

//            response.put("paging2", pagingJson);
//            System.out.println("paging2 Paging:"+pagingJson);

//            HashMap<String, Object> responseData = new HashMap<>();
            responseData.put("qvo", qvo);
//            responseData.put("paging2", paging);


            System.out.println("responseData:"+responseData);
            // HashMap을 JSONObject로 변환하여 반환
//            response = new JSONObject(responseData);



        } catch (Exception e) {
            e.printStackTrace();
            response.put("error", "JSON 파싱 오류 발생");
        }

        return responseData;
    }



    @PostMapping("/adminQnaReplyUpdate")
    @ResponseBody
    public HashMap<String, Object> adminQnaReplyUpdate(@RequestParam("qseq") int qseq, @RequestParam("reply") String reply, HttpServletRequest request) {
        System.out.println("adminQnaReplyUpdate");

        aqs.adminQnaReplyUpdate( qseq, reply );


        JSONObject response = new JSONObject();
        HashMap<String, Object> responseData = new HashMap<>();

        try {
//            // JSON 파싱
//            ObjectMapper mapper = new ObjectMapper();
//            JsonNode rootNode = mapper.readTree(filterJSON);  // filterJSON을 JsonNode로 파싱
//
//            // 필드 추출 (예: pageIndex)
//            int page = rootNode.path("page").asInt();  // 예시: "pageIndex" 값
//            String searchWrd = rootNode.path("searchWrd").asText();  // 예시: "searchWrd" 값
//
//            // 파라미터 설정
//            request.setAttribute("page", page);
//            System.out.println("page:"+page);
////            request.setAttribute("searchWrd", searchWrd);

            // 페이징 처리
            HashMap<String, Object> result = aqs.getAdminQnaDetail(qseq);

            QnaVO qvo = (QnaVO) result.get("qvo");
//            Paging paging = (Paging) result.get("paging");

            // JSON 변환
//            JSONArray doctorListJson = convertListToJsonArray(doctorList);
//            JSONObject pagingJson = convertPagingToJSON(paging);

            // JSON 응답 객체 생성
//            response.put("doctorList2", doctorListJson);
//            System.out.println("doctorList2 Paging:"+doctorListJson);

//            response.put("paging2", pagingJson);
//            System.out.println("paging2 Paging:"+pagingJson);

//            HashMap<String, Object> responseData = new HashMap<>();
            responseData.put("qvo", qvo);
//            responseData.put("paging2", paging);


            System.out.println("responseData:"+responseData);
            // HashMap을 JSONObject로 변환하여 반환
//            response = new JSONObject(responseData);



        } catch (Exception e) {
            e.printStackTrace();
            response.put("error", "JSON 파싱 오류 발생");
        }

        return responseData;



    }







}
