package com.zhenyu.service;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.zhenyu.mapper.RecommendMapper;
import com.zhenyu.mapper.TypeMapper;
import com.zhenyu.mapper.UserActionMapper;
import com.zhenyu.model.Recommend;
import com.zhenyu.model.Type;
import com.zhenyu.model.UserAction;
import com.zhenyu.model.msg.CensusMsg;
@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
@Service
public class ViewService {
	@Resource
	private UserActionMapper userActionMapper;
	@Resource
	private TypeMapper typeMapper;
	@Resource
	private RecommendMapper recommendMapper;
	
	
	public CensusMsg getCensus(){
		Map<String,String> map = new HashMap<String, String>();
		List<Type> list = typeMapper.get2Types();
		for (int i = 0; i < list.size(); i++) {
			int count = 0;
			Type type = list.get(i);
			List<UserAction> uas = userActionMapper.getUaByTypeId(type.getId());
			for (int j = 0; j < uas.size(); j++) {
				UserAction ua = uas.get(j);
				if(ua.getClickNum() == null || "".equals(ua.getClickNum())){
					count += 0;
				}else{
					count += Integer.valueOf(ua.getClickNum());
				}
			}
			map.put(type.getName(), String.valueOf(count));
		}
		CensusMsg cm = new CensusMsg();
		cm.setMsg("成功");
		cm.setResults(map);
		return cm;
	}
	
	
	
	
	
	
	
	
	
	
	public String getTypeIdByName(String name){
		return typeMapper.getThisPosition(name);
	}
	public void insertAction(String userId,String typeName){
		String typeId = getTypeIdByName(typeName);
		//先查询
		UserAction result = userActionMapper.selectByTypeUser(userId, typeId);
		if(result != null){
			//后更新	
			String click = result.getClickNum();
			int clickNum = Integer.valueOf(click)+1;
			result.setClickNum(clickNum+"");
			userActionMapper.updateByPrimaryKey(result);
		}else{
			//插入
			String id = String.valueOf(userActionMapper.getId()+1);
			UserAction ua = new UserAction();
			ua.setId(id);
			ua.setUserId(userId);
			ua.setTypeId(typeId);
			ua.setClickNum("1");
			userActionMapper.insert(ua);
		}
		
		
	}
	
	
	public int updateTypeById(String id,String descs,String url){
		return typeMapper.updateTypeById(id, descs, url);
	}
	
	public void edit(String delid,String ishot,String fatherid,String addtype){
		//添加
		if(addtype != null && !"".equals(addtype)){
			int maxId = typeMapper.getId();
			Type type = new Type();
			type.setId(String.valueOf((maxId+1)));
			type.setParentId(fatherid);
			type.setName(addtype);
			typeMapper.insert(type);
		}
		//删除
		if(delid != null && !"".equals(delid.trim()))
			typeMapper.deleteByPrimaryKey(delid);
		//修改
		Type type = typeMapper.selectByPrimaryKey(fatherid);
		type.setHot(Integer.valueOf(ishot));
		typeMapper.updateByPrimaryKey(type);
		
		
	}
	
	
	
	
	public void recommend(String main,String sub,String content){
			String id = String.valueOf(recommendMapper.getId()+1);
			Date date = new Date();
			Recommend r= new Recommend();
			r.setId(id);
			r.setMainTitle(main);
			r.setSubTitle(sub);
			r.setContent(content);
			r.setCreateTime(date);
			if (getRecommendToday() == null){
				recommendMapper.insert(r);
			}
		
	}
	
	public Recommend getRecommendToday(){
		//时间
		Calendar date = Calendar.getInstance();
		int year = date.get(Calendar.YEAR);
		int mon = date.get(Calendar.MONTH)+1;
		String finalMonth = ""+mon;
		if(mon <10){
			finalMonth = "0"+mon;
		}
		int day = date.get(Calendar.DATE);
		String finalDay = ""+day;
		if(day<10){
			finalDay = "0"+day;
		}
		return recommendMapper.getRecommendByDate(year+finalMonth+finalDay);
	
}
	

	public Recommend getRecommendById(String id){
		return recommendMapper.selectByPrimaryKey(id);	
}
	

	
	
	
	
	
	
	
	public List<Type> getTypes(){
		int flag = 0;
		List<Type> types = typeMapper.getTypes();
		for (int i = 0; i < types.size(); i++) {
			if("0".equals(types.get(i).getId()))
				flag = i;
		}
		types.remove(flag);
		return types;
	}
	public List<Type> getAllTypes(){
		int flag = 0;
		List<Type> types = typeMapper.getAllTypes();
		for (int i = 0; i < types.size(); i++) {
			if("0".equals(types.get(i).getId()))
				flag = i;
		}
		types.remove(flag);
		return types;
	}
	public Type getOneType(String id){
		return typeMapper.selectByPrimaryKey(id);
	}
	
	public List<Type> getChildrenTypes(String id){
		int flag = -1;
		List<Type> types = typeMapper.getChildrenTypes(id);
		for (int i = 0; i < types.size(); i++) {
			if("0".equals(types.get(i).getId()))
				flag = i;
		}
		if(flag>-1){
			types.remove(flag);
		}
		return types;
	}
	
	public String getPosition(String name){
		return typeMapper.getPosition(name);
	}

}
