package com.third.severance.service;

import com.third.severance.dao.IMemberDao;
import com.third.severance.dto.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class MemberService {
    @Autowired
    IMemberDao mdao;

    public boolean isUserExist(String email, String name) {
        boolean exists = mdao.isUserExist(email, name) > 0;
        System.out.println("Checking if user exists: " + exists); // 로그 추가
        return exists;
    }

    public String generateTempPassword() {
        return UUID.randomUUID().toString().substring(0, 8); // 8자리 임시 비밀번호 생성
    }

    public void updatePassword(String email, String tempPassword, String name) {
        System.out.println("Updating password for: Email=" + email + ", Name=" + name);
        mdao.updatePassword(email, tempPassword, name);
    }

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
