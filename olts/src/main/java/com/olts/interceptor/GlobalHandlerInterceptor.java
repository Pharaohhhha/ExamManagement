package com.olts.interceptor;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author 张建平 on 2018/10/6 10:51
 */
// @Component("globalInterceptor")
public class GlobalHandlerInterceptor implements HandlerInterceptor {

    static Logger logger = Logger.getLogger(GlobalHandlerInterceptor.class);

    /**
     * 预处理
     * 该方法在行为（业务控制器的处理方法）执行前执行，可以实现对数据的预处理，比如：编码、安全控制等。
     * 如果方法返回true，则继续执行action。
     *
     * @param request
     * @param response
     * @param handler - org.springframework.web.method.HandlerMethod
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        logger.debug("preHandle(request, response, handler): 该方法在行为（业务控制器的处理方法）执行前执行，可以实现对数据的预处理，比如：编码、安全控制等。\n" +
                "如果方法返回true，则继续执行action。");
        logger.debug("Object handler --->" + handler.getClass().getName());
        return true;
    }

    /**
     * 后处理
     * 该方法在行为（业务控制器的处理方法）执行后，生成视图前执行。所以在这里，我们有机会（如果需要）修改视图层数据。
     *
     * @param request
     * @param response
     * @param handler
     * @param modelAndView
     * @throws Exception
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView)
            throws Exception {
        logger.debug("postHandle(request, response, handler, modelAndView): 该方法在行为（业务控制器的处理方法）执行后，生成视图前执行。" +
                "所以在这里，我们有机会（如果需要）修改视图层数据。");
    }

    /**
     * 最终处理
     *
     * @param request
     * @param response
     * @param handler
     * @param ex
     * @throws Exception
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        logger.debug("afterCompletion(request, response, handler, ex): 最后执行，通常用于资源释放，异常处理。我们可以根据ex是否为空，来进行相关的异常处理。" +
                "因为我们在平时处理异常时，都是从底层向上抛出异常，最后到了spring框架从而到了这个方法中。");
    }
}
