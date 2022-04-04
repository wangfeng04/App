package cn.sjw.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class HistroyRJxxDTO extends HistroryRJ {

    private ZhuanTai2 zhuanTai2;    //状态的外键
    private User user;              //开发者ID的外键


    @Override
    public String toString() {
        return super.toString()+"HistroyRJxxDTO{" +
                "zhuanTai2=" + zhuanTai2 +
                ", user=" + user +
                '}';
    }
}
