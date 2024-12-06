package com.third.severance.service;

import com.third.severance.dao.IReserveDao;
import com.third.severance.dto.MemberVO;
import com.third.severance.dto.ReserveVO;
import jakarta.validation.constraints.NotEmpty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReserveService {

    @Autowired
    IReserveDao rdao2;

    public void updateMember(MemberVO membervo) {
        rdao2.updateMember(membervo);
    }
    public void deleteMember(String userid) {
        rdao2.deleteMember(userid);
    }
}
