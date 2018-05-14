package com.zhenyu.mapper;

import com.zhenyu.model.ArticleResource;

public interface ArticleResourceMapper {
    int deleteByPrimaryKey(String id);

    int insert(ArticleResource record);

    int insertSelective(ArticleResource record);

    ArticleResource selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ArticleResource record);

    int updateByPrimaryKey(ArticleResource record);
}