package com.third.severance.controller.admin;


import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.third.severance.dto.DoctorVO;
import com.third.severance.dto.Paging;
import com.third.severance.dto.ReservationVO;
import com.third.severance.service.admin.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

@Controller
public class AdminDoctorController {
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


    @GetMapping("/adminDoctorList")
    public ModelAndView adminDoctorList(Model model, HttpServletRequest request)
    {
        ModelAndView mav = new ModelAndView();

        System.out.println("key 첫 수신 : "+request.getParameter("key"));

        HashMap<String, Object> result = ads.getAdminDoctorList( request );
//        System.out.println(result);
        List<DoctorVO> list = (List<DoctorVO>) result.get("doctorList");
//        System.out.println("list.size() : "+list.size());
//        System.out.println(list);

//
//        System.out.println("result.get("doctorList"):"+result.get("doctorList"));


        mav.addObject( "doctorList", list );
        mav.addObject( "paging", result.get("paging") );
        mav.addObject( "key", result.get("key") );
        mav.setViewName("admin/adminDoctorList");


//        System.out.println(result.get("paging"));

        JSONArray jasonlist = convertListToJsonArray(list);

        JSONObject jasonresult =  convertPagingToJSON((Paging) result.get("paging"));

//        System.out.println("jasonlist:"+jasonlist);
//        System.out.println("jasonresult:"+jasonresult);


        request.setAttribute("jasonlist", jasonlist);
        request.setAttribute( "paging2", jasonresult );

        return mav;
    }


    @PostMapping("/adminDoctorListPaging")
    @ResponseBody
    public HashMap<String, Object> adminDoctorListPaging(@RequestBody String filterJSON, HttpServletRequest request) {
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
            HashMap<String, Object> result = ads.getAdminDoctorListPaging(page,request);

            List<DoctorVO> doctorList = (List<DoctorVO>) result.get("doctorList");
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
            responseData.put("doctorList2", doctorList);
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


//    @PostMapping("/adminDoctorListPaging2")
//    @ResponseBody
//    public String select_snb03_ajax(
//            @RequestBody String filterJSON,
//            HttpServletResponse response,
//            ModelMap model ) throws Exception {
//
//        JSONObject obj = new JSONObject();
//        response.setContentType("text/html; charset=UTF-8");
//        PrintWriter out = response.getWriter();
//
//        try{
//            ObjectMapper mapper = new ObjectMapper();
//            DoctorVO searchVO = (DoctorVO)mapper.readValue(filterJSON, new TypeReference<DoctorVO>(){ });
//
////            searchVO.setSite_code(loginService.getSiteCode());
//
//            /* 페이징 시작 */
//            Paging paginationInfo = new Paging();
//            paginationInfo.setCurrentPageNo(searchVO.getPageIndex());        //현재 페이지 번호
//            paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());    //한 페이지에 게시되는 게시물 건수
//            paginationInfo.setPageSize(searchVO.getPageSize());                //페이징 리스트의 사이즈
//
//            searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
//            searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
//
//
//
//            HashMap<String, Object> map = ads.getAearDoctorList(searchVO);
//            int totCnt = Integer.parseInt((String)map.get("resultCnt"));
//
//            paginationInfo.setTotalRecordCount(totCnt);
//
//            searchVO.setEndDate(paginationInfo.getLastPageNoOnPageList());
//            searchVO.setStartDate(paginationInfo.getFirstPageNoOnPageList());
//            searchVO.setPrev(paginationInfo.getXprev());
//            searchVO.setNext(paginationInfo.getXnext());
//            searchVO.setRealEnd(paginationInfo.getRealEnd());
//
//            /* 페이징 끝 */
//
//            obj.put("resultList", map.get("resultList"));
//            obj.put("resultCnt", map.get("resultCnt"));
//            obj.put("totalPageCnt", (int)Math.ceil(totCnt / (double)searchVO.getPageUnit()));
//            obj.put("searchVO", searchVO);
//
//        }catch(Exception e){
//            System.out.println(e.toString());
//            obj.put("res", "error");
//
//        }
//
//        out.print(obj);
//        return null;
//
//    }












    // DTO 리스트를 받아서 JsonArray로 변환하는 메서드
    public JSONArray convertListToJsonArray(List<DoctorVO> list) {
        JSONArray JSONArray = new JSONArray();  // JsonArray 객체 생성
        Gson gson = new Gson();  // Gson 객체 생성

        // memberList의 각 DTO 객체를 순회
        for (DoctorVO lists : list) {
            JSONObject jsonObject = new JSONObject();  // JsonObject 객체 생성

            // DTO 객체의 데이터를 JsonObject에 담기
            jsonObject.put("dseq", lists.getDseq());
            jsonObject.put("name", lists.getName());
            jsonObject.put("doctorsection", lists.getDoctorsection());
            jsonObject.put("daylimit", lists.getDaylimit());
            jsonObject.put("content", lists.getContent());
            jsonObject.put("image", lists.getImage());
            jsonObject.put("savefilename", lists.getSavefilename());
            jsonObject.put("bachd", lists.getBachd());
            jsonObject.put("mastd", lists.getMastd());
            jsonObject.put("doctd", lists.getDoctd());
            jsonObject.put("resume", lists.getResume());
            jsonObject.put("univlogo", lists.getUnivlogo());


            // JsonObject를 JsonArray에 추가
            JSONArray.put(jsonObject);
        }

        return JSONArray;  // JsonArray 반환
    }





    public JSONObject convertDoctorVOToJSON(Paging paging) {
        JSONObject jsonObj = new JSONObject();


        jsonObj.put("page", paging.getPage());
        jsonObj.put("totalCount", paging.getTotalCount());
        jsonObj.put("displayRow", paging.getDisplayRow());
        jsonObj.put("displayPage", paging.getDisplayPage());
        jsonObj.put("beginPage", paging.getBeginPage());
        jsonObj.put("endPage", paging.getEndPage());
        jsonObj.put("prev", paging.isPrev());
        jsonObj.put("next", paging.isNext());
        jsonObj.put("startNum", paging.getStartNum());
        jsonObj.put("endNum", paging.getEndNum());

        // Return the JSON object with all the fields
        return jsonObj;

    }




    public JSONObject convertPagingToJSON(Paging paging) {
        JSONObject jsonObj = new JSONObject();


        jsonObj.put("page", paging.getPage());
        jsonObj.put("totalCount", paging.getTotalCount());
        jsonObj.put("displayRow", paging.getDisplayRow());
        jsonObj.put("displayPage", paging.getDisplayPage());
        jsonObj.put("beginPage", paging.getBeginPage());
        jsonObj.put("endPage", paging.getEndPage());
        jsonObj.put("prev", paging.isPrev());
        jsonObj.put("next", paging.isNext());
        jsonObj.put("startNum", paging.getStartNum());
        jsonObj.put("endNum", paging.getEndNum());

        // Return the JSON object with all the fields
        return jsonObj;

    }





}
