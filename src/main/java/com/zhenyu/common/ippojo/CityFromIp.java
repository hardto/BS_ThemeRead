package com.zhenyu.common.ippojo;

import java.io.File;
import java.net.InetAddress;

import javax.annotation.PostConstruct;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

import com.maxmind.geoip2.DatabaseReader;
import com.maxmind.geoip2.model.CityResponse;
@Component
public class CityFromIp {
	
	private static String dbPath = "/BS_ThemeReading/src/main/resources/GeoLite2-City.mmdb";

    private static DatabaseReader reader;
    
    @Autowired
    private Environment env;
    
    @PostConstruct
    public void init() {
        try {
        	dbPath = CityFromIp.class.getResource("/").getPath()+"GeoLite2-City.mmdb";
        	/*System.out.println("==========================");
        	System.out.println(dbPath);*/
            String path = env.getProperty("geolite2.city.db.path");
            if (StringUtils.isNotBlank(path)) {
                dbPath = path;
            }
            File database = new File(dbPath);
            reader = new DatabaseReader.Builder(database).build();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

	
	public String getSubdivision(String ipAddress){
        try {
            CityResponse response = reader.city(InetAddress.getByName(ipAddress));
            return response.getMostSpecificSubdivision().getNames().get("zh-CN");
        }catch (Exception e){
        	e.printStackTrace();
            return null;
        }
    }
    

}
