package cn.sjw.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class RJxxDTO extends RuanJian {
    private FenLei1 fenLei1;        //一级分类的外键
    private FenLei2 fenLei2;        //二级分类的外键
    private FenLei3 fenLei3;        //三级分类的外键
    private ZhuanTai zhuanTai;                  //状态的外键
    private Pintai pintai;                      //所属平台的外键
    private User user;                          //开发者ID的外键


    @Override
    public String toString() {
        return super.toString() + "RJxxDTO{" +
                "fenLei1=" + fenLei1 +
                ", fenLei2=" + fenLei2 +
                ", fenLei3=" + fenLei3 +
                ", zhuanTai=" + zhuanTai +
                ", pintai=" + pintai +
                ", user=" + user +
                '}';
    }
}
