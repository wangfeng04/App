package cn.sjw.service;

import cn.sjw.mapper.FenleiMapper;
import cn.sjw.pojo.FenLei1;
import cn.sjw.pojo.FenLei2;
import cn.sjw.pojo.FenLei3;
import cn.sjw.service.FenLeiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FenLeiServiceImpl implements FenLeiService {
    @Autowired
    private FenleiMapper fenleiMapper;
    /**
     * 一级分类   下拉框  选择时传回 该分类的id
     */
    @Override
    public List<FenLei1> queryF1() {
        return fenleiMapper.queryF1();
    }

    /**
     * 二级分类   下拉框  选择时传回 该分类的id
     *
     * @param f1id
     */
    @Override
    public List<FenLei2> queryF2(int f1id) {
        return fenleiMapper.queryF2(f1id);
    }

    /**
     * 三级分类   下拉框  选择时传回 该分类的id
     *
     * @param f1id
     * @param f2id
     */
    @Override
    public List<FenLei3> queryF3(int f1id, int f2id) {
        return fenleiMapper.queryF3(f1id,f2id);
    }
}
