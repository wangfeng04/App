package cn.sjw.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ZhuanTai2 {
    private Integer id;
    private String tai2 ;     //状态 1,2 预发布 3已发布 4,5不发布
    private Integer tai1Id  ; // zhuantai的id

}
