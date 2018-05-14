package com.zhenyu.common.encry;

import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

public class EncryptPlaceHolderConfigure extends PropertyPlaceholderConfigurer {
	private String[] encryptPropNames = {"password"};
	@Override
	protected String convertProperty(String propertyName, String propertyValue) {
		// TODO Auto-generated method stub
		if(isProp(propertyName))
		{
			String raw = DBEncryUtils.AESDncode(propertyValue);
			return raw;
		}
		else
		{
			return propertyValue;
		}
	}
	public boolean isProp(String propertyName)
	{
		for(String prop:encryptPropNames)
		{
			if(prop.equalsIgnoreCase(propertyName))
			{
				return true;
			}
		}
		return false;
	}
}
