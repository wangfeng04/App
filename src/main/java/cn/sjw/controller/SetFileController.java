
package cn.sjw.controller;

import cn.sjw.bean.Mag;
import cn.sjw.pojo.RuanJian;
import cn.sjw.service.RuanJianService;
import cn.sjw.util.UploadFileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

@Controller
public class SetFileController {

    @Autowired
    private RuanJianService ruanJianService;
    /**
     *  添加软件信息    文件上传
     *
     * @param ruanJian  将普通字段的数据封装到 User
     * @param file
     * @param request
     * @return
     */
    @ResponseBody
    @PostMapping("/file")
    public Mag addUser(RuanJian ruanJian, @RequestParam("file") MultipartFile file, HttpServletRequest request) throws IOException {
if (!file.isEmpty()) {
    //      获取文件上传的路径
    String realPath = request.getServletContext().getRealPath("/upload");
//      获取文件名
    String filename = file.getOriginalFilename();
    //判断文件的大小和类型
    if (!UploadFileUtils.isImageFile(filename)) {
        return Mag.fail().add("info", "文件类型不匹配！");
    }
//    给上传文件重命名
    filename = UploadFileUtils.imgReName(filename);
 // 创建文件实例            
     File filePath = new File(realPath, filename);
     if (!filePath.getParentFile().exists()) {
     filePath.getParentFile().mkdirs();
     System.out.println("创建目录" + filePath);
     }
     ruanJian.setLuJin("upload/"+filename);

    //写入文件 将上传的文件复制到目录
    file.transferTo(filePath);
}
int i=ruanJianService.addRuanJian(ruanJian);

if (i>0){
       return Mag.success().add("info","软件添加成功！");
}
return Mag.fail();

    }

    /**
     *  更新软件信息    文件上传
     *
     * @param ruanJian  将普通字段的数据封装到 User
     * @param file
     * @param request
     * @return
     */
    @ResponseBody
    @PostMapping("/update")
    public Mag updateRJ(RuanJian ruanJian, @RequestParam("updatefile") MultipartFile file, HttpServletRequest request) throws IOException {
        if (!file.isEmpty()) {
            //      获取文件上传的路径
            String realPath = request.getServletContext().getRealPath("/upload");
//      获取文件名
            String filename = file.getOriginalFilename();
            //判断文件的大小和类型
            if (!UploadFileUtils.isImageFile(filename)) {
                return Mag.fail().add("info", "文件类型不匹配！");
            }
//    给上传文件重命名
            filename = UploadFileUtils.imgReName(filename);
            // 创建文件实例            
            File filePath = new File(realPath, filename);
            if (!filePath.getParentFile().exists()) {
                filePath.getParentFile().mkdirs();
                System.out.println("创建目录" + filePath);
            }
            ruanJian.setLuJin("upload/"+filename);

            //写入文件 将上传的文件复制到目录
            file.transferTo(filePath);
        }
        int i = ruanJianService.updateRuanJian(ruanJian);

        if (i>0){
            return Mag.success().add("info","软件添加成功！");
        }
        return Mag.fail();

    }

}
