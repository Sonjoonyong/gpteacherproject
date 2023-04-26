package com.sooaz.gpt.global.redis;

import org.junit.Test;
import org.junit.jupiter.api.Assertions;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.util.HashMap;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
        "file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/message-context.xml",
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
public class RedisClientTest {

    @Autowired JedisPool jedisPool;

    @Test
    public void redis() {
//        JedisPool pool = new JedisPool("localhost", 6379);

        try (Jedis jedis = jedisPool.getResource()){
            jedis.set("foo", "bar");
            jedis.expire("foo", 1);
            //jedis.setex("foo", 1, "bar");

            System.out.println("jedis.get(\"foo\") = " + jedis.get("foo"));
            System.out.println("jedis.ttl(\"foo\") = " + jedis.ttl("foo"));

            HashMap<String, String> map = new HashMap<>();
            map.put("userLoginId", "admin");
            map.put("userNickname", "어드민");
            map.put("userEmail", "admin@example.com");
            jedis.hset("user-session:1", map);
            jedis.expire("user-session:1", 1);

            System.out.println("jedis.hgetAll(\"user-session:1\") = " + jedis.hgetAll("user-session:1"));
            System.out.println("jedis.ttl(\"user-session:1\") = " + jedis.ttl("user-session:1"));

            Thread.sleep(1001);

            Assertions.assertNull(jedis.get("foo"));
            Assertions.assertNull(jedis.get("user-session:1"));
            
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}