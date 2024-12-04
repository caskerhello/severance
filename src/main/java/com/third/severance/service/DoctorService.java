package com.third.severance.service;

import com.third.severance.dao.IDoctorDao;
import com.third.severance.dto.DoctorVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DoctorService {

    @Autowired
    IDoctorDao ddao;

    public DoctorVO selectSection(int doctorsection) {
        return ddao.selectSection(doctorsection);
    }

    public DoctorVO doctorDetail(int dseq) {
        return ddao.doctorDetail(dseq);
    }


}
