package cn.sjw.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class RuanJian {
    /**
     * 软件版本信息
     */
    private Integer id;
    @NotNull
    private String appName;                         //软件名称
    @Pattern(regexp = "^[\\w\\d_\\+\\.]+$", message = "英文数字下划线,加号及点组合，不能有特殊字符！")
    private String APKName;                         //APK名称（安装包名）
    private Double appSize;                         //软件大小
    @NotNull
    private Integer kaifazId;                        //开发者id
    @NotNull
    private Integer appPinTai;                       //所属平台
    @NotNull
    private Integer onefenLei;                       //一级分类
    @NotNull
    private Integer twofenlei;                       //二级分类
    @NotNull
    private Integer threefenli;                      //三级分类

    private Integer tai;                             //状态(1 待审核 ,2 审核通过 ,3 审核未通过 )
    private Integer xzCS;                            //下载次数
    @NotNull
    private String bbH;                             //最新版本号
    @Pattern(regexp = "^[A-Za-z0-9_\\u2E80-\\u9FFF]{5,100}$", message = "描述信息必须在5-100个字之内！")
    private String appDetail;                       //软件介绍

    private String LuJin;                           //下载路径


}
