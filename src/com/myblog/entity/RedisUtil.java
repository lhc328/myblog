package com.myblog.entity;

import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;


import java.util.concurrent.TimeUnit;

public class RedisUtil {
    private RedisTemplate<String, Object> redisTemplate;

//    public void removePattern(final String key){
//        Set<Serializable> keys = redisTemplate.keys(key);
//        if(keys.size() > 0)
//            redisTemplate.delete(keys);
//    }

    public boolean exists(final String key){
        return redisTemplate.hasKey(key);
    }


    public void remove(final String key){
        if(exists(key)){
            redisTemplate.delete(key);
        }
    }

    public Object get(final String key){
        Object result = null;
        ValueOperations<String, Object> operations = redisTemplate.opsForValue();
        result = operations.get(key);
        return result;
    }

    public boolean set(final String key, Object value){
        boolean result = false;
        try{
            ValueOperations<String, Object> operations = redisTemplate.opsForValue();
            operations.set(key, value);
            result = true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    public boolean set(final String key, Object value, Long expireTime) {
        boolean result = false;
        try {
            ValueOperations<String, Object> operations = redisTemplate.opsForValue();
            operations.set(key, value);
            redisTemplate.expire(key, expireTime, TimeUnit.SECONDS);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public long increment(final String key , long delta){
        return redisTemplate.opsForValue().increment(key, delta);
    }

    public void setRedisTemplate(RedisTemplate<String, Object> redisTemplate) {
        this.redisTemplate = redisTemplate;
    }
}
