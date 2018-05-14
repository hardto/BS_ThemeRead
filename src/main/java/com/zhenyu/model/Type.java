package com.zhenyu.model;

import com.zhenyu.model.common.SerializableAndId;

public class Type extends SerializableAndId{

    private String parentId;

    private String name;

    private String col;

    private Integer hot;

    private String descs;

    public String getDescs() {
		return descs;
	}

	public void setDescs(String descs) {
		this.descs = descs;
	}

	public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId == null ? null : parentId.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getCol() {
        return col;
    }

    public void setCol(String col) {
        this.col = col == null ? null : col.trim();
    }

    public Integer getHot() {
        return hot;
    }

    public void setHot(Integer hot) {
        this.hot = hot;
    }
}