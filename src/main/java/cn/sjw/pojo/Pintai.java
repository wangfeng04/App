package cn.sjw.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Pintai {
    /**
     * 平台类
     */
    private Integer id;
    private String pintai;//平台 1 手机  2 平板  3 通用
}
