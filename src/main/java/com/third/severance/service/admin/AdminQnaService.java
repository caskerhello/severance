package com.third.severance.service.admin;

import com.third.severance.dao.admin.IAdminDoctorDao;
import com.third.severance.dao.admin.IAdminQnaDao;
import com.third.severance.dto.DoctorVO;
import com.third.severance.dto.Paging;
import com.third.severance.dto.QnaVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class AdminQnaService {

    @Autowired
    IAdminDoctorDao addao;

    @Autowired
    IAdminQnaDao aqdao;

    public HashMap<String, Object> getAdminQnaList(HttpServletRequest request) {

        HashMap<String, Object> result = new HashMap<>();
        HttpSession session = request.getSession();

        if( request.getParameter("first") != null ) {
            session.removeAttribute("page");
            session.removeAttribute("key");
        }




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
        paging.setDisplayPage(10);
        paging.setDisplayRow(5);

        int count = addao.getAllCount( "qna", "subject", key);
        System.out.println("count : "+count);

        paging.setTotalCount(count);
        paging.calPaging();
        paging.setStartNum( paging.getStartNum());



        System.out.println("paging : " + paging);
        System.out.println("key : " + key);

        List<QnaVO> list = aqdao.getQnaList( paging, key );
        System.out.println("list : " + list);
        System.out.println("레코드 갯수 : " + list.size() );


        result.put("qnaList", list);

//        System.out.println("doctorList : " +list);

        result.put("paging", paging);
        result.put("key", key);

        return result;

    }
}
