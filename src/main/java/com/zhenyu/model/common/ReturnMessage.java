package com.zhenyu.model.common;

import java.io.Serializable;

public class ReturnMessage implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3856547192896831669L;

	private String status;
	
	private boolean isSuccess;
	
	private String msg;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public boolean isSuccess() {
		return isSuccess;
	}

	public void setSuccess(boolean isSuccess) {
		this.isSuccess = isSuccess;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
}
