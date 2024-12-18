package com.third.severance.dto;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
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

    @NotNull(message="날짜를 선택하세요")
   private LocalDate bookdate;

    @NotNull(message="시간대를 선택하세요")
   private Integer time;
   private LocalDate indate;
   private int result;

}
