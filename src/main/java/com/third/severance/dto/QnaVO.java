package com.third.severance.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class QnaVO {
    private Integer qseq;
    @NotBlank
    private String userid;
    @NotBlank
    private String subject;
    @NotBlank
    private String content;
    private String reply;
    private Timestamp indate;
}