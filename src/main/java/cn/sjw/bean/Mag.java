package cn.sjw.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.HashMap;
import java.util.Map;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Mag {


//        状态码
//        100  失败
//        200 成功

        private Integer code;
//        提示信息

        private String info;
        /**
         * 返回的数据
         */
        private Map<String,Object> returnData = new HashMap<String,Object>();


//        成功时

        public static Mag success(){
            Mag result = new Mag();
            result.setCode(200);
            result.setInfo("操作成功!!!");
            return result;
        }

        //  失败时

        public static Mag fail(){
            Mag result = new Mag();
            result.setCode(100);
            result.setInfo("操作失败!!!");
            return result;
        }

        /**
         * 给返回数据赋值
         * @param key map的键值
         * @param value map的value值
         * @return
         */
        public Mag add(String key,Object value){
            this.returnData.put(key,value);
            return  this;
        }
    }

