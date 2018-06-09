package com.zhenyu.mapper;

import org.mybatis.spring.annotation.MapperScan;

import com.zhenyu.model.User;
@MapperScan
public interface UserMapper {
    int deleteByPrimaryKey(String id);

    int insert(User record);
    
    int getId();
    
    User selectByEmail(String email);
    
    User selectByAccount(String account);
    
    User selectByPhone(String phone);

    int insertSelective(User record);

    User selectByPrimaryKey(String id);
    
    User selectByUsmPwd(String account,String pwd);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    int updateByEmail(String email,String pwd);
}