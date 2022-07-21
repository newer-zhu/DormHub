package com.zhuhodor.app.common.utils;

import cn.hutool.core.io.FileTypeUtil;
import com.qcloud.cos.COSClient;
import com.qcloud.cos.ClientConfig;
import com.qcloud.cos.auth.BasicCOSCredentials;
import com.qcloud.cos.auth.COSCredentials;
import com.qcloud.cos.http.HttpProtocol;
import com.qcloud.cos.model.ObjectMetadata;
import com.qcloud.cos.region.Region;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 腾讯COS工具类
 */
@Data
@Slf4j
public class TencentCos {
    private String secretId;
    private String secretKey;
    private String regionAddr;
    private String bucketName;
    private String remoteAddr;
    private COSClient cosClient = null;

    public TencentCos(String secretId, String secretKey, String regionAddr, String bucketName, String remoteAddr){
        this.secretId = secretId;
        this.secretKey = secretKey;
        this.regionAddr = regionAddr;
        this.bucketName = bucketName;
        this.remoteAddr = remoteAddr;

        COSCredentials cred = new BasicCOSCredentials(secretId, secretKey);
        ClientConfig clientConfig = new ClientConfig(new Region(regionAddr));
        // clientConfig 中包含了设置 region, https(默认 http), 超时, 代理等 set 方法, 使用可参见源码或者常见问题 Java SDK 部分。
        // 这里建议设置使用 https 协议
        clientConfig.setHttpProtocol(HttpProtocol.https);
        // 3 生成 cos 客户端。
        cosClient = new COSClient(cred, clientConfig);
    }

    //上传文件
    public Map<String,String> uploadPic(MultipartFile pic, String prefix) {
        // 指定文件上传到 COS 上的路径，即对象键。例如对象键为folder/picture.jpg，则表示将文件 picture.jpg 上传到 folder 路径下
        Date time = Calendar.getInstance().getTime();
        String prePath = prefix + new SimpleDateFormat("yyyy-MM-dd").format(time);
        String fileExtName = "";
        try {
            fileExtName = FileTypeUtil.getType(pic.getInputStream());
        } catch (IOException e) {
            log.error("获取文件扩展名失败");
        }
        //得到域名下的路径
        String key = prePath+"/" + UUID.randomUUID().toString()+'.'+fileExtName;
        ObjectMetadata objectMetadata = new ObjectMetadata();
        try {
            // 设置输入流长度为
            objectMetadata.setContentLength(pic.getInputStream().available());
            // 设置 Content type, 默认是 application/octet-stream
            objectMetadata.setContentType(pic.getContentType());
            cosClient.putObject(bucketName, key, pic.getInputStream(), objectMetadata);
            Map<String, String> map = new HashMap<>();
            map.put("remoteAddr", remoteAddr);
            map.put("key", key);
            return map;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    //删除文件
    public void deletePic(String key){
        cosClient.deleteObject(bucketName, key);
    }
}
