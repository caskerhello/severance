package com.third.severance.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class Dto_Reservation_rental {
    private Timestamp CheckInDate;
    private int startTime;
    private int endTime;
    private int usingTime;
    private int month;
    private int date;

}
