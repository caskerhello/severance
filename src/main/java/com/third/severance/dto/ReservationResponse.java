package com.third.severance.dto;

import lombok.Data;
import org.json.JSONArray;

@Data
public class ReservationResponse {

    private JSONArray thisMonthResData;
    private JSONArray nextMonthResData;
}
