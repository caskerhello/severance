package com.third.severance.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class QnaVO {
    private Integer qseq;
    private String userid;
    private String subject;
    private String content;
    private String reply;
    private Timestamp indate;
}