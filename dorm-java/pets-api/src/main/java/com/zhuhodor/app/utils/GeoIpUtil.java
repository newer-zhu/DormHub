package com.zhuhodor.app.utils;

import com.maxmind.db.CHMCache;
import com.maxmind.geoip2.DatabaseReader;
import com.maxmind.geoip2.model.CityResponse;
import com.maxmind.geoip2.record.Location;
import com.zhuhodor.app.model.pojo.Ip2CityEntity;

import java.io.IOException;
import java.io.InputStream;
import java.net.InetAddress;

public class GeoIpUtil {

    /**
     * 数据库文件所在的路径（resources文件内）
     */
    private static final String mmdbPath = "mmdb/GeoLite2-City.mmdb";

    /**
     * 设置返回的语言：简体中文
     */
    private static final String CHS = "zh-CN";

    /**
     * 读取resources文件中的静态数据库
     */
    private static final InputStream mmdbStream = GeoIpUtil.class.getClassLoader().getResourceAsStream(mmdbPath);

    /**
     * 数据库加载器，全局静态，只加载一次
     */
    private static DatabaseReader databaseReader;

    // 静态代码块，初始化时执行一次
    static {
        try {
            databaseReader = new DatabaseReader.Builder(mmdbStream).withCache(new CHMCache()).build();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 通过IP查询地址信息
     *
     * @param ip IP地址
     * @return 城市地址信息
     */
    public static Ip2CityEntity getIpInfo(String ip) {
        Ip2CityEntity ip2CityEntity = new Ip2CityEntity();
        try {
            // 获取主机的IP（IP可以是域名）
            InetAddress inetAddress = InetAddress.getByName(ip);
            // 通过数据库查询该IP的信息
            CityResponse response = databaseReader.city(inetAddress);
            // 解析国家
            String countryName = response.getCountry().getNames().get(CHS);
            // 解析二级分支（一般是省份）
            String provinceName = response.getMostSpecificSubdivision().getNames().get(CHS);
            // 解析城市
            String cityName = response.getCity().getNames().get(CHS);
            // 解析坐标
            Location location = response.getLocation();
            // 写入实体
            ip2CityEntity.setIp(ip)
                    .setCountry(countryName)
                    .setProvince(provinceName)
                    .setCity(cityName)
                    // 经度
                    .setLatitude(location.getLatitude())
                    // 维度
                    .setLongitude(location.getLongitude());
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
        return ip2CityEntity;
    }

}
