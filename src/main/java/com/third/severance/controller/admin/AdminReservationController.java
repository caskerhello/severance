package com.third.severance.controller.admin;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.third.severance.dto.DoctorVO;
import com.third.severance.dto.Paging;
import com.third.severance.dto.ReservationResultVO;
import com.third.severance.dto.ReservationVO;
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
public class AdminReservationController {
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


    @GetMapping("/adminReservationList")
    public ModelAndView adminReservationList(Model model, HttpServletRequest request)
    {
        System.out.println("adminReservationList");
        ModelAndView mav = new ModelAndView();


        HashMap<String, Object> result = ars.getAdminReservationList( request );
//        System.out.println(result);
        List<ReservationResultVO> list = (List<ReservationResultVO>) result.get("reservationList");
//        System.out.println("list.size() : "+list.size());
//        System.out.println(list);

//
//        System.out.println("result.get("doctorList"):"+result.get("doctorList"));


        mav.addObject( "reservationList", list );
        mav.addObject( "paging", result.get("paging") );
        mav.addObject( "key", result.get("key") );





        mav.setViewName("admin/adminReservationList");


        return mav;

    }


    @GetMapping("/admincancelreservation")
    public ModelAndView reservation(@RequestParam("rseq") int rseq,
                              HttpServletRequest req){
        ModelAndView mav = new ModelAndView();

        System.out.println(rseq);

        ars.cancelreservation(rseq);

        mav.setViewName("admin/adminReservationList");


        return mav;

        }








    @PostMapping("/adminReservationListPaging")
    @ResponseBody
    public HashMap<String, Object> adminReservationListPaging(@RequestBody String filterJSON, HttpServletRequest request) {
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
            HashMap<String, Object> result = ars.getAdminReservationListPaging(page,request);

            List<ReservationResultVO> reservationList = (List<ReservationResultVO>) result.get("reservationList");
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
            responseData.put("reservationList2", reservationList);
            System.out.println(reservationList);

            responseData.put("paging2", paging);
            System.out.println(paging);


            System.out.println("responseData:"+responseData);
            // HashMap을 JSONObject로 변환하여 반환
//            response = new JSONObject(responseData);



        } catch (Exception e) {
            e.printStackTrace();
            response.put("error", "JSON 파싱 오류 발생");
        }

        return responseData;
    }




    @PostMapping("/adminSetReservationResultUp")
    @ResponseBody
    public HashMap<String, Object> adminSetReservationResultUP(@RequestParam("rseq") int rseq)
    {   HashMap<String, Object> result = new HashMap<>();
//        System.out.println("adminSetReservationResultUp 호출");
        ars.adminSetReservationResultUp(rseq);
//        System.out.println("adminSetReservationResultUp 완료");
        int reservationResult = ars.adminSetReservationResult(rseq);
        System.out.println("adminSetReservationResult"+reservationResult);
        result.put("reservationResult",reservationResult);

        return result;
    }

    @PostMapping("/adminSetReservationResultDown")
    @ResponseBody
    public HashMap<String, Object> adminSetReservationResultDown(@RequestParam("rseq") int rseq, HttpServletRequest request)
    {HashMap<String, Object> result = new HashMap<>();
        ars.adminSetReservationResultDown(rseq);

        int reservationResult = ars.adminSetReservationResult(rseq);
        System.out.println("adminSetReservationResult"+reservationResult);
        result.put("reservationResult",reservationResult);

        return result;
    }







}
