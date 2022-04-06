package cn.sjw.controller;

//
//import cn.sjw.bean.Mag;
//import cn.sjw.pojo.RuanJian;
//import com.github.pagehelper.PageHelper;
//import com.github.pagehelper.PageInfo;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//
//import org.springframework.validation.BindingResult;
//import org.springframework.validation.FieldError;
//import org.springframework.web.bind.annotation.*;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.validation.Valid;
//import java.io.IOException;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//@Controller
public class RestController {
}
//    @Autowired
//   private BooksService booksService;
//    @GetMapping("/gotoBooks")
//    public void gotoBooks(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.getRequestDispatcher("WEB-INF/jsp/booklist.jsp").forward(request,response);
//    }
//
////    查询所有书籍信息
//    @ResponseBody
//    @GetMapping("/list")
//    public Mag books(@RequestParam(value = "pageNum",defaultValue = "1") Integer pn){
//        if(pn<1){
//            pn = 1;
//        }
//        PageHelper.startPage(pn,5);
//        List<Books> books = booksService.queryAllBook();
//        PageInfo<Books> booksPageInfo =new PageInfo<Books>(books,5);
//        //将分页信息传入自定义类的returnData
//        return Mag.success().add("booksPageInfo",booksPageInfo);
//    }
//    /**
//     *   添加书籍信息
//     * @param books  要校验的数据  要加 @Valid注解
//     * @param result  校验的结果
//     * @return
//     */
//    @ResponseBody
//    @PostMapping("/add")
//    public Mag bookAdd(@Valid RuanJian books, BindingResult result){
//        //创建一个错误的map集合
//        Map<String,Object> errorMap = new HashMap<String,Object>();
//        if(result.hasErrors()){
//            List<FieldError> errors = result.getFieldErrors();
//            for (FieldError error : errors) {
//                System.out.println("error fildes："+error.getField());
//                System.out.println("error info："+error.getDefaultMessage());
//                //将字段名称作为Key 错误提示信息作为 value 存入map
//                errorMap.put(error.getField(),error.getDefaultMessage());
//            }
//            //将错误信息的map加入到返回的Msg中返回给页面
//            return Mag.fail().add("errorMap",errorMap);
//        }else {
//            int i = booksService.addBook(books);
//            return Mag.success();
//        }
//
//    }
//
////根据 ID 查询图书信息
//@ResponseBody
//@GetMapping("/book/{id}")
//   public Mag getBooks(@PathVariable("id") Integer id){
//       RuanJian book= booksService.queryBookById(id);
//        return Mag.success().add("book",book);
//   }
////更新图书
//    @ResponseBody
//    @RequestMapping(value = "/book",method = RequestMethod.PUT)
//    public Mag getBook(@Valid Books book, BindingResult result){
//        //创建一个错误的map集合
//        Map<String,Object> errorMap = new HashMap<String,Object>();
//        if(result.hasErrors()){
//            List<FieldError> errors = result.getFieldErrors();
//            for (FieldError error : errors) {
//                System.out.println("error fildes："+error.getField());
//                System.out.println("error info："+error.getDefaultMessage());
//                //将字段名称作为Key 错误提示信息作为 value 存入map
//                errorMap.put(error.getField(),error.getDefaultMessage());
//            }
//            //将错误信息的map加入到返回的Msg中返回给页面
//            return Mag.fail().add("errorMap",errorMap);
//        }else {
//
//            int i = booksService.updateBook(book);
//                return Mag.success();
//        }
//    }
//
//    //删除图书
//    @ResponseBody
//    @RequestMapping(value = "/book/{id}",method = RequestMethod.DELETE)
//    public Mag deleteBook(@PathVariable("id") Integer id){
//        int i = booksService.deleteBookById(id);
//        if (i>0){
//            return Mag.success().add("msg","success");
//        }
//        return Mag.fail().add("msg","error");
//    }
//
//}

