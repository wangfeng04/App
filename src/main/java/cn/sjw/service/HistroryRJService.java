package cn.sjw.service;

import cn.sjw.pojo.HistroryRJ;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HistroryRJService {
    /**
     * 查询软件历史数据
     */
    List<HistroryRJ> selectHistrory(int appid);
}
