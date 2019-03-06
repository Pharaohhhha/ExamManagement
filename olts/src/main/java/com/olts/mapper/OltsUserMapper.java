/**
 * 
 */
package com.olts.mapper;

import com.olts.vo.OltsUser;
import org.springframework.stereotype.Repository;

/**
 * @author Administrator
 *
 */
@Repository
public interface OltsUserMapper{

    OltsUser selectByLogin(OltsUser user);
	
}
