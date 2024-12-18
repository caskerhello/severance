package com.third.severance.dao;

import com.third.severance.dto.Paging;
import com.third.severance.dto.QnaVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IQnaDao {
    List<QnaVO> getQnaList(Paging paging);
    int getAllCount();
    QnaVO getQna(int qseq);
    void insertQna(QnaVO qvo);
}