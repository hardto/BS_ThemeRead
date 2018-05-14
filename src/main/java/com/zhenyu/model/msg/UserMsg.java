package com.zhenyu.model.msg;

import com.zhenyu.model.User;
import com.zhenyu.model.common.ReturnMessage;

public class UserMsg extends ReturnMessage{
	
	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
