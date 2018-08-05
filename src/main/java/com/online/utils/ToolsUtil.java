package com.online.utils;

import org.apache.log4j.Logger;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.ContextHolderUtils;
import org.jeecgframework.core.util.NumberComparator;
import org.jeecgframework.web.system.manager.ClientManager;
import org.jeecgframework.web.system.pojo.base.Client;
import org.jeecgframework.web.system.pojo.base.TSFunction;
import org.jeecgframework.web.system.pojo.base.TSUser;
import org.jeecgframework.web.system.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by aaronqin on 18/7/15.
 */
public class ToolsUtil {
    private Logger log = Logger.getLogger(ToolsUtil.class);
    @Autowired
    private SystemService systemService;

    /**
     * 获取权限的map
     *
     * @param user
     * @return
     */
    public Map<Integer, List<TSFunction>> getFunctionMap(TSUser user) {
        HttpSession session = ContextHolderUtils.getSession();
        Client client = ClientManager.getInstance().getClient(session.getId());
        if (client.getFunctionMap() == null || client.getFunctionMap().size() == 0) {
            Map<Integer, List<TSFunction>> functionMap = new HashMap<Integer, List<TSFunction>>();
            Map<String, TSFunction> loginActionlist = getUserFunction(user);
            if (loginActionlist.size() > 0) {
                Collection<TSFunction> allFunctions = loginActionlist.values();
                for (TSFunction function : allFunctions) {
                    if(function.getFunctionType().intValue()== Globals.Function_TYPE_FROM.intValue()){
                        //如果为表单或者弹出 不显示在系统菜单里面
                        continue;
                    }
                    if (!functionMap.containsKey(function.getFunctionLevel() + 0)) {
                        functionMap.put(function.getFunctionLevel() + 0,
                                new ArrayList<TSFunction>());
                    }
                    functionMap.get(function.getFunctionLevel() + 0).add(function);
                }
                // 菜单栏排序
                Collection<List<TSFunction>> c = functionMap.values();
                for (List<TSFunction> list : c) {

                    for (TSFunction function : list) {
                        //如果有子级菜单 则地址设为空
                        if(function.hasSubFunction(functionMap))function.setFunctionUrl("");
                    }

                    Collections.sort(list, new NumberComparator());
                }
            }
            client.setFunctionMap(functionMap);

            //清空变量，降低内存使用
            loginActionlist.clear();

            return functionMap;
        }else{
            return client.getFunctionMap();
        }
    }

    /**
     * 获取用户菜单列表
     *
     * @param user
     * @return
     */
    private Map<String, TSFunction> getUserFunction(TSUser user) {
        HttpSession session = ContextHolderUtils.getSession();
        Client client = ClientManager.getInstance().getClient(session.getId());

        if (client.getFunctions() == null || client.getFunctions().size() == 0) {

            Map<String, TSFunction> loginActionlist = new HashMap<String, TSFunction>();

			 /*String hql="from TSFunction t where t.id in  (select d.TSFunction.id from TSRoleFunction d where d.TSRole.id in(select t.TSRole.id from TSRoleUser t where t.TSUser.id ='"+
	           user.getId()+"' ))";
	           String hql2="from TSFunction t where t.id in  ( select b.tsRole.id from TSRoleOrg b where b.tsDepart.id in(select a.tsDepart.id from TSUserOrg a where a.tsUser.id='"+
	           user.getId()+"'))";
	           List<TSFunction> list = systemService.findHql(hql);
	           log.info("role functions:  "+list.size());
	           for(TSFunction function:list){
	              loginActionlist.put(function.getId(),function);
	           }
	           List<TSFunction> list2 = systemService.findHql(hql2);
	           log.info("org functions: "+list2.size());
	           for(TSFunction function:list2){
	              loginActionlist.put(function.getId(),function);
	           }*/

            StringBuilder hqlsb1=new StringBuilder("select distinct f from TSFunction f,TSRoleFunction rf,TSRoleUser ru  ").append("where ru.TSRole.id=rf.TSRole.id and rf.TSFunction.id=f.id and ru.TSUser.id=? ");

            StringBuilder hqlsb2=new StringBuilder("select distinct c from TSFunction c,TSRoleFunction rf,TSRoleOrg b,TSUserOrg a ")
                    .append("where a.tsDepart.id=b.tsDepart.id and b.tsRole.id=rf.TSRole.id and rf.TSFunction.id=c.id and a.tsUser.id=?");
            //TODO hql执行效率慢 为耗时最多地方

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            log.info("================================开始时间:"+sdf.format(new Date())+"==============================");
            long start = System.currentTimeMillis();
            List<TSFunction> list1 = systemService.findHql(hqlsb1.toString(),user.getId());
            List<TSFunction> list2 = systemService.findHql(hqlsb2.toString(),user.getId());
            long end = System.currentTimeMillis();
            log.info("================================结束时间:"+sdf.format(new Date())+"==============================");
            log.info("================================耗时:"+(end-start)+"ms==============================");
            for(TSFunction function:list1){
                loginActionlist.put(function.getId(),function);
            }
            for(TSFunction function:list2){
                loginActionlist.put(function.getId(),function);
            }
            client.setFunctions(loginActionlist);

            //清空变量，降低内存使用
            list2.clear();
            list1.clear();

        }
        return client.getFunctions();
    }
}
