package com.zhenyu.model;

import com.zhenyu.model.common.SerializableAndId;

public class ArticleResource extends SerializableAndId {
    private String articleId;

    private String image;

    public String getArticleId() {
        return articleId;
    }

    public void setArticleId(String articleId) {
        this.articleId = articleId == null ? null : articleId.trim();
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }
}