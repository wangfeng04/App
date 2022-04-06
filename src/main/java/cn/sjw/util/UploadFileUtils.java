package cn.sjw.util;

import java.util.Arrays;
import java.util.UUID;

/**
 * @author zzj
 */
public class UploadFileUtils {
    /**
     * 判断文件是否是图片
     *
     * @param fileName
     * @return
     */
    public static boolean isImageFile(String fileName) {
        boolean b;
        //文件名称为空
        if (fileName == null) {
            return false;
        }
        //获取文件后缀名
        String tmpName = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length());
        //文件后缀名的 数组
        String[] imgArray = {"jpg", "gif", "bmp", "png", "jpeg"};

        b = Arrays.asList(imgArray).contains(tmpName);

        return b;
    }


    public static String imgReName(String fileName) {
        String tmpName = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length());
        String uuid = UUID.randomUUID().toString().replace("-", "");

        return uuid + "." + tmpName;
    }
}

