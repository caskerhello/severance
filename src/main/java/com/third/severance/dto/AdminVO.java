package com.third.severance.dto;

import jakarta.validation.constraints.NotEmpty;
import lombok.Data;

@Data
public class AdminVO {
    @NotEmpty
    private String adminid;
    @NotEmpty
    private String pwd;
}

