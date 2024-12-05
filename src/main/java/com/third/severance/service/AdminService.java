package com.third.severance.service;

import com.third.severance.dao.IAdminDao;
import com.third.severance.dto.AdminVO;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class AdminService {
    @Autowired
    IAdminDao adao;

    public AdminVO getAdmin(String adminid) {

        return adao.getAdmin( adminid );
    }


}
