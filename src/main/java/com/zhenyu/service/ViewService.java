package com.zhenyu.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.SetOperations;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.zhenyu.mapper.ArticleCommentMapper;
import com.zhenyu.mapper.CollectedTypeMapper;
import com.zhenyu.mapper.RecommendMapper;
import com.zhenyu.mapper.TypeMapper;
import com.zhenyu.mapper.UserActionMapper;
import com.zhenyu.mapper.UserArticleMapper;
import com.zhenyu.mapper.UserMapper;
import com.zhenyu.model.ArticleComment;
import com.zhenyu.model.CollectedType;
import com.zhenyu.model.Recommend;
import com.zhenyu.model.Type;
import com.zhenyu.model.User;
import com.zhenyu.model.UserAction;
import com.zhenyu.model.UserArticle;
import com.zhenyu.model.msg.CensusMsg;
import com.zhenyu.model.msg.CollectMsg;
import com.zhenyu.model.msg.CollectedArticleMsg;
import com.zhenyu.model.msg.TypesMsg;
@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
@Service
public class ViewService {
	@Resource
	private ArticleCommentMapper articleCommentMapper;
	@Resource
	private CollectedTypeMapper collectedTypeMapper;
	@Resource
	private UserArticleMapper userArticleMapper;
	@Resource
	private UserActionMapper userActionMapper;
	@Resource
	private TypeMapper typeMapper;
	@Resource
	private RecommendMapper recommendMapper;
	@Resource
	private UserMapper userMapper;
	@Resource(name="redisTemplate")
    private RedisTemplate<String, String> rt;
	
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
	
	
	
	
	
	public CollectMsg getCollect(){
		Map<String,String> map = new HashMap<String, String>();
		List<Type> list = typeMapper.get2Types();
		for (int i = 0; i < list.size(); i++) {
			int count = 0;
			Type type = list.get(i);
			List<CollectedType> uas = collectedTypeMapper.getUaByTypeId(type.getId());
			for (int j = 0; j < uas.size(); j++) {
				CollectedType ua = uas.get(j);
				if(ua.getCol() == null || "".equals(ua.getCol())){
					count += 0;
				}else if("0".equals(ua.getCol())){
					count += 1;
				}
			}
			map.put(type.getName(), String.valueOf(count));
		}
		CollectMsg cm = new CollectMsg();
		cm.setMsg("成功");
		cm.setTables(map);
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
		if("".equals(url)){
			return typeMapper.updateTypeById(id, descs, typeMapper.selectByPrimaryKey(id).getCol());
		}
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

	
	public void addCollect(String userid,String type){
		//有没有
		CollectedType ua = collectedTypeMapper.hasArticle(userid, type);
		if( ua != null){
			String isc = ua.getCol();//0表示收藏
			if("0".equals(isc)){
				ua.setCol("1");
			}else{
				ua.setCol("0");
			}
			collectedTypeMapper.updateByPrimaryKey(ua);
		}else{
			String id = String.valueOf(collectedTypeMapper.getId()+1);
			CollectedType newua = new CollectedType();
			newua.setId(id);
			newua.setCreateTime(new Date());
			newua.setTypeId(type);
			newua.setUserId(userid);
			newua.setCol("0");
			collectedTypeMapper.insert(newua);
		}
		
	}
	
	public TypesMsg getCollectsToTypes(String id){
		List<CollectedType> cols = collectedTypeMapper.getCollects(id);
		List<Type> types = new ArrayList<Type>(0);
		for (CollectedType ct : cols) {
			types.add(typeMapper.selectByPrimaryKey(ct.getTypeId()));
		}
		TypesMsg tm = new TypesMsg();
		tm.setTypes(types);
		return tm;
	}
	public void savePerfectArticle(String content,String type,String title,String userid){
		String typeid = typeMapper.getThisPosition(type);
		UserArticle ua = userArticleMapper.getArticleByIdAndTitle(typeid, userid,title);
		if(ua != null){
			if("0".equals(ua.getCol1())){
				ua.setCol1("1");
			}else{
				ua.setCol1("0");
			}
		}
		userArticleMapper.updateByPrimaryKey(ua);
	}
	public void saveArticle(String content,String type,String title,String userid){
		//根据userid typeid看是否存在
		//1.获取typeid
		String typeid = typeMapper.getThisPosition(type);
		UserArticle ua = userArticleMapper.getArticleByIdAndTitle(typeid, userid,title);
		if(ua == null){
			//2.存储
			ua = new UserArticle();
			String id = String.valueOf(userArticleMapper.getId()+1);
			ua.setId(id);
			ua.setContent(content);
			ua.setTitle(title);
			ua.setTypeId(typeid);
			ua.setUserId(userid);
			ua.setCollectTime(new Date());
			ua.setCol1("0");
			userArticleMapper.insert(ua);
		}else{
			ua.setCol1("0");//收藏
			userArticleMapper.updateByPrimaryKey(ua);
		}
	}
	
	
	
	public CollectMsg getCollects(String userid){
		CollectMsg cm = new CollectMsg();
		cm.setMsg("成功");
		cm.setStatus("0");
		cm.setTypes(collectedTypeMapper.getCollects(userid));
		return cm;
	}
	
	
	public List<CollectedArticleMsg> getCollected(String userid){
		List<CollectedArticleMsg> cam = new ArrayList<CollectedArticleMsg>(0);
		List<UserArticle> uas = userArticleMapper.getCollectsByUser(userid);
		for (UserArticle userArticle : uas) {
			if("0".equals(userArticle.getCol1())){
				CollectedArticleMsg ca = new CollectedArticleMsg();
				Type type= typeMapper.selectByPrimaryKey(userArticle.getTypeId());
				ca.setImg(type.getCol());
				ca.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(userArticle.getCollectTime()));
				ca.setTitle(userArticle.getTitle());
				ca.setType(type.getName());
				cam.add(ca);
			}
		}
		return cam;
	}
	
	public UserArticle getArticleByTitle(String title){
		return userArticleMapper.getArticleByTitle(title);
	}
	public User getUserInfo(String id){
		return userMapper.selectByPrimaryKey(id);
	}
	public void saveUserInfo(String id,String realname,String date,String sex,String addr,String intro){
		User user = userMapper.selectByPrimaryKey(id);
		Calendar c = Calendar.getInstance();
		String dateNow = "";
		int year = c.get(Calendar.YEAR);
		int mon = (c.get(Calendar.MONTH)+1);
		String month = "";
		int da = c.get(Calendar.DATE);
		String day = "";
		if(mon<10){
			month = "0"+mon;
		}
		if(da<10){
			day = "0"+da;
		}
		dateNow = year+month+day;
		user.setRealName(realname);
		if(date!=null&&!"".equals(date)){
			if(Integer.valueOf(date.replaceAll("-", ""))>Integer.valueOf(dateNow))
			{
				user.setCol2(year+"-"+month+"-"+day);
			}else{
				user.setCol2(date);
			}
		}
		
		if("0".equals(sex)){
			user.setSex("男");
		}else if("1".equals(sex)){
			user.setSex("女");
		}
		
		user.setAddress(addr);
		user.setIntroduce(intro);
		userMapper.updateByPrimaryKey(user);
		
	}





	public void feedback(String id, String ask) {
		String idd = String.valueOf(articleCommentMapper.getId()+1);
		ArticleComment ac = new ArticleComment();
		ac.setId(idd);
		ac.setCol1(ask);
		ac.setCol2(id);
		articleCommentMapper.insert(ac);
		
	}





	public void toRedis(String id,String data) {
		//flushdb();
		SetOperations<String, String> vo = rt.opsForSet();
		vo.add(id, data);
	}
	 public void flushdb(){
	        rt.execute(new RedisCallback<Object>() {
	            public String doInRedis(RedisConnection connection) throws DataAccessException {
	                connection.flushDb();
	                return "ok";
	            }
	        });
	    }





	public Set<String> getRedis(String id) {
		return rt.opsForSet().members(id);
	}
	
}
