package com.zhuhodor.server.common.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.connection.StringRedisConnection;
import org.springframework.data.redis.core.*;
import org.springframework.stereotype.Component;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.TimeUnit;

@Component
public class RedisUtil {

    @Autowired
    private StringRedisTemplate redisTemplate;

    /**
     * 是否有此键
     */
    public boolean hasKey(String key){
        return redisTemplate.hasKey(key);
    }

    /**
     * 实现命令：TTL key，以秒为单位，返回给定 key的剩余生存时间(TTL, time to live)。
     */
    public long ttl(String key) {
        return redisTemplate.getExpire(key);
    }

    /**
     * 实现命令：expire 设置过期时间，单位秒
     */
    public void expire(String key, long timeout) {
        redisTemplate.expire(key, timeout, TimeUnit.SECONDS);
    }

    /**
     * 实现命令：INCR key
     */
    public long incr(String key, long delta) {
        return redisTemplate.opsForValue().increment(key, delta);
    }

    /**
     * 实现命令：KEYS pattern，查找所有符合给定模式 pattern的 key
     */
    public Set<String> keys(String pattern) {
        return redisTemplate.keys(pattern);
    }

    /**
     * 实现命令：DEL key，删除一个key
     */
    public void del(String key) {
        redisTemplate.delete(key);
    }

    //    set 数据结构
    public void sadd(String key, String val){
        redisTemplate.opsForSet().add(key, val);
    }

    /**
     * set的成员数
     */
    public Long snum(String key){
        return redisTemplate.opsForSet().size(key);
    }

    /**
    * set中是否存在
     */
    public boolean sisSetMem(String key, Object val){
        return redisTemplate.opsForSet().isMember(key, val);
    }

    /**
     * scan所有符合条件的set
     */
    public Set<String> sScan(String pattern){
        Set<String> keys = redisTemplate.execute((RedisCallback<Set<String>>) con -> {
            HashSet<String> set = new HashSet<>();
            Cursor<byte[]> cursor = con.sScan(pattern.getBytes(), new ScanOptions.ScanOptionsBuilder().match(pattern).count(1000).build());
            while (cursor.hasNext()) {
                set.add(new String(cursor.next()));
            }
            return set;
        });
        return keys;
    }

    /**
     * 获取set所有元素
     */
    public Set<String> sget(String key){
        return redisTemplate.opsForSet().members(key);
    }

    /**
     * 删除set元素
     */
    public long srem(String key, Object... o){
        String[] param = new String[o.length];
        for (int i = 0; i < o.length; i++){
            param[i] = String.valueOf(o[i]);
        }
        return redisTemplate.opsForSet().remove(key, param);
    }

    /**
     * 删除set元素
     */
    public long sSize(String key){
        return redisTemplate.opsForSet().size(key);
    }

    //zset数据结构
    /**
     * 增加score
     * @param key
     * @param val
     * @param score
     */
    public void zincr(String key, String val, Double score){
        redisTemplate.opsForZSet().incrementScore(key, val, score);
    }

    /**
     * 返回set中member的score值，没有返回null
     */
    public void zScore(String key, String val){
        Double score = redisTemplate.opsForZSet().score(key, val);
    }

    /**
     * 倒序排序显示分数
     * @param key
     * @param start
     * @param end
     */
    public Set zrevRangeWithScore(String key, Long start, Long end){
        Set<ZSetOperations.TypedTuple<String>> typedTuples = redisTemplate.opsForZSet().reverseRangeWithScores(key, start, end);
        return typedTuples;
    }

    /**
     * 排序显示分数
     * @param key
     * @param start
     * @param end
     */
    public Set<ZSetOperations.TypedTuple<String>> zrangeWithScore(String key, Long start, Long end){
        Set<ZSetOperations.TypedTuple<String>> typedTuples = redisTemplate.opsForZSet().rangeWithScores(key, start, end);
        return typedTuples;
    }

    /**
     * zset添加
     */
    public Boolean zadd(String key, String value, Double score){
        return redisTemplate.opsForZSet().add(key, value, score);
    }

    /**
     * 删除key的所有
     * @param key
     */
    public void zremAll(String key){
        redisTemplate.opsForZSet().removeRange(key, 0, -1);
    }

    // String（字符串）
    /**
     * 实现命令：SET key value，设置一个key-value（将字符串值 value关联到 key）
     *
     * @param key
     * @param value
     */
    public void set(String key, String value) {
        redisTemplate.opsForValue().set(key, value);
    }

    /**
     * 实现命令：SET key value EX seconds，设置key-value和超时时间（秒）
     *
     * @param key
     * @param value
     * @param timeout（以秒为单位）
     */
    public void set(String key, String value, long timeout) {
        redisTemplate.opsForValue().set(key, value, timeout, TimeUnit.SECONDS);
    }

    /**
     * 实现命令：GET key，返回 key所关联的字符串值。
     *
     * @param key
     * @return value
     */
    public String get(String key) {
        return (String)redisTemplate.opsForValue().get(key);
    }

    /**
     * 批量查询，对应mget
     * @param keys
     * @return
     */
    public List<String> mget(List<String> keys) {
        return redisTemplate.opsForValue().multiGet(keys);
    }

    /**
     * 批量查询，管道pipeline
     * @param keys
     * @return
     */
    public List<Object> batchGet(List<String> keys) {

//		nginx -> keepalive
//		redis -> pipeline

        List<Object> result = redisTemplate.executePipelined(new RedisCallback<String>() {
            @Override
            public String doInRedis(RedisConnection connection) throws DataAccessException {
                StringRedisConnection src = (StringRedisConnection)connection;

                for (String k : keys) {
                    src.get(k);
                }
                return null;
            }
        });

        return result;
    }


    // Hash（哈希表）

    /**
     * 实现命令：HSET key field value，将哈希表 key中的域 field的值设为 value
     *
     * @param key
     * @param field
     * @param value
     */
    public void hset(String key, String field, Object value) {
        redisTemplate.opsForHash().put(key, field, value);
    }

    /**
     * 实现命令：HGET key field，返回哈希表 key中给定域 field的值
     *
     * @param key
     * @param field
     * @return
     */
    public String hget(String key, String field) {
        return (String) redisTemplate.opsForHash().get(key, field);
    }

    /**
     * 实现命令：HDEL key field [field ...]，删除哈希表 key 中的一个或多个指定域，不存在的域将被忽略。
     *
     * @param key
     * @param fields
     */
    public void hdel(String key, Object... fields) {
        redisTemplate.opsForHash().delete(key, fields);
    }

    /**
     * 实现命令：HGETALL key，返回哈希表 key中，所有的域和值。
     *
     * @param key
     * @return
     */
    public Map<Object, Object> hgetall(String key) {
        return redisTemplate.opsForHash().entries(key);
    }

    /**
     * 判断有无hash field
     * @param key
     * @param field
     * @return
     */
    public boolean hexists(String key, String field){
        return redisTemplate.opsForHash().hasKey(key, field);
    }

    /**
     * hash指定field的值自增步长 step
     * @param key
     * @param field
     */
    public void hincrby(String key, String field, long step){
        redisTemplate.opsForHash().increment(key, field, step);
    }

    public long hlen(String key){
        return redisTemplate.opsForHash().size(key);
    }


    // List（列表）

    /**
     * 实现命令：LPUSH key value，将一个值 value插入到列表 key的表头
     *
     * @param key
     * @param value
     * @return 执行 LPUSH命令后，列表的长度。
     */
    public long lpush(String key, String value) {
        return redisTemplate.opsForList().leftPush(key, value);
    }

    /**
     * 实现命令：LPOP key，移除并返回列表 key的头元素。
     *
     * @param key
     * @return 列表key的头元素。
     */
    public String lpop(String key) {
        return (String)redisTemplate.opsForList().leftPop(key);
    }

    /**
     * 实现命令：RPUSH key value，将一个值 value插入到列表 key的表尾(最右边)。
     *
     * @param key
     * @param value
     * @return 执行 LPUSH命令后，列表的长度。
     */
    public long rpush(String key, String value) {
        return redisTemplate.opsForList().rightPush(key, value);
    }
}
