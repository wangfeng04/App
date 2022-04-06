package cn.sjw.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class HistroryRJ {
    /**
     * 软件历史版本信息
     */
    private Integer id;
    private String appid;        //软件ID
    private String appName;      //历史软件名称
    private String APKName;      //历史APK名称
    private Double appSize;     //历史软件大小
    private Integer kaifazId;     //开发者ID
    private Integer zhantai;      //状态 6 不发布 7 已发布 8 预发布
    private String bbH;          //历史版本号
    private String appDetail;    //历史软件简介
    private String LuJin;        //下载路径

    private ZhuanTai2 zhuanTai2;    //状态的外键
    private User user;              //开发者ID的外键


}
