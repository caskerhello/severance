package com.third.severance.service;

import com.third.severance.dao.IAdminDao;
import com.third.severance.dao.IAdminMemberDao;
import com.third.severance.dto.AdminVO;
import com.third.severance.dto.MemberVO;
import com.third.severance.dto.Paging;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class AdminMemberService {

    @Autowired
    IAdminMemberDao iadmao;

    public HashMap<String, Object> adminMemberList(HttpServletRequest request) {
        HashMap<String, Object> result = new HashMap<>();
        HttpSession session = request.getSession();
        if (request.getParameter("first") != null) {
            session.removeAttribute("page");
            session.removeAttribute("key");
        }
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
            session.setAttribute("page", page);
        } else if (session.getAttribute("page") != null) {
            page = Integer.parseInt((String) session.getAttribute("page"));
        }
        String key = "";
        if (request.getParameter("key") != null) {
            key = request.getParameter("key");
            session.setAttribute("key", key);
        } else if (session.getAttribute("key") != null) {
            key = (String) session.getAttribute("key");
        }
        Paging paging = new Paging();
        paging.setPage(page);
        paging.setDisplayPage(10);
        paging.setDisplayRow(10);
        int count = iadmao.getAllCount("member", "name", key);
        System.out.println(count);
        paging.setTotalCount(count);
        paging.calPaging();

        List<MemberVO> list = iadmao.getMemberList(paging, key);
        result.put("memberList", list);
        result.put("paging", paging);
        result.put("key", key);

        return result;
    }
}