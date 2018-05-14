package com.zhenyu.mapper;

import com.zhenyu.model.UserRole;
import com.zhenyu.model.UserRoleKey;

public interface UserRoleMapper {
    int deleteByPrimaryKey(UserRoleKey key);

    int insert(UserRole record);

    int insertSelective(UserRole record);

    UserRole selectByPrimaryKey(UserRoleKey key);

    int updateByPrimaryKeySelective(UserRole record);

    int updateByPrimaryKey(UserRole record);
}