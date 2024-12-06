package com.third.severance.dto;

import jakarta.validation.constraints.NotEmpty;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class MemberVO {
    private int mseq;

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

    // 아이디 찾기 관련 필드
    private String me_name;
    private String me_tel; // 필드명 수정 (me_phone -> me_tel)
    private String me_id;

    // Getter and Setter for me_name
    public String getMe_name() {
        return me_name;
    }

    public void setMe_name(String me_name) {
        this.me_name = me_name;
    }

    // Getter and Setter for me_tel
    public String getMe_tel() {
        return me_tel;
    }

    public void setMe_tel(String me_tel) {
        this.me_tel = me_tel;
    }

    // Getter and Setter for me_id
    public String getMe_id() {
        return me_id;
    }

    public void setMe_id(String me_id) {
        this.me_id = me_id;
    }
}
