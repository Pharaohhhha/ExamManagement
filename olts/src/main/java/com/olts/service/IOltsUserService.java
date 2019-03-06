package com.olts.service;

import com.olts.vo.OltsUser;

/**
 * Created by 123 on 2018/10/7.
 */
public interface IOltsUserService {

    OltsUser selectByLogin(OltsUser user);

}
