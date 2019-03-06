package com.lanqiao.mapper;

import com.lanqiao.vo.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2018/10/14.
 */
@Repository
public interface UserMapper {

    List<User> selectAll(@Param("pageNum") int pageNum,
                         @Param("pageSize") int pageSize);
}
