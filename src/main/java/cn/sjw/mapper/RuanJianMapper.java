package cn.sjw.mapper;

import cn.sjw.pojo.RuanJian;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RuanJianMapper {
    //查看软件信息列表    审核表
    List<RuanJian> queryRJ();
    //查看软件信息列表   开发者表
    List<RuanJian> queryRJByKaid(@Param("kaifazId") int kaifazId);
    //根据id查询软件信息
    RuanJian queryRJxx(@Param("id") int id);

    //根据id修改软件信息
    int updateRuanJian(RuanJian ruanJian);

    //新增软件信息
    int addRuanJian(RuanJian ruanJian);

    //根据id删除软件信息
    int delRuanJian(@Param("id") int id);
    int delHisRuanJian(@Param("appid") int appid);

    //根据id修改软件状态
    int updateZhuantai(@Param("id")int id,@Param("tai") int tai);

    //软件信息模糊查询
    List<RuanJian> selectRuanJian(String name);

    /**
     * 根据分类查询软件信息
     *
     * @param queryFenlei(int f1id)  一级分类
     * @return List<RuanJian>
     */
    List<RuanJian> queryFenlei(int f1id);

    /**
     * 根据分类查询软件信息
     *
     * @param queryFenlei(int f1id,int f2id)   二级分类
     * @return List<RuanJian>
     */
    List<RuanJian> queryFenlei(int f1id, int f2id);

    /**
     * 根据分类查询软件信息
     *
     * @param queryFenlei(int f1id,int f2id,int f3id)   三级分类
     * @return List<RuanJian>
     */
    List<RuanJian> queryFenlei(int f1id, int f2id, int f3id);

}
