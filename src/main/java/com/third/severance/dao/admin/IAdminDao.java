package com.third.severance.dao.admin;

import com.third.severance.dto.AdminVO;
import com.third.severance.dto.MemberVO;
import com.third.severance.dto.Paging;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IAdminDao {
    AdminVO getAdmin(String adminid);

}