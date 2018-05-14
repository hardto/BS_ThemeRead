package com.zhenyu.mapper;

import com.zhenyu.model.ArticleComment;

public interface ArticleCommentMapper {
    int deleteByPrimaryKey(String id);

    int insert(ArticleComment record);

    int insertSelective(ArticleComment record);

    ArticleComment selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ArticleComment record);

    int updateByPrimaryKey(ArticleComment record);
}