package com.third.severance.dto;

import lombok.Data;

@Data
public class MemberVO {
    private int mseq;
    private String userid;
    private String pwd;
    private String name;
    private String email;
    private String zip_num;
    private String address;
    private String phone;

}
