package demo;

import org.apache.log4j.Logger;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 * @author 张建平 on 2018/9/13 19:54
 */
public class JedisUtils {

    static Logger logger = Logger.getLogger(JedisUtils.class);
// redis nosql
    static JedisPool jedisPool = null;

    static {
        JedisPoolConfig config = new JedisPoolConfig();
        // JedisPool jedisPool = new JedisPool();
        //控制一个pool可分配多少个jedis实例，通过pool.getResource()来获取；
        //如果赋值为-1，则表示不限制；如果pool已经分配了maxActive个jedis实例，则此时pool的状态为exhausted(耗尽)。
        config.setMaxTotal(50);

        //控制一个pool最多有多少个状态为idle(空闲的)的jedis实例。
        config.setMaxIdle(5);

        //表示当borrow(引入)一个jedis实例时，最大的等待时间，如果超过等待时间，则直接抛出JedisConnectionException；单位毫秒
        //小于零:阻塞不确定的时间,  默认-1
        config.setMaxWaitMillis(1000*100);

        //在borrow(引入)一个jedis实例时，是否提前进行validate操作；如果为true，则得到的jedis实例均是可用的；
        config.setTestOnBorrow(true);

        //return 一个jedis实例给pool时，是否检查连接可用性（ping()）
        config.setTestOnReturn(true);
        //connectionTimeout 连接超时（默认2000ms）
        //soTimeout 响应超时（默认2000ms）
        jedisPool = new JedisPool(config, "localhost", 6379,  2000, "myredis");
    }

    /**
     * 获取Jedis client实例
     * @return
     */
    public static Jedis getClient(){
        try {
            return jedisPool.getResource();
        } catch (Exception e) {
            logger.error("op key {} error: " + e.getMessage(), e);
        }
        return null;
    }


    /**
     * 注意这里不是关闭连接，在JedisPool模式下，Jedis会被归还给资源池
     * @param jedis
     */
    public void close(Jedis jedis){
        if (jedis != null) {
            jedis.close();
        }
    }


    public static void main(String[] args) {
        Jedis client = JedisUtils.getClient();
        System.out.println("------------- String操作的命令------------");
        /*
         对String操作的命令
            set(key, value)：        给数据库中名称为key的string赋予值value
            get(key)：               返回数据库中名称为key的string的value
            getset(key, value)：     给名称为key的string赋予上一次的value
            mget(key1, key2,…, key N)：返回库中多个string的value
            setnx(key, value)：      添加string，名称为key，值为value
            setex(key, time, value)：向库中添加string，设定过期时间time
            mset(key N, value N)：   批量设置多个string的值
            msetnx(key N, value N)： 如果所有名称为key i的string都不存在
            incr(key)：              名称为key的string增1操作
            incrby(key, integer)：   名称为key的string增加integer
            decr(key)：              名称为key的string减1操作
            decrby(key, integer)：   名称为key的string减少integer
            append(key, value)：     名称为key的string的值附加value
            substr(key, start, end)：返回名称为key的string的value的子串
         */
        // 批量设置多个string的值
        client.mset("user:name","james", "user:age", "33");
        System.out.println("名字和年龄：" + client.mget("user:name", "user:age"));

        // 给数据库中名称为key的string赋予值value
        client.set("user:job","teacher");
        // 返回数据库中名称为key的string的value
        System.out.println("工作：" + client.get("user:job"));

        // 给名称为key的string赋予上一次的value
        System.out.println("返回旧并设置新值：" + client.getSet("user:age", "40"));
        System.out.println("设置的新值是：" + client.get("user:age"));
        // 名称为key的string增1操作
        System.out.println("年龄递增：" + client.incr("user:age"));
        // 名称为key的string增加integer
        System.out.println("年龄增加4：" +client.incrBy("user:age", 4));

        // 如果数据库不存在则添加string，名称为key，值为value
        Long setnx = client.setnx("user:job", "码农");
        System.out.println(setnx!=0? "设置为码农": "不设置");

        // 向库中添加string，设定过期时间time
        client.setex("user:gender",10, "男");
        System.out.println("设置性别: 男，10s过期：" + client.get("user:gender"));

        client.append("user:name", " zhang");
        System.out.println("名字新加zhang：" + client.get("user:name"));

        System.out.println("------------- key操作的命令------------");
        /*
        对KEY操作的命令:
            exists(key)：        确认一个key是否存在
            del(key)：           删除一个key
            type(key)：          返回值的类型
            keys(pattern)：      返回满足给定pattern的所有key
            randomkey：          随机返回key空间的一个
            rename(oldKey, newKey)：重命名key
            dbsize：             返回当前数据库中key的数目
            expire：             设定一个key的活动时间（s）
            ttl：                获得一个key的活动时间
            move(key, dbindex)： 移动当前数据库中的key到dbindex数据库
            flushdb：            删除当前选择数据库中的所有key
            flushall：           删除所有数据库中的所有key
        */
        // 确认一个key是否存在
        System.out.println("是否存在user:name的key? " + client.exists("user:name"));

        // 返回满足给定pattern的所有key
        // Glob style patterns examples:
        //      h?llo will match hello hallo hhllo
        //      h*llo will match hllo heeeello
        //      h[ae]llo will match hello and hallo, but not hillo
        System.out.println(client.keys("user:*"));

        // del(key)：删除一个key
        System.out.println("删除user:job key: " + client.del("user:job"));

        // type(key)：返回值的类型
        System.out.println("年龄的类型：" + client.type("user:age"));

        // randomkey：随机返回key空间的一个
        System.out.println("随机返回一个key: " + client.randomKey());

        // rename(oldKey, newKey)：重命名key

        // dbsize：返回当前数据库中key的数目
        System.out.println("数据库中key的数目: " + client.dbSize());
        // expire：             设定一个key的活动时间（s）

        // ttl：获得一个key的活动时间，无过期时间为-1；无对应的key为-2
        System.out.println("user:name的过期时间：" + client.ttl("user:name55"));

        // move(key, dbindex)： 移动当前数据库中的key到dbindex数据库

        // flushdb：删除当前选择数据库中的所有key; 成功返回Ok
        System.out.println("删除当前选择数据库中的所有key: " + client.flushDB());
        System.out.println("数据库中key的数目: " +client.dbSize());

        // flushall：删除所有数据库中的所有key


        /*
        对List操作的命令
            rpush(key, value)：      在名称为key的list尾添加一个值为value的元素
            lpush(key, value)：      在名称为key的list头添加一个值为value的 元素
            llen(key)：              返回名称为key的list的长度
            lrange(key, start, end)：返回名称为key的list中start至end之间的元素
            ltrim(key, start, end)： 截取名称为key的list
            lindex(key, index)：     返回名称为key的list中index位置的元素
            lset(key, index, value)：给名称为key的list中index位置的元素赋值
            lrem(key, count, value)：删除count个key的list中值为value的元素
            lpop(key)：              返回并删除名称为key的list中的首元素
            rpop(key)：              返回并删除名称为key的list中的尾元素
            blpop(key1, key2,… key N, timeout)：lpop命令的block版本。
            brpop(key1, key2,… key N, timeout)：rpop的block版本。
            rpoplpush(srckey, dstkey)：返回并删除名称为srckey的list的尾元素，并将该元素添加到名称为dstkey的list的头部
        */
        client.lrange("", 0, -1);


    }
}
