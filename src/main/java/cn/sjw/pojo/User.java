package cn.sjw.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.validation.constraints.Pattern;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class User {
    /**
     * 用户类
     *  @Pattern(regexp = "^[A-Za-z0-9]+$",message = "以字母开头，长度在6~18之间，只能包含字母、数字和下划线！")
     */
    private Integer  id;        //用户id
    @Pattern(regexp = "^[A-Za-z0-9_]+$",message = "英文数字下划线组合，不能有其他字符！")
    private String   userName; //用户名
    @Pattern(regexp = "^[A-Za-z0-9]+$",message = "只能由字母和数字组成！")
    private String   passward;  //密码
    private Integer  quanXian;  //权限 0 开发者；1 超级管理员


}
