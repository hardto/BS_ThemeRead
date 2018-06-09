package com.zhenyu.mapper;

import org.mybatis.spring.annotation.MapperScan;

import com.zhenyu.model.ArticleComment;
@MapperScan
public interface ArticleCommentMapper {
	int getId();
	
    int deleteByPrimaryKey(String id);

    int insert(ArticleComment record);

    int insertSelective(ArticleComment record);

    ArticleComment selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ArticleComment record);

    int updateByPrimaryKey(ArticleComment record);
}