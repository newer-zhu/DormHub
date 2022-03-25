package com.zhuhodor.server.redisMQ;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.stream.MapRecord;
import org.springframework.data.redis.connection.stream.RecordId;
import org.springframework.data.redis.connection.stream.StreamInfo;
import org.springframework.data.redis.connection.stream.StreamOffset;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 使用Redis的Stream实现MQ的工具类
 */
@Component
public class RedisStream {
    @Autowired
    private StringRedisTemplate redisTemplate;

    /**
     * 创建消费组
     * @param key
     * @param group
     * @return
     */
    public String createGroup(String key, String group){
        return redisTemplate.opsForStream().createGroup(key, group);
    }

    /**
     * 消费组信息
     * @param key
     * @param group
     * @return
     */
    public StreamInfo.XInfoConsumers consumers(String key, String group){
        return redisTemplate.opsForStream().consumers(key, group);
    }

    /**
     * 确认已消费
     * @param key
     * @param group
     * @param recordIds
     * @return
     */
    public Long ack(String key, String group, String... recordIds){
        return redisTemplate.opsForStream().acknowledge(key, group, recordIds);
    }

    /**
     * 追加消息
     * @param key
     * @param field
     * @param value
     * @return
     */
    public String add(String key, String field, Object value){
        Map<String, Object> content = new HashMap<>(1);
        content.put(field, value);
        return add(key, content);
    }

    public String add(String key, Map<String, Object> content){
        return redisTemplate.opsForStream().add(key, content).getValue();
    }

    /**
     * 删除消息，这里的删除仅仅是设置了标志位，不影响消息总长度
     * 消息存储在stream的节点下，删除时仅对消息做删除标记，当一个节点下的所有条目都被标记为删除时，销毁节点
     * @param key
     * @param recordIds
     * @return
     */
    public Long del(String key, String... recordIds){
        return redisTemplate.opsForStream().delete(key, recordIds);
    }

    /**
     * 消息长度
     * @param key
     * @return
     */
    public Long len(String key){
        return redisTemplate.opsForStream().size(key);
    }

    /**
     * 从头开始读
     * @param key
     * @return
     */
    public List<MapRecord<String, Object, Object>> read(String key){
        return redisTemplate.opsForStream().read(StreamOffset.fromStart(key));
    }

    /**
     * 从指定的ID开始读
     * @param key
     * @param recordId
     * @return
     */
    public List<MapRecord<String, Object, Object>> read(String key, String recordId){
        return redisTemplate.opsForStream().read(StreamOffset.from(MapRecord.create(key, new HashMap<>(1)).withId(RecordId.of(recordId))));
    }
}
