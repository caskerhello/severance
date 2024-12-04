package com.third.severance.dto;

import lombok.Data;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Data
public class ReserveVO {
    private int rseq;
    private String userid;
    private int dseq;
    private String doctorname;
    private Date bookdate;
    private int time;
    private int doctorsection;
    private String membername;
    private String phone;
    private String email;
    private String address;
    private int result;

}
