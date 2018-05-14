package com.zhenyu.mapper;

import org.mybatis.spring.annotation.MapperScan;

import com.zhenyu.model.Login;
@MapperScan
public interface LoginMapper {
    int deleteByPrimaryKey(String id);

    int insert(Login record);

    int insertSelective(Login record);
    
    int getId();

    Login selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Login record);

    int updateByPrimaryKey(Login record);
}