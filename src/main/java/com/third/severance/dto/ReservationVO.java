package com.third.severance.dto;

import lombok.Data;

import java.time.LocalDate;

@Data
public class ReservationVO {

    private int rseq;
    private int dseq;
    private int mseq;
    private String userid;
    private String membername;
    private String phone;
    private String doctorname;
    private String doctorsection;
   private LocalDate bookdate;
   private int time;
   private LocalDate indate;
   private int result;

}
