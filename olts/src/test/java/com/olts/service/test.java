package com.olts.service;

import com.github.pagehelper.Page;
import com.olts.vo.SmdQuestions;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by zhangzhenjie on 2018/10/9.
 */

@ContextConfiguration("classpath:applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class test {
    @Autowired
    ISmdQuestionsService smdQuestionService;

    @Test
    public void test() throws Exception {
        SmdQuestions sq = new SmdQuestions();
        sq.setQuestionType(1);

        Page<SmdQuestions > page=(Page<SmdQuestions>) smdQuestionService.selectBySelective(sq,1,2);
        for (SmdQuestions smdQuestions : page) {
            System.out.println(smdQuestions);
        }
    }

    @Test
    public void  testUpdate() throws  Exception{
        SmdQuestions sq = new SmdQuestions();
        sq.setDescrpt("11111");
        sq.setId(3);
        int i=smdQuestionService.update(sq);
        System.out.println(i==1?  "true":"false");
    }

    @Test
    public void delete() throws Exception {
        SmdQuestions sq = new SmdQuestions();
        sq.setId(2);
        int i=smdQuestionService.delete(2);
        System.out.println(i==1?  "true":"false");
    }
}
