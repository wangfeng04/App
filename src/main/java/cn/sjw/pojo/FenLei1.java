package cn.sjw.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class FenLei1 {
    /**
     * 一级分类
     */
    private Integer f1id;
    private String leixinName;  //类型名
}
