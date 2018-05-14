package com.zhenyu.mapper;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.zhenyu.model.UserAction;
@MapperScan
public interface UserActionMapper {
	UserAction selectByTypeUser(String user,String type);
	
	List<UserAction> getUaByTypeId(String typeId);
	
	int getId();
	
    int deleteByPrimaryKey(String id);

    int insert(UserAction record);

    int insertSelective(UserAction record);

    UserAction selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(UserAction record);

    int updateByPrimaryKey(UserAction record);
}