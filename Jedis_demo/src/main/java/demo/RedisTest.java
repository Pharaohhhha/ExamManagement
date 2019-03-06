package demo;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


/**
 * @author Administrator
 */
public class RedisTest {
    static JedisPool pool;
    Jedis jedis;

    @BeforeClass
    public static void befor(){
        // pool = new JedisPool(new JedisPoolConfig(), "127.0.0.1",6379,2000,"myredis");
    }


    @Before
    public void setUp() {
        // jedis = pool.getResource();
        jedis = JedisUtils.getClient();
    }

    /**
     * 注意这里不是关闭连接，在JedisPool模式下，Jedis会被归还给资源池
     */
    public void tearDown(){
        this.jedis.close();
    }

    /**
     * Redis存储初级的字符串
     * CRUD
     * 对String操作的命令
     *    set(key, value)：        给数据库中名称为key的string赋予值value
     *    get(key)：               返回数据库中名称为key的string的value
     *    getset(key, value)：     给名称为key的string赋予上一次的value
     *    mget(key1, key2,…, key N)：返回库中多个string的value
     *    setnx(key, value)：      添加string，名称为key，值为value
     *    setex(key, time, value)：向库中添加string，设定过期时间time
     *    mset(key N, value N)：   批量设置多个string的值
     *    msetnx(key N, value N)： 如果所有名称为key i的string都不存在
     *    incr(key)：              名称为key的string增1操作
     *    incrby(key, integer)：   名称为key的string增加integer
     *    decr(key)：              名称为key的string减1操作
     *    decrby(key, integer)：   名称为key的string减少integer
     *    append(key, value)：     名称为key的string的值附加value
     *    substr(key, start, end)：返回名称为key的string的value的子串
     */
    @Test
    public void testBasicString() {
        //-----添加数据----------
        //向key-->name中放入了value-->james
        jedis.set("name", "james");
        //执行结果：james
        System.out.println(jedis.get("name"));

        //-----修改数据-----------
        //1、在原来基础上修改
        //很直观，类似map 将and jack append到已经有的value之后
        jedis.append("name", " and jack");

        //执行结果:james and jack
        System.out.println(jedis.get("name"));

        //2、直接覆盖原来的数据
        jedis.set("name", "张建平");
        //执行结果：张建平
        System.out.println(jedis.get("name"));

        //删除key对应的记录
        jedis.del("name");
        //执行结果：null
        System.out.println(jedis.get("name"));

        /*
         * mset相当于
         * jedis.set("name","james");
         * jedis.set("jarorwar","张建平");
         */
        jedis.mset("nickName", "james", "name", "张建平");
        System.out.println(jedis.mget("name", "nickName"));
    }

    /**
     * 对Hash操作的命令:
     *      hset(key, field, value)：    向名称为key的hash中添加元素field
     *      hget(key, field)：           返回名称为key的hash中field对应的value
     *      hmget(key, (fields))：       返回名称为key的hash中field i对应的value
     *      hmset(key, (fields))：       向名称为key的hash中添加元素field
     *      hincrby(key, field, integer)：将名称为key的hash中field的value增加integer
     *      hexists(key, field)：        名称为key的hash中是否存在键为field的域
     *      hdel(key, field)：           删除名称为key的hash中键为field的域
     *      hlen(key)：                  返回名称为key的hash中元素个数
     *      hkeys(key)：                 返回名称为key的hash中所有键
     *      hvals(key)：                 返回名称为key的hash中所有键对应的value
     *      hgetall(key)：               返回名称为key的hash中所有的键（field）及其对应的value
     */
    @Test
    public void testMap() {
        Map<String, String> user = new HashMap<String, String>();
        user.put("name", "james");
        user.put("pwd", "123456");
        jedis.hmset("user", user);

        //取出user中的name，执行结果:[james]-->注意结果是一个泛型的List
        //第一个参数是存入redis中map对象的key，后面跟的是放入map中的对象的key，后面的key可以跟多个，是可变参数
        List<String> rsmap = jedis.hmget("user", "name", "pwd");
        System.out.println(rsmap);

        //删除map中的某个键值
        // jedis.hdel("user","pwd");
        //因为删除了，所以返回的是null
        System.out.println(jedis.hmget("user", "pwd"));

        //返回key为user的键中存放的值的个数1
        System.out.println("Map size: " + jedis.hlen("user"));

        //是否存在key为user的记录 返回true
        System.out.println("否存在key为user的记录: " + jedis.exists("user"));

        //返回map对象中的所有key  [pwd, name]
        System.out.println("map对象中的所有key: " + jedis.hkeys("user"));

        //返回map对象中的所有value  [james, password]
        System.out.println("map对象中的所有value: " + jedis.hvals("user"));

        Iterator<String> iter = jedis.hkeys("user").iterator();
        while (iter.hasNext()) {
            String key = iter.next();
            System.out.println(key + ":" + jedis.hmget("user", key));
        }
    }

    /**
     * jedis操作List的命令
     *     rpush(key, value)：      在名称为key的list尾添加一个值为value的元素
     *     lpush(key, value)：      在名称为key的list头添加一个值为value的 元素
     *     lpush(key, value)：      在名称为key的list头添加一个值为value的 元素
     *     llen(key)：              返回名称为key的list的长度
     *     lrange(key, start, end)：返回名称为key的list中start至end之间的元素
     *     ltrim(key, start, end)： 截取名称为key的list
     *     lindex(key, index)：     返回名称为key的list中index位置的元素
     *      lset(key, index, value)：给名称为key的list中index位置的元素赋值
     *     lrem(key, count, value)：删除count个key的list中值为value的元素
     *     lpop(key)：              返回并删除名称为key的list中的首元素
     *     rpop(key)：              返回并删除名称为key的list中的尾元素
     *     blpop(key1, key2,… key N, timeout)：lpop命令的block版本。
     *     brpop(key1, key2,… key N, timeout)：rpop的block版本。
     *     rpoplpush(srckey, dstkey)：返回并删除名称为srckey的list的尾元素，并将该元素添加到名称为dstkey的list的头部
     */
    @Test
    public void testList() {
        //开始前，先移除所有的内容
        jedis.del("java framework");
        System.out.println(jedis.lrange("java framework", 0, -1));

        //先向key java framework中存放三条数据
        jedis.lpush("java framework", "spring");
        jedis.lpush("java framework", "struts");
        jedis.lpush("java framework", "hibernate");

        String value1 = jedis.lpop("java framework");
        System.out.println("List pop: " + value1);

        //再取出所有数据jedis.lrange是按范围取出，
        // 第一个参数是key，第二个参数是起始位置，第三个参数是结束位置，jedis.llen获取长度 -1表示取得所有
        System.out.println(jedis.lrange("java framework", 0, -1));
    }

    /**
     * 对Set操作的命令:
     *      sadd(key, member)：      向名称为key的set中添加元素member
     *      srem(key, member)：      删除名称为key的set中的元素member
     *       spop(key)：              随机返回并删除名称为key的set中一个元素
     *      smove(srckey, dstkey, member)：移到集合元素
     *      scard(key)：             返回名称为key的set的基数
     *      sismember(key, member)：member是否是名称为key的set的元素
     *      sinter(key1, key2,…key N)：  求交集
     *      sinterstore(dstkey, (keys))：求交集并将交集保存到dstkey的集合
     *      sunion(key1, (keys))：       求并集
     *      sunionstore(dstkey, (keys))：求并集并将并集保存到dstkey的集合
     *      sdiff(key1, (keys))：求差集
     *      sdiffstore(dstkey, (keys))： 求差集并将差集保存到dstkey的集合
     *      smembers(key) ：             返回名称为key的set的所有元素
     *      srandmember(key) ：          随机返回名称为key的set的一个元素
     */
    @Test
    public void testSet() {
        //添加
        jedis.sadd("sname", "james");
        jedis.sadd("sname", "jarorwar");
        jedis.sadd("sname", "张建平");
        jedis.sadd("sanme", "noname");
        //移除noname
        jedis.srem("sname", "noname");

        //获取所有加入的value
        System.out.println(jedis.smembers("sname"));

        //判断 james 是否是sname集合的元素
        System.out.println(jedis.sismember("sname", "james"));
        System.out.println(jedis.srandmember("sname"));

        //返回集合的元素个数
        System.out.println(jedis.scard("sname"));
    }


    /**
     * jedis操作key命令:
     *    exists(key)：        确认一个key是否存在
     *    del(key)：           删除一个key
     *    type(key)：          返回值的类型
     *    keys(pattern)：      返回满足给定pattern的所有key
     *    randomkey：          随机返回key空间的一个
     *    rename(oldKey, newKey)：重命名key
     *    dbsize：             返回当前数据库中key的数目
     *    expire：             设定一个key的活动时间（s）
     *    ttl：                获得一个key的活动时间
     *    move(key, dbindex)： 移动当前数据库中的key到dbindex数据库
     *    flushdb：            删除当前选择数据库中的所有key
     *    flushall：           删除所有数据库中的所有key
     *
     * @throws InterruptedException
     */
    @Test
    public void testKey() throws InterruptedException {
        //keys中传入的可以用通配符
        //返回当前库中所有的key  [sose, sanme, name, jarorwar, foo, sname, java framework, user, braand]
        System.out.println(jedis.keys("*"));

        //返回的sname   [sname, name]
        System.out.println(jedis.keys("*name"));

        //删除key为sanmdde的对象  删除成功返回1 删除失败（或者不存在）返回 0
        System.out.println(jedis.del("sanmdde"));

        //返回给定key的有效时间，如果是-1则表示永远有效
        System.out.println(jedis.ttl("sname"));

        //通过此方法，可以指定key的存活（有效时间） 时间为秒
        jedis.setex("timekey", 10, "min");

        //睡眠5秒后，剩余时间将为<=5
        Thread.sleep(5000);

        //输出结果为5
        System.out.println(jedis.ttl("timekey"));

        //设为1后，下面再看剩余时间就是1了
        jedis.setex("timekey", 1, "min");

        //输出结果为1
        System.out.println(jedis.ttl("timekey"));

        //检查key是否存在
        System.out.println(jedis.exists("key"));
        System.out.println(jedis.rename("timekey", "time"));

        //因为移除，返回为null
        System.out.println(jedis.get("timekey"));

        //因为将timekey 重命名为time 所以可以取得值 min
        System.out.println(jedis.get("time"));

        //jedis 排序
        //注意，此处的rpush和lpush是List的操作。是一个双向链表（但从表现来看的）
        //先清除数据，再加入数据进行测试
        jedis.del("a");
        jedis.rpush("a", "1");
        jedis.lpush("a", "6");
        jedis.lpush("a", "3");
        jedis.lpush("a", "9");

        // [9, 3, 6, 1]
        System.out.println(jedis.lrange("a", 0, -1));
        //[1, 3, 6, 9]  //输入排序后结果
        System.out.println(jedis.sort("a"));
        System.out.println(jedis.lrange("a", 0, -1));

    }
}