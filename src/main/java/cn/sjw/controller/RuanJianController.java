package cn.sjw.controller;

import cn.sjw.bean.Mag;
import cn.sjw.pojo.HistroryRJ;
import cn.sjw.pojo.RuanJian;
import cn.sjw.service.HistroryRJService;
import cn.sjw.service.RuanJianService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
public class RuanJianController {
    @Autowired
    private RuanJianService ruanJianService;
    private HistroryRJService histroryRJService;

    /**
     * 查询软件信息列表
     *
     * @return
     */

    //    查询所有软件信息
    @ResponseBody
    @GetMapping("/list")
    public Mag ruanJianList(@RequestParam(value = "pageNum", defaultValue = "1") Integer pn) {
        if (pn < 1) {
            pn = 1;
        }
        PageHelper.startPage(pn, 5);
        List<RuanJian> ruanJians = ruanJianService.queryRJ();
        PageInfo<RuanJian> pageInfo = new PageInfo<RuanJian>(ruanJians, 5);
        //将分页信息传入自定义类的returnData
        return Mag.success().add("pageInfo", pageInfo);
    }

    //根据 ID 查询软件及其历史版本信息

    @ResponseBody
    @GetMapping("/ruanJ/{id}")
    public Mag  getRuanJian(@PathVariable("id") Integer id) {
        System.out.println("id="+id);
        RuanJian ruanJian = ruanJianService.queryRJxx(id);
//        List<HistroryRJ> histroryRJS = histroryRJService.selectHistrory(id);
        //ruanJian传不到前端
        return Mag.success().add("ruanJian",ruanJian);
    }

    //根据 ID 查询软件历史版本信息
    @ResponseBody
    @GetMapping("/histry/{id}")
    public Mag  getHisRuanJian(@PathVariable("id") Integer id,@RequestParam(value = "pageNum", defaultValue = "1") Integer pn) {
        System.out.println("id="+id);
        List<HistroryRJ> histroryRJS = histroryRJService.selectHistrory(id);
        return Mag.success().add("histroryRJS",histroryRJS);
    }

    //根据 ID 修改软件状态   通过
    @ResponseBody
    @GetMapping("/ruanjian/{id}")
    public Mag getRJ(@PathVariable("id") Integer id) {
        System.out.println("id="+id);
        int tai=2;
        int i = ruanJianService.updateZhuantai(id, tai);
        System.out.println("i="+i);
        if (i > 0) {
            return Mag.success();
        } else {
            return Mag.fail();
        }
    }
    //根据 ID 修改软件状态  不通过
    @ResponseBody
    @GetMapping("/rj/{id}")
    public Mag getRJs(@PathVariable("id") Integer id) {
        System.out.println("id="+id);
       int tai=3;
        int i = ruanJianService.updateZhuantai(id, tai);
        System.out.println("i="+i);
        if (i > 0) {
            return Mag.success();
        } else {
            return Mag.fail();
        }
    }

}
