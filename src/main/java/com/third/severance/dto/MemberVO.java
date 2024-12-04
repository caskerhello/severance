package com.third.severance.dto;

import jakarta.validation.constraints.NotEmpty;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class MemberVO {
    @NotEmpty
    private String userid;
    @NotEmpty
    private String pwd;
    @NotEmpty
    private String name;
    @NotEmpty
    private String email;
    private String zip_num;
    private String address;
    @NotEmpty
    private String phone;
    private Timestamp indate;
