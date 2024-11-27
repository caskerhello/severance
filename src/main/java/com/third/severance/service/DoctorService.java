package com.third.severance.service;

import com.third.severance.dao.IDoctorDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DoctorService {

    @Autowired
    IDoctorDao ddao;
}
