package com.third.severance.service.admin;

import com.third.severance.dao.admin.IAdminDao;
import com.third.severance.dto.AdminVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {
    @Autowired
    IAdminDao adao;

    public AdminVO getAdmin(String adminid) {

        return adao.getAdmin( adminid );
    }


}
