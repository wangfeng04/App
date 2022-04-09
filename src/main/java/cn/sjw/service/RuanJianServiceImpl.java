package cn.sjw.service;

import cn.sjw.mapper.RuanJianMapper;
import cn.sjw.pojo.RuanJian;
import cn.sjw.service.RuanJianService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RuanJianServiceImpl implements RuanJianService {
    @Autowired
    private RuanJianMapper ruanJianMapper;

    /**
     * 查看软件信息列表
     */
    @Override
    public List<RuanJian> queryRJ() {
        return ruanJianMapper.queryRJ();
    }

    /**
     * 查看软件信息列表   开发者表
     *
     * @param kaifazId
     */
    @Override
    public List<RuanJian> queryRJByKaid(int kaifazId) {
        return ruanJianMapper.queryRJByKaid(kaifazId);
    }

    /**
     * 根据id查询软件信息
     *
     * @param id
     */
    @Override
    public RuanJian queryRJxx(int id) {
        return ruanJianMapper.queryRJxx(id);
    }

    /**
     * 根据id修改软件信息
     *
     * @param ruanJian
     */
    @Override
    public int updateRuanJian(RuanJian ruanJian) {
        return ruanJianMapper.updateRuanJian(ruanJian);
    }

    /**
     * 新增软件信息
     *
     * @param ruanJian
     */
    @Override
    public int addRuanJian(RuanJian ruanJian) {
        return ruanJianMapper.addRuanJian(ruanJian);
    }

    /**
     * 根据id删除软件信息
     *
     * @param id
     */
    @Override
    public int delRuanJian(int id) {
        return ruanJianMapper.delRuanJian(id);
    }

    @Override
    public int delHisRuanJian(int appid) {
        return ruanJianMapper.delHisRuanJian(appid);
    }

    /**
     * 根据id修改软件状态
     *
     * @param id
     */
    @Override
    public int updateZhuantai(int id, int tai) {
        return ruanJianMapper.updateZhuantai(id, tai);
    }

    /**
     * 软件信息模糊查询
     *
     * @param name
     */
    @Override
    public List<RuanJian> selectRuanJian(String name) {
        return ruanJianMapper.selectRuanJian(name);
    }

    /**
     * 根据分类查询软件信息
     *
     * @param f1id
     * @return List<RuanJian>
     */
    @Override
    public List<RuanJian> queryFenlei(int f1id) {
        return ruanJianMapper.queryFenlei(f1id);
    }

    @Override
    public List<RuanJian> queryFenlei(int f1id, int f2id) {
        return ruanJianMapper.queryFenlei(f1id, f2id);
    }

    @Override
    public List<RuanJian> queryFenlei(int f1id, int f2id, int f3id) {
        return ruanJianMapper.queryFenlei(f1id, f2id, f3id);
    }
}
