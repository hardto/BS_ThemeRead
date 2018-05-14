package com.zhenyu.mapper;

import org.mybatis.spring.annotation.MapperScan;

import com.zhenyu.model.UserAuths;
@MapperScan
public interface UserAuthsMapper {
    int deleteByPrimaryKey(String id);

    int insert(UserAuths record);

    int insertSelective(UserAuths record);
    
    int getId();

    UserAuths selectByPrimaryKey(String id);
    
    UserAuths selectByIdentityType(String type,String item,String pwd);

    int updateByPrimaryKeySelective(UserAuths record);

    int updateByPrimaryKeyWithBLOBs(UserAuths record);

    int updateByPrimaryKey(UserAuths record);
    
    int updateByIdentity(String email,String pwd);
}