package com.third.severance.service;

import com.third.severance.dao.IQnaDao;
import com.third.severance.dto.Paging;
import com.third.severance.dto.QnaVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class QnaService {

    @Autowired
    IQnaDao qdao;

    public HashMap<String, Object> getQnaList(HttpServletRequest request) {
        HashMap<String, Object> result = new HashMap<>();
        HttpSession session = request.getSession();
        if( request.getParameter("first") != null ) {
            session.removeAttribute("page");
            session.removeAttribute("key");
        }
        int page = 1;
        if( request.getParameter("page") != null ) {
            page = Integer.parseInt(request.getParameter("page"));
            session.setAttribute("page", page);
        }else if( session.getAttribute("page") != null ) {
            page = Integer.parseInt( String.valueOf(session.getAttribute("page")) );
        }

        Paging paging = new Paging();
        paging.setPage(page);
        paging.setDisplayPage(10);
        paging.setDisplayRow(10);
        int count = qdao.getAllCount();
        paging.setTotalCount(count);
        paging.calPaging();
        List<QnaVO> list = qdao.getQnaList( paging );
        result.put("qnaList", list);
        result.put("paging", paging);
        return result;
    }

    public QnaVO getQna(int qseq) {
        return qdao.getQna( qseq );
    }

    public void insertQna(QnaVO qvo) {
        qdao.insertQna(qvo);
    }
}
