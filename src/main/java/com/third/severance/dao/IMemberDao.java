package com.third.severance.dao;

import com.third.severance.dto.MemberVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface IMemberDao {

    MemberVO getMember(String userid);
    void insertMember(MemberVO mvo);

    MemberVO memberIdSearch(MemberVO searchVO);
}
