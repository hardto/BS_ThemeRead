package com.zhenyu.model.msg;

import java.util.List;

import com.zhenyu.model.Type;
import com.zhenyu.model.common.ReturnMessage;

public class TypesMsg extends ReturnMessage{
	
	private List<Type> types;
	
	public TypesMsg(){}

	public List<Type> getTypes() {
		return types;
	}

	public void setTypes(List<Type> types) {
		this.types = types;
	}

	

	

}
