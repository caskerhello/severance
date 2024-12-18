package com.third.severance.service.admin;

import com.third.severance.dao.IReservationDao;
import com.third.severance.dao.IReserveDao;
import com.third.severance.dao.admin.IAdminDoctorDao;
import com.third.severance.dao.admin.IAdminReservationDao;
import com.third.severance.dto.DoctorVO;
import com.third.severance.dto.Paging;
import com.third.severance.dto.ReservationResultVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class AdminReservationService {

    @Autowired
    IAdminDoctorDao addao;

    @Autowired
    IAdminReservationDao ardao;

    @Autowired
    IReservationDao rdao;

    public HashMap<String, Object> getAdminReservationList(HttpServletRequest request) {

        HttpSession session = request.getSession();

        int page=1;
        if( request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
            session.setAttribute("page", page);
        }else if( session.getAttribute("page") != null ) {
            page = (Integer)session.getAttribute("page");
        }else {
            session.removeAttribute("page");
        }
        String key = "";
        if( request.getParameter("key") != null ) {
            key = request.getParameter("key");
            session.setAttribute("key", key);
        } else if( session.getAttribute("key")!= null ) {
            key = (String)session.getAttribute("key");
        } else {
            session.removeAttribute("key");
        }

        Paging paging = new Paging();
        paging.setPage(page);
        int count = addao.getAllCount( "reserve", "bookdate", key);
        System.out.println("count : "+count);


        paging.setDisplayPage(10);
        paging.setDisplayRow(6);

        paging.setTotalCount(count);
        paging.calPaging();

        paging.setStartNum( paging.getStartNum());



        System.out.println("paging : " + paging);
        System.out.println("key : " + key);

        List<ReservationResultVO> list = ardao.getReservationList( paging, key );
        System.out.println("list : " + list);
        System.out.println("레코드 갯수 : " + list.size() );

        HashMap<String, Object> result = new HashMap<String, Object>();
        result.put("reservationList", list);

//        System.out.println("doctorList : " +list);

        result.put("paging", paging);
        result.put("key", key);

        return result;
    }

    public void cancelreservation(int rseq) {
        rdao.cancelreservation(rseq);
    }

    public HashMap<String, Object> getAdminReservationListPaging(int page, HttpServletRequest request) {

        HashMap<String, Object> result = new HashMap<>();
        HttpSession session = request.getSession();

        System.out.println("서비스내부 page :"+ page );


//        if( request.getParameter("first") != null ) {
//            session.removeAttribute("page");
//            session.removeAttribute("key");
//        }


//        if( request.getParameter("page") != null) {
//            page = Integer.parseInt(request.getParameter("page"));
//            session.setAttribute("page", page);
//        }else if( session.getAttribute("page") != null ) {
//
//            page = (Integer)session.getAttribute("page");
//        }else {
//            session.removeAttribute("page");
//        }

        String key = "";
        if( request.getParameter("key") != null ) {
            key = request.getParameter("key");
            session.setAttribute("key", key);
        } else if( session.getAttribute("key")!= null ) {
            key = (String)session.getAttribute("key");
        } else {
            session.removeAttribute("key");
        }

        Paging paging = new Paging();
        paging.setPage(page);
        paging.setDisplayPage(10);
        paging.setDisplayRow(6);

        int count = addao.getAllCount( "memberreservationhistory", "membername", key);
        System.out.println("count : "+count);

        paging.setTotalCount(count);
        paging.calPaging();
        paging.setStartNum( paging.getStartNum());



        System.out.println("paging : " + paging);
        System.out.println("key : " + key);

        List<ReservationResultVO> list = ardao.getReservationList( paging, key );
        System.out.println("list : " + list);
        System.out.println("레코드 갯수 : " + list.size() );


        result.put("reservationList", list);

//        System.out.println("doctorList : " +list);

        result.put("paging", paging);
        result.put("key", key);

        return result;
    }

    public void adminSetReservationResultUp(int rseq) {
        ardao.adminSetReservationResultUp(rseq);
    }

    public void adminSetReservationResultDown(int rseq) {
        ardao.adminSetReservationResultDown(rseq);
    }

    public int adminSetReservationResult(int rseq) {
        return ardao.adminSetReservationResult(rseq);
    }
}
