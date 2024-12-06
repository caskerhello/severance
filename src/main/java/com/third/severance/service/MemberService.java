package com.third.severance.service;

import com.third.severance.dao.IMemberDao;
import com.third.severance.dto.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
    @Autowired
    IMemberDao mdao;

    public MemberVO memberIdSearch(MemberVO searchVO) {
        return mdao.memberIdSearch(searchVO);
    }

    // -------------------------------------------------------------------------------

    public MemberVO getMember(String userid) {
        return mdao.getMember(userid);
    }

    public void insertMember(MemberVO mvo) {
        mdao.insertMember(mvo);
    }
}
