package com.olts.service.impl;

import com.olts.mapper.OltsUserMapper;
import com.olts.service.IOltsUserService;
import com.olts.vo.OltsUser;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by 123 on 2018/10/7.
 */

@Service("oltsUserService")
public class OltsUserServiceImpl implements IOltsUserService {

    static Logger logger = Logger.getLogger(OltsUserServiceImpl.class);

    // controller --> service (数据库事务要加到service层，为什么？) --> mapper --> sql statement id
    @Resource // byName
    // @Autowired  //默认byType
    private OltsUserMapper oltsUserMapper;

    @Override
    public OltsUser selectByLogin(OltsUser user) {

        return oltsUserMapper.selectByLogin(user);
    }
}
