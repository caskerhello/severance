package com.third.severance.dao;

import com.third.severance.dto.MemberVO;
import com.third.severance.dto.Paging;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IAdminMemberDao {
    List<MemberVO> getAllMember();

    int getAllCount(String member, String name, String key);
    List<MemberVO> getMemberList(Paging paging, String key);
}