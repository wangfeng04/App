package cn.sjw.mapper;


import cn.sjw.pojo.HistroryRJ;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HistroryRJMapper {
    /**
     * 查询软件历史数据
     */
    List<HistroryRJ> selectHistrory(@Param("appid") int appid);


}
