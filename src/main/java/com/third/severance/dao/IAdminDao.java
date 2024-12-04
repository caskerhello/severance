package com.third.severance.dao;

import com.third.severance.dto.AdminVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IAdminDao {
    AdminVO getAdmin(String adminid);

}
