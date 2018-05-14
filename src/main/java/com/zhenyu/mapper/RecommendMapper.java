package com.zhenyu.mapper;

import org.mybatis.spring.annotation.MapperScan;

import com.zhenyu.model.Recommend;
@MapperScan
public interface RecommendMapper {
	int getId();
	
	Recommend getRecommendByDate(String data);
	
    int deleteByPrimaryKey(String id);

    int insert(Recommend record);

    int insertSelective(Recommend record);

    Recommend selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Recommend record);

    int updateByPrimaryKey(Recommend record);
}