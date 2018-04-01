package com.zhenyu.model;

public class UserRole extends UserRoleKey {
    private String col1;

    public String getCol1() {
        return col1;
    }

    public void setCol1(String col1) {
        this.col1 = col1 == null ? null : col1.trim();
    }
}