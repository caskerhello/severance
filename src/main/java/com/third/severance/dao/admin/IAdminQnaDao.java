package com.third.severance.dao.admin;

import com.third.severance.dto.QnaVO;
import com.third.severance.dto.Paging;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IAdminQnaDao {
    List<QnaVO> getQnaList(Paging paging, String key);

    QnaVO getQnaDetail(int qseq);

    void adminQnaReplyUpdate(int qseq, String reply);
}
