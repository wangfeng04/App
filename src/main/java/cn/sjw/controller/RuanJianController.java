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
    public Mag ruanJianList(@RequestParam(value = "pageNum",defaultValue = "1") Integer pn){
        if(pn<1){
            pn = 1;
        }
        PageHelper.startPage(pn,5);
        List<RuanJian> ruanJians = ruanJianService.queryRJ();
        PageInfo<RuanJian> pageInfo =new PageInfo<RuanJian>(ruanJians,5);
        //将分页信息传入自定义类的returnData
        return Mag.success().add("pageInfo",pageInfo);
    }

    //根据 ID 查询软件及其历史版本信息
    @ResponseBody
    @PostMapping("/ruanJ/{id}")
    public Mag getRuanJian(@PathVariable("id") Integer id){
        RuanJian ruanJian= ruanJianService.queryRJxx(id);
        List<HistroryRJ> histroryRJS=histroryRJService.selectHistrory(id);

        //ruanJian传不到前端
        return Mag.success().add("ruanJian",ruanJian).add("histroryRJS",histroryRJS);
    }

//根据 ID 修改软件状态
@ResponseBody
@PostMapping("/rj")
   public Mag getBooks(@RequestParam("zhuan")  Integer zhuan,@RequestParam("id")  Integer id){
       int i = ruanJianService.updateZhuantai(id,zhuan);
       if (i>0){
           return Mag.success();
       }else {
           return  Mag.fail();
       }
   }

}
