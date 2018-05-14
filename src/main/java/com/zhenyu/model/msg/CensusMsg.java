package com.zhenyu.model.msg;

import java.util.Map;

import com.zhenyu.model.common.ReturnMessage;

public class CensusMsg extends ReturnMessage {

	private Map<String,String> results;
	
	public CensusMsg(){}

	public Map<String, String> getResults() {
		return results;
	}

	public void setResults(Map<String, String> results) {
		this.results = results;
	}
	
	
	
}
