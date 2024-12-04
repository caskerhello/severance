package com.third.severance.dao;

import com.third.severance.dto.MemberVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IReserveDao {

    void updateMember(MemberVO membervo);
    void deleteMember(String userid);

}
