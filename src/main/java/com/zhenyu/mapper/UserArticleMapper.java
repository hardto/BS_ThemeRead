package com.zhenyu.mapper;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.zhenyu.model.UserArticle;
@MapperScan
public interface UserArticleMapper {
	UserArticle getArticleByTitle(String title);
	
	List<UserArticle> getCollectsByUser(String userid);
	
	UserArticle getArticleByIdAndTitle(String type,String user,String title);
	
	List<UserArticle> getCollects(String id);
	
	List<UserArticle> getUaByTypeId(String id);
	
	UserArticle hasArticle(String userid,String typeid);
	
	int getId();
	
    int deleteByPrimaryKey(String id);

    int insert(UserArticle record);

    int insertSelective(UserArticle record);

    UserArticle selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(UserArticle record);

    int updateByPrimaryKey(UserArticle record);
}