package cn.sjw.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class FenLei2 {
    /**
     * 二级分类
     */
    private Integer f2id;
    private String leixinName;  //类型名
    private Integer f1id;      //父类id

}
