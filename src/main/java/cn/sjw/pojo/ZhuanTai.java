package cn.sjw.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ZhuanTai {
    /**
     * 状态类
     */
    private Integer id;
    private Integer tai;//状态(1 待审核 ,2 审核通过 ,3 审核未通过 4 已上架，5 已下架)
}
