package cn.sjw.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class FenLei3 {
    /**
     * 三级分类
     */
    private Integer f3id;
    private String leixinName;  //类型名
    private Integer f2id;   //父类id
    private Integer f1id; //父类的父类的id
}
