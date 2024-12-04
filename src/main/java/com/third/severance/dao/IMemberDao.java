package com.third.severance.dao;

import com.third.severance.dto.MemberVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMemberDao {

    MemberVO getMember(String userid);
    void insertMember(MemberVO mvo);
}
