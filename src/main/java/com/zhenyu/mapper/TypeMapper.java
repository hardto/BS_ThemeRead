package com.zhenyu.mapper;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.zhenyu.model.Type;
@MapperScan
public interface TypeMapper {
	List<Type> get2Types();
	
    int deleteByPrimaryKey(String id);
    
    String getThisPosition(String name);

    int insert(Type record);
    
    int getId();

    int insertSelective(Type record);

    Type selectByPrimaryKey(String id);
    
    String getPosition(String name);
    
    List<Type> getTypes();
    List<Type> getAllTypes();
    List<Type> getChildrenTypes(String id);
    List<Type> getParentTypes();

    int updateByPrimaryKeySelective(Type record);

    int updateByPrimaryKey(Type record);
    
    int updateTypeById(String id,String descs,String url);
}