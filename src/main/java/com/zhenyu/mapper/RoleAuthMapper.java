package com.zhenyu.mapper;

import com.zhenyu.model.RoleAuth;
import com.zhenyu.model.RoleAuthKey;

public interface RoleAuthMapper {
    int deleteByPrimaryKey(RoleAuthKey key);

    int insert(RoleAuth record);

    int insertSelective(RoleAuth record);

    RoleAuth selectByPrimaryKey(RoleAuthKey key);

    int updateByPrimaryKeySelective(RoleAuth record);

    int updateByPrimaryKey(RoleAuth record);
}