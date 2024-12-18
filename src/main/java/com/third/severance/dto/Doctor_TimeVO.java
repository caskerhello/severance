package com.third.severance.dto;

import lombok.Data;

import java.time.LocalDate;

@Data
public class Doctor_TimeVO {

    private String name;
    private int dseq;
    private LocalDate bookdate;
    private int time;
    private int price;
    private String daylimit;
    private boolean bookable;


}
