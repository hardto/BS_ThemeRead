package com.zhenyu.model;

import com.zhenyu.model.common.SerializableAndId;

public class Role extends SerializableAndId{

    private String roleName;

    private String col1;


    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    public String getCol1() {
        return col1;
    }

    public void setCol1(String col1) {
        this.col1 = col1 == null ? null : col1.trim();
    }
}