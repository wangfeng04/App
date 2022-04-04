package cn.sjw.mapper;


import cn.sjw.pojo.HistroryRJ;

import java.util.List;

public interface HistroryRJMapper {
    /**
     * 查询软件历史数据
     */
//    List<HistroryRJ> queryHistrory();
    /**
     *查询软件历史数据
     */
    List<HistroryRJ> selectHistrory(int appid);


}
