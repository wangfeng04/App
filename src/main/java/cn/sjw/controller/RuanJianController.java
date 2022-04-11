package cn.sjw.controller;

import cn.sjw.bean.Mag;
import cn.sjw.pojo.HistroryRJ;
import cn.sjw.pojo.RuanJian;
import cn.sjw.service.HistroryRJService;
import cn.sjw.service.RuanJianService;
import cn.sjw.util.UploadFileUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class RuanJianController {
    @Autowired
    private RuanJianService ruanJianService;
    @Autowired
    private HistroryRJService histroryRJService;

    /**
     * 查询软件信息列表
     *
     * @return
     */

    //    查询所有软件信息    审核表
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
    //    查询所有软件信息
    @ResponseBody
    @GetMapping("/hstry")
    public Mag ruanJianList(@RequestParam(value = "pageNum", defaultValue = "1") Integer pn, HttpServletRequest request) {
        if (pn < 1) {
            pn = 1;
        }
        HttpSession session=request.getSession();
        Integer id= (Integer) session.getAttribute("kaifazId");
        PageHelper.startPage(pn, 5);
        List<RuanJian> ruanJians = ruanJianService.queryRJByKaid(id);
        PageInfo<RuanJian> pageInfo = new PageInfo<RuanJian>(ruanJians, 5);
        //将分页信息传入自定义类的returnData
        return Mag.success().add("pageInfo", pageInfo);
    }

    //根据 ID 查询软件信息
    @ResponseBody
    @GetMapping("/ruanJ/{id}")
    public Mag  getRuanJian(@PathVariable("id") Integer id) {
        System.out.println("id="+id);
        RuanJian ruanJian = ruanJianService.queryRJxx(id);
        return Mag.success().add("ruanJian",ruanJian);
    }

    //根据 ID 查询软件历史版本信息
    @ResponseBody
    @GetMapping("/histry/{appid}")
    public Mag  getHisRuanJian(@PathVariable("appid") Integer appid) {

        List<HistroryRJ> histroryRJS = histroryRJService.selectHistrory(appid);

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
    //根据 ID 修改软件状态   上架
    @ResponseBody
    @GetMapping("/shanjia/{id}")
    public Mag ShanJia(@PathVariable("id") Integer id) {
        System.out.println("id="+id);
        int tai=4;
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
    //根据 ID 修改软件状态  下架
    @ResponseBody
    @GetMapping("/xiajia/{id}")
    public Mag XiaJia(@PathVariable("id") Integer id) {
        System.out.println("id="+id);
        int tai=5;
        int i = ruanJianService.updateZhuantai(id, tai);
        System.out.println("i="+i);
        if (i > 0) {
            return Mag.success();
        } else {
            return Mag.fail();
        }
    }

    //删除图书
    @ResponseBody
    @RequestMapping(value = "/delete/{id}",method = RequestMethod.DELETE)
    public Mag deleteBook(@PathVariable("id") Integer id){
        int appid=id;

        int n=ruanJianService.delHisRuanJian(appid);
        int i = ruanJianService.delRuanJian(id);
        if (n>0){
            if (i>0) {
                return Mag.success().add("msg", "success");
            }
        }
        return Mag.fail().add("msg","error");
    }






}
