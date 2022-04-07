package cn.sjw.service;

import cn.sjw.mapper.HistroryRJMapper;
import cn.sjw.pojo.HistroryRJ;
import cn.sjw.service.HistroryRJService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HistroryRJServiceImpl implements HistroryRJService {
    @Autowired
    private HistroryRJMapper histroryRJMapper;
    /**
     * 查询软件历史数据
     *
     * @param appid
     */
    @Override
    public List<HistroryRJ> selectHistrory(int appid) {

        return histroryRJMapper.selectHistrory(appid);
    }
}
