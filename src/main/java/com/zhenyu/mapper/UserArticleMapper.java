package com.zhenyu.mapper;

import com.zhenyu.model.UserArticle;

public interface UserArticleMapper {
    int deleteByPrimaryKey(String id);

    int insert(UserArticle record);

    int insertSelective(UserArticle record);

    UserArticle selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(UserArticle record);

    int updateByPrimaryKey(UserArticle record);
}