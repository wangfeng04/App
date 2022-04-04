package cn.sjw.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.validation.constraints.Max;
import javax.validation.constraints.Pattern;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Books {
    private   Integer id;           //书id
    @Pattern(regexp = "^[A-Za-z0-9_\\u2E80-\\u9FFF]{1,50}$",message = "中英文混合之后不能出现特殊字符！")
    private   String bookName ;      //书名
    @Max(value = 9999,message = "数量不能大于9999")
    private   Integer   bookCounts;  //数量
    @Pattern(regexp = "^[A-Za-z0-9_\\u2E80-\\u9FFF]{5,100}$",message = "描述信息必须在5-100个字之内！")
    private   String detail;         //描述
}
