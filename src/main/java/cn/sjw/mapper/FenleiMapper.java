package cn.sjw.mapper;

import cn.sjw.pojo.FenLei1;
import cn.sjw.pojo.FenLei2;
import cn.sjw.pojo.FenLei3;

import java.util.List;

public interface FenleiMapper {
    //一级分类   下拉框  选择时传回 该分类的id
    List<FenLei1> queryF1();

    //二级分类   下拉框  选择时传回 该分类的id
    List<FenLei2> queryF2(int f1id);

    //三级分类   下拉框  选择时传回 该分类的id
    List<FenLei3> queryF3(int f1id, int f2id);
}
