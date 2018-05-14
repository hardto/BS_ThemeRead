package com.zhenyu.model;

import com.zhenyu.model.common.SerializableAndId;

public class Auth extends SerializableAndId{

    private String authName;

    private String col;


    public String getAuthName() {
        return authName;
    }

    public void setAuthName(String authName) {
        this.authName = authName == null ? null : authName.trim();
    }

    public String getCol() {
        return col;
    }

    public void setCol(String col) {
        this.col = col == null ? null : col.trim();
    }
}