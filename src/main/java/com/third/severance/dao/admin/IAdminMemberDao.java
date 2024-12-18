package com.third.severance.dao.admin;

import com.third.severance.dto.DoctorVO;
import com.third.severance.dto.MemberVO;
import com.third.severance.dto.Paging;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IAdminMemberDao {
    List<MemberVO> getMemberList(Paging paging, String key);
}
