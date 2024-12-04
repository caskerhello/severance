package com.third.severance.dto;

import lombok.Data;

import java.time.LocalDate;
import java.util.Date;

@Data
public class ReservationResultVO {

    private int rseq;
    private String userid;
    private String membername;
    private String phone;
    private String doctorname;
    private int doctorsection;
    private LocalDate bookdate;
    private int time;
    private int result;

}
