package cn.sjw.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.Email;
import java.util.Date;
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class User {
   private Integer id;
    private String uName;
    private String pwd;
    @Email
    private String email;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthday;
    private String pic;
    private Integer sex;
    private String phone;

}
